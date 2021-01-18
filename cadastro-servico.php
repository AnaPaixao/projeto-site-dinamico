<?php

session_start();

require __DIR__ . '/DB/Connect.php';
$db = Connect::getInstance();

$profissoes = $db->query("SELECT * FROM profissao ORDER BY nome ASC")->fetchAll();


$dados = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRIPPED);

$input = [
    'nome' => '',
    'sobrenome' => '',
    'email' => '',
    'telefone' => '',
    'cep' => '',
    'profissao' => ''
];


if (!empty($dados)) {

    $input['nome'] = $dados['nome'];
    $input['sobrenome'] = $dados['sobrenome'];
    $input['email'] = $dados['email'];
    $input['telefone'] = $dados['telefone'];
    $input['cep'] = $dados['cep'];

    // ERROS
    $erros = [];

    if (in_array("", $dados)) {
        if (empty($dados['nome'])) {
            $erros['nome'] = true;
        }

        if (empty($dados['sobrenome'])) {
            $erros['sobrenome'] = true;
        }

        if (empty($dados['email'])) {
            $erros['email'] = true;
        }

        if (empty($dados['telefone'])) {
            $erros['telefone'] = true;
        }

        if (empty($dados['cep'])) {
            $erros['cep'] = true;
        }

        if (empty($dados['profissao'])) {
            $erros['profissao'] = true;
        }

        if (empty($dados['senha'])) {
            $erros['senha'] = true;
        }

        if (empty($dados['confirma_senha'])) {
            $erros['confirma_senha'] = true;
        }
    } else {
        
        // Valida Email
        
        if (!filter_var($dados['email'], FILTER_VALIDATE_EMAIL)) {
            $erros['email_invalido'] = true;
        } else {
            $stmt = $db->prepare("SELECT * FROM profissional WHERE email = :email");
            $stmt->bindParam(":email", $dados['email'], PDO::PARAM_STR);
            $stmt->execute();
            if($stmt->rowCount() != 0){
                $erros['email_existente'] = true;
            }
        }
        
        // Valida Tamanho da Senha

        if (strlen($dados['senha']) < 8) {
            $erros['senha_pequena'] = true;
        } elseif(strcmp($dados['senha'], $dados['confirma_senha']) != 0) {
            $erros['senha_diferente'] = true;
        } else {
            $dados['senha'] = password_hash($dados['senha'], PASSWORD_DEFAULT);
        }
        
        // Verifica se o formato do telefone é válido (21) 99999-9999

        if(preg_match("/\([0-9]{2}\)[\s][0-9]{5}-[0-9]{4}/", $dados['telefone']) != 1){
            $erros['telefone_invalido'] = true;
        }
        
        // Verifica se o formato do cep é válido

        if(preg_match("/^[0-9]{5}-[0-9]{3}/", $dados['cep']) != 1){
            $erros['cep_formato'] = true;
        } else {
            $viacep = file_get_contents("https://viacep.com.br/ws/{$dados['cep']}/json/");
            if(!isset(json_decode($viacep)->erro)){
                $dados['bairro'] = json_decode($viacep)->bairro;
                $dados['municipio'] = json_decode($viacep)->localidade;
            } else {
                $erros['cep_invalido'] = true;
            }
        }

        // SE não houve nenhum indice no array $erros[] então:
        if (empty($erros)) {
            
            // PODE CADASTRAR
           
            $dados['nome'] = $dados['nome'] . ' ' . $dados['sobrenome'];

            $stmt = $db->prepare("INSERT INTO profissional(nome, email, senha, profissao_id, cep, municipio, bairro) VALUES (:nome, :email, :senha,:profissao_id, :cep, :municipio, :bairro)");
            $stmt->bindParam(":nome", $dados['nome']);
            $stmt->bindParam(":email", $dados['email']);
            $stmt->bindParam(":senha", $dados['senha']);
            $stmt->bindParam(":profissao_id", $dados['profissao'], PDO::PARAM_INT);
            $stmt->bindParam(":cep", $dados['cep']);
            $stmt->bindParam(":municipio", $dados['municipio']);
            $stmt->bindParam(":bairro", $dados['bairro']);

            if($stmt->execute()){

                $profissional_id = $db->lastInsertId();

                $telefone = $dados['telefone'];
                $telefone = explode(")", $telefone);

                $ddd = substr($telefone[0], 1);
                $numero = trim($telefone[1]);

                // Cadastrando telefone
                $stmt = $db->prepare("INSERT INTO telefone(profissional_id, ddd, numero) VALUES (:profissional_id, :ddd, :numero)");
                $stmt->bindParam(":profissional_id", $profissional_id, PDO::PARAM_INT);
                $stmt->bindParam(":ddd", $ddd);
                $stmt->bindParam(":numero", $numero);
                if($stmt->execute()){
                    $_SESSION['msg'] = "Usuário inserido com sucesso!";
                    header("Location: http://localhost/projeto");
                }
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
    <link
        href="https://fonts.googleapis.com/css2?family=Archivo:ital,wght@0,400;1,700&family=Poppins:wght@400;600&display=swap"
        rel="stylesheet">

    <!--CSS-->
    <link rel="stylesheet" href="styles/bootstrap.min.css">
    <link rel="stylesheet" href="./styles/index.css" />
    <link rel="stylesheet" href="./styles/cadastro-servico.css" />
    <script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.mask.min.js"></script>
    <style>
        .botoes {
            width: fit-content;
            position: relative;
            left: 50%;
            transform: translateX(-50%)
        }
    </style>

    <title>Empresa - Cadastro Serviço</title>
</head>

<body>
    <header>
        <div class="header-content">
            <h1>Obrigado por escolher nossa plataforma para divulgar seu trabalho</h1>
            <p>Preencha o formulário para se cadastrar na plataforma</p>
        </div>
    </header>
    <div class="container-form">
        <h2>Seus dados</h2>
    
        <form action="<?= $_SERVER['PHP_SELF'] ?>" method="post" class="container w-75 mb-4">
    <h1 class="my-4 h4 text-center">Cadastro de profissional</h1>

    <div class="form-group row">
        <div class="col-md-5 p-0">
            <label for="nome">Nome <sup class="text-danger">*</sup></label>
            <input type="text" name="nome" id="nome" value="<?= $input['nome'] ?>" placeholder=""
                   class="form-control <?= isset($erros['nome']) ? "border-danger" : "" ?> ">
            <?= isset($erros['nome']) ? "<p class='mt-1 mb-0 text-danger'>É necessário informar o nome!</p>" : "" ?>
        </div>

        <div class="offset-md-1 col-md-6 p-0 mt-3 mt-md-0">
            <label for="sobrenome">Sobrenome <sup class="text-danger">*</sup></label>
            <input type="text" name="sobrenome" id="sobrenome" value="<?= $input['sobrenome'] ?>" placeholder=""
                   class="form-control <?= isset($erros['sobrenome']) ? "border-danger" : "" ?> ">
            <?= isset($erros['sobrenome']) ? "<p class='mt-1 mb-0 text-danger'>É necessário informar o sobrenome!</p>" : "" ?>
        </div>
    </div>

    <div class="form-group row">
        <label for="email">E-mail <sup class="text-danger">*</sup></label>
        <input type="text" name="email" id="email" value="<?= $input['email'] ?>" placeholder=""
               class="form-control <?= (isset($erros['email']) or isset($erros['email_invalido']) or isset($erros['email_existente'])) ? "border-danger" : "" ?>">
        <div>
            <?= isset($erros['email']) ? "<p class='mt-1 mb-0 text-danger'>É necessário informar o e-mail!</p>" : "" ?>
            <?= isset($erros['email_invalido']) ? "<p class='mt-1 mb-0 text-danger'>O Email informado não é válido!</p>" : "" ?>
            <?= isset($erros['email_existente']) ? "<p class='mt-1 mb-0 text-danger'>O Email informado já está cadastrado!</p>" : "" ?>
        </div>

    </div>
    <div class="form-group row">
        <div class="col-md-5 p-0">
            <label for="telefone">Whatsapp <sup class="text-danger">*</sup></label><br>
            <input type="text" name="telefone" id="telefone" value="<?= $input['telefone'] ?>"
                   placeholder="(00) 00000-0000"
                   class="form-control <?= (isset($erros['telefone']) or isset($erros['telefone_invalido'])) ? "border-danger" : "" ?>"
                   pattern="\([0-9]{2}\)[\s][0-9]{5}-[0-9]{4}" title="(99) 99999-9999">
            <script type="text/javascript">$("#telefone").mask("(00) 00000-0009");</script>
            <div>
                <?= isset($erros['telefone']) ? "<p class='mt-1 mb-0 text-danger'>Whatsapp é necessário!</p>" : "" ?>
                <?= isset($erros['telefone_invalido']) ? "<p class='mt-1 mb-0 text-danger'>É necessário que o formato do telefone seja: (99) 99999-9999</p>" : "" ?>
            </div>

        </div>

        <div class="offset-md-1 col-md-6 p-0 mt-3 mt-md-0">
            <label for="cep">CEP <sup class="text-danger">*</sup></label><br>
            <input type="text" name="cep" id="cep" value="<?= $input['cep'] ?>" placeholder="00000-000"
                   class="form-control <?= (isset($erros['cep']) or isset($erros['cep_formato'])) ? "border-danger" : "" ?>" pattern="[0-9]{5}-[0-9]{3}" title="99999-999">
            <script type="text/javascript">$("#cep").mask("00000-000");</script>
            <div>
                <?= isset($erros['cep']) ? "<p class='mt-1 mb-0 text-danger'>É necessário informar o CEP!</p>" : "" ?>
                <?= isset($erros['cep_formato']) ? "<p class='mt-1 mb-0 text-danger'>É necessário que o formato do CEP seja: 99999-999</p>" : "" ?>
                <?= isset($erros['cep_invalido']) ? "<p class='mt-1 mb-0 text-danger'>O CEP Informado não é um CEP válido</p>" : "" ?>
            </div>
        </div>
    </div>
    <div class="form-group row">
        <label for="profissao">Profissão <sup class="text-danger">*</sup></label>
        <select class="form-control <?= isset($erros['profissao']) ? "border-danger" : "" ?>" name="profissao"
                id="profissao">
            <option value="<?= !empty($dados['profissao']) ? $dados['profissao'] : "" ?>"><?= (isset($dados['profissao']) and !empty($dados['profissao'])) ? $db->query(
                    "SELECT * FROM profissao WHERE id = {$dados['profissao']}"
                )->fetch()->nome : "Escolha uma profissão" ?></option>
            <?php
            foreach ($profissoes as $profissao_opcao): ?>
                <option value="<?= $profissao_opcao->id ?>"><?= $profissao_opcao->nome ?></option>
            <?php
            endforeach; ?>
        </select>
        <?= isset($erros['profissao']) ? "<p class='mt-1 mb-0 text-danger'>É necessário informar a profissão!</p>" : "" ?>
    </div>
    <div class="form-group row">
        <label for="senha">Senha <sup class="text-danger">*</sup></label>
        <input type="password" name="senha" id="senha" value="" placeholder=""
               class="form-control <?= ((isset($erros['confirma_senha'])) or isset($erros['senha_diferente']) or isset($erros['senha_pequena'])) ? "border-danger" : "" ?>">
        <div>
            <?= isset($erros['senha']) ? "<p class='mt-1 mb-0 text-danger'>A Senha é obrigatória!</p>" : "" ?>
            <?= isset($erros['senha_pequena']) ? "<p class='mt-1 mb-0 text-danger'>A senha deve no mínimo 8 caracteres!</p>" : "" ?>
        </div>
    </div>

    <div class="form-group row">
        <label for="confirma_senha">Confirme a Senha <sup class="text-danger">*</sup></label>
        <input type="password" name="confirma_senha" id="confirma_senha" value="" placeholder=""
               class="form-control <?= ((isset($erros['confirma_senha'])) or isset($erros['senha_diferente'])) ? "border-danger" : "" ?>">
        <div>
            <?= isset($erros['confirma_senha']) ? "<p class='mt-1 mb-0 text-danger'>É necessário confirmar a senha!</p>" : "" ?>
            <?= isset($erros['senha_diferente']) ? "<p class='mt-1 mb-0 text-danger'>As senhas devem ser iguais!</p>" : "" ?>
        </div>
    </div>


    <div class="botoes">
        <button type="submit" class="btn btn-primary mt-4">Cadastrar</button>
        <a href="<?= $_SERVER['PHP_SELF'] ?>">
            <button type="button" class="btn btn-primary mt-4">Atualizar</button>
        </a>
    </div>
</form>
    </div>


</body>

</html>