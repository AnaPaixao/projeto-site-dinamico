<?php
require __DIR__ . '/DB/Connect.php';
/** @var $db PDO */
$db = Connect::getInstance();

// Filtrando dados informados pelo usuario:
$login = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRIPPED);


$erro = false;


// Para continuar mostrando o e-mail após uma tentativa de logar:
$email = $login['email'];

if (!empty($_POST)) {

    if (in_array("", $login)) {
        if (empty($login['email'])) {
            $erros['email_vazio'] = true;
        }

        if (empty($login['email'])) {
            $erros['senha_vazio'] = true;
        }
    } else {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $erros['email_invalido'] = true;
        } else {
            $stmt = $db->prepare("SELECT senha FROM profissional WHERE email = :email");
            $stmt->bindParam(":email", $login['email']);
            $stmt->execute();
            if ($stmt->rowCount() != 0){ 
                $senha = $stmt->fetch()->senha;
                
                if(!password_verify($login['password'], $senha)){
                    $erro = true;
                }
                
            } else {
                $erro = true;
            }
        }
        
        if(empty($erros) && !$erro){
                    
            $stmt = $db->prepare("SELECT * FROM profissional WHERE email = :email and senha = :senha");
            $stmt->bindParam(":email", $login['email']);
            $stmt->bindParam(":senha", $senha);
            $stmt->execute();
            
            if($stmt->rowCount() == 0){
                $erro = true;
            } else {
                var_dump($stmt->fetch());
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Font-->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Archivo:ital,wght@0,400;1,700&family=Poppins:wght@400;600&display=swap" rel="stylesheet"> 
        <!--CSS-->
        <link rel="stylesheet" href="./styles/index.css" />
        <link rel="stylesheet" href="./styles/login.css" />

        <title>Empresa - Página Login</title>
    </head>

    <body>
        <main class="form-container">
            <h1>Login</h1>
            <h2>Preencha os campos com os mesmos dados do seu cadastro</h2>

            <form action="<?= $_SERVER['PHP_SELF'] ?>" method="post">
                <label for="email">E-mail</label>
                <input type="text" name="email" id="email" value="<?= !empty($email) ? $email : "" ?>">

                <label for="password">Senha</label>
                <input type="password" name="password" id="password">

                <?= ($erro == true) ? "<p class='error-login'><strong>Usuário ou senha inválido</strong></p>" : "" ?>
                <?= isset($erros['email_invalido']) ? "<p class='error-login'><strong>O email inserido não é válido.</strong></p>" : "" ?>
                <?= isset($erros['email_vazio']) ? "<p class='error-login'><strong>Você deve preencher o email!</strong></p>" : "" ?>
                <?= isset($erros['senha_vazio']) ? "<p class='error-login'><strong>Você deve preencher a senha!</strong></p>" : "" ?>

                <button>Log in</button>
            </form>

            <p>Não tem uma conta ainda ? <a href="./cadastro-servico.php">Cadastre-se</a></p>
        </main>
    </body>

</html>