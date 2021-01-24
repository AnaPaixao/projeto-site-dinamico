<?php
session_start();

/** [VERIFICAÇÃO DE LOGIN]
 *  Verifica se o usuario está logado, se não estiver encaminha para a tela de login
 *  passando uma mensagem.
 */
if (!isset($_SESSION['usuario'])) {
    $_SESSION['msg_perfil'] = 'Faça login para alterar os seus dados!';
    header("Location: http://localhost/projeto-site-dinamico/login.php");
    exit;
}

/** [FIM DA VERIFICAÇÃO DE LOGIN] */


require __DIR__ . "/DB/Connect.php";

/** @var $db PDO */
$db = Connect::getInstance();


/** VALIDAÇÕES */

//Formulário dados
if (isset(filter_input_array(INPUT_POST, FILTER_SANITIZE_STRIPPED)['nome'])) {
    $dados = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRIPPED);
    var_dump($dados);

    $erros = [];

    if (!empty($dados)) {
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

        } else {

            // Valida Email

            if (!filter_var($dados['email'], FILTER_VALIDATE_EMAIL)) {
                $erros['email_invalido'] = true;
            } else {
                $stmt = $db->prepare("SELECT * FROM profissional WHERE email = :email");
                $stmt->bindParam(":email", $dados['email'], PDO::PARAM_STR);
                $stmt->execute();

                if (($stmt->rowCount() != 0) && ($dados['email'] != $stmt->fetch()->email)) {
                    $erros['email_existente'] = true;
                }
            }

            // Verifica se o formato do telefone é válido (21) 99999-9999

            if (preg_match("/\([0-9]{2}\)[\s][0-9]{5}-[0-9]{4}/", $dados['telefone']) != 1) {
                $erros['telefone_invalido'] = true;
            }

            // Verifica se o formato do cep é válido

            if (preg_match("/^[0-9]{5}-[0-9]{3}/", $dados['cep']) != 1) {
                $erros['cep_formato'] = true;
            } else {
                $viacep = file_get_contents("https://viacep.com.br/ws/{$dados['cep']}/json/");
                if (!isset(json_decode($viacep)->erro)) {
                    $dados['bairro'] = json_decode($viacep)->bairro;
                    $dados['municipio'] = json_decode($viacep)->localidade;
                } else {
                    $erros['cep_invalido'] = true;
                }
            }

            if (empty($erros)) {

                $dados['nome'] = mb_convert_case(trim($dados['nome']) . ' ' . trim($dados['sobrenome']), MB_CASE_TITLE);

                try {
                    $stmt = $db->prepare("UPDATE profissional SET nome=:nome, email=:email, cep=:cep, profissao_id=:profissao_id, bairro=:bairro, municipio=:municipio WHERE id = :id");
                    $stmt->bindParam(":nome", $dados['nome']);
                    $stmt->bindParam(":email", $dados['email']);
                    $stmt->bindParam(":profissao_id", $dados['profissao'], PDO::PARAM_INT);
                    $stmt->bindParam(":cep", $dados['cep']);
                    $stmt->bindParam(":municipio", $dados['municipio']);
                    $stmt->bindParam(":bairro", $dados['bairro']);
                    $stmt->bindParam(":id", $_SESSION['usuario']->id, PDO::PARAM_INT);

                    if ($stmt->execute()) {
                        $profissional_id = $_SESSION['usuario']->id;

                        $telefone = $dados['telefone'];
                        $telefone = explode(")", $telefone);

                        $ddd = substr($telefone[0], 1);
                        $numero = trim($telefone[1]);

                        // Atualizando telefone
                        $stmt = $db->prepare("UPDATE telefone SET ddd=:ddd, numero=:numero WHERE profissional_id = :profissional_id");
                        $stmt->bindParam(":profissional_id", $profissional_id, PDO::PARAM_INT);
                        $stmt->bindParam(":ddd", $ddd);
                        $stmt->bindParam(":numero", $numero);

                        if ($stmt->execute()) {

                            $stmt = $db->prepare("SELECT * FROM profissional WHERE id = :id");
                            $stmt->bindParam(":id", $profissional_id);

                            if ($stmt->execute()) {

                                $_SESSION['usuario'] = $stmt->fetch();
                                $nomes = explode(" ", $_SESSION['usuario']->nome);
                                $_SESSION['usuario']->nome = $nomes[0];
                                $dados['nome'] = $nomes[0];
                                $_SESSION['usuario']->sobrenome = $nomes[1];
                                $dados['sobrenome'] = $nomes[1];

                                try {
                                    $id = $_SESSION['usuario']->id;
                                    $sql = "SELECT ddd, numero FROM telefone WHERE profissional_id = {$id}";
                                    $query = $db->query($sql);

                                    $telefone = $query->fetch();

                                    $_SESSION['usuario']->telefone = $telefone;
                                    $_SESSION['usuario']->telefone->numero = str_replace("-", "",
                                        $_SESSION['usuario']->telefone->numero);
                                    $_SESSION['usuario']->cep = str_replace("-", "", $_SESSION['usuario']->cep);

                                } catch (Exception $ex) {
                                    die("Erro: {$ex}");
                                }

                            }
                        }
                    }

                } catch
                (PDOException $e) {
                    die($e->getMessage());
                }

            }

        }
    }

}


//Trazendo as profissões do banco
$profissao = $db->query("SELECT * FROM profissao WHERE id = {$_SESSION['usuario']->profissao_id}")->fetch();
$profissoes = $db->query("SELECT * FROM profissao ORDER BY nome ASC")->fetchAll();

var_dump($profissao);

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
    <link rel="stylesheet" href="./styles/index.css"/>
    <link rel="stylesheet" href="./styles/cadastro-servico.css"/>
    <link rel="stylesheet" href="./styles/editar-perfil.css"/>
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

    <title>Empresa - Editar Perfil</title>
</head>

<body>
<header>
    <div class="header-content">
        <h1>Mantenha seus dados sempre atualizados</h1>
    </div>
</header>
<div class="container-form">
    <form name="dados_pessoais" action="<?= $_SERVER['PHP_SELF'] ?>" method="post" class="container w-75 mb-4">
        <h1 class="my-4 h4 text-center">Dados Pessoais</h1>

        <div class="form-group row">
            <div class="col-md-5 p-0">
                <label for="nome">Nome <sup class="text-danger">*</sup></label>
                <input type="text" name="nome" id="nome"
                       value="<?= !isset($dados) ? $_SESSION['usuario']->nome : $dados['nome'] ?>" placeholder=""
                       class="form-control <?= isset($erros['nome']) ? "border-danger" : "" ?> ">
                <?= isset($erros['nome']) ? "<p class='mt-1 mb-0 text-danger'>É necessário informar o nome!</p>" : "" ?>
            </div>

            <div class="offset-md-1 col-md-6 p-0 mt-3 mt-md-0">
                <label for="sobrenome">Sobrenome <sup class="text-danger">*</sup></label>
                <input type="text" name="sobrenome" id="sobrenome"
                       value="<?= !isset($dados) ? $_SESSION['usuario']->sobrenome : $dados['sobrenome'] ?>"
                       placeholder=""
                       class="form-control <?= isset($erros['sobrenome']) ? "border-danger" : "" ?> ">
                <?= isset($erros['sobrenome']) ? "<p class='mt-1 mb-0 text-danger'>É necessário informar o sobrenome!</p>" : "" ?>
            </div>
        </div>

        <div class="form-group row">
            <label for="email">E-mail <sup class="text-danger">*</sup></label>
            <input type="text" name="email" id="email"
                   value="<?= !isset($dados) ? $_SESSION['usuario']->email : $dados['email'] ?>" placeholder=""
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
                <input type="text" name="telefone" id="telefone"
                       value="<?= $_SESSION['usuario']->telefone->ddd . $_SESSION['usuario']->telefone->numero ?>"
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
                <input type="text" name="cep" id="cep"
                       value="<?= !isset($dados) ? $_SESSION['usuario']->cep : $dados['cep'] ?>" placeholder="00000-000"
                       class="form-control <?= (isset($erros['cep']) or isset($erros['cep_formato'])) ? "border-danger" : "" ?>"
                       pattern="[0-9]{5}-[0-9]{3}" title="99999-999">
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
                <option value="<?= $_SESSION['usuario']->profissao_id ?>"><?= $profissao->nome ?></option>
                <?php foreach ($profissoes as $profissao_opcao): ?>
                    <?php if ($profissao_opcao->nome == $profissao->nome): continue; endif; ?>
                    <option value="<?= $profissao_opcao->id ?>"><?= $profissao_opcao->nome ?></option>
                <?php endforeach; ?>
            </select>
            <?= isset($erros['profissao']) ? "<p class='mt-1 mb-0 text-danger'>É necessário informar a profissão!</p>" : "" ?>
        </div>

        <div class="botoes">
            <button type="submit" class="btn btn-primary mt-4">Atualizar</button>
            <a href="<?= $_SERVER['PHP_SELF'] ?>">
                <button type="button" class="btn btn-primary mt-4">Reload</button>
            </a>
        </div>
    </form>
</div>


<?php

//Formulário dados
if (isset(filter_input_array(INPUT_POST, FILTER_SANITIZE_STRIPPED)['especialidade'])) {
    $dados = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRIPPED);
}

$especialidades = $db->query("SELECT * FROM especialidade WHERE profissao_id = {$_SESSION['usuario']->profissao_id}")->fetchAll();
if (!empty($_SESSION['usuario']->especialidade_id)) {
    $usuario_especialidade = $db->query("SELECT * FROM especialidade WHERE id = {$_SESSION['usuario']->especialidade_id}")->fetch();
}

?>


<div class="container-form">
    <form name="dados_profissionais" action="<?= $_SERVER['PHP_SELF'] ?>" method="post" class="container w-75 mb-4">
        <h1 class="my-4 h4 text-center">Dados Complementares</h1>

        <div class="form-group row">
            <div class="col-md-5 p-0">
                <label for="especialidade">Especialidade</label>
                <select class="form-control" name="especialidade" id="especialidade">
                    <option value="<?= (isset($usuario_especialidade)) and (!empty($usuario_especialidade->id)) ? $usuario_especialidade->id : "" ?>">
                        <?= (!empty($usuario_especialidade->nome)) ? $usuario_especialidade->nome : "Escolha uma Especialidade" ?>
                    </option>
                    <?php foreach ($especialidades as $especialidade): ?>
                        <?php if (isset($usuario_especialidade->nome) && $usuario_especialidade->nome == $especialidade->nome): continue; endif; ?>
                        <option value="<?= $especialidade->id ?>"><?= $especialidade->nome ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>

        <div class="form-group row">
            <label for="descricao">Descrição</label>
            <textarea class="form-control" name="descricao" id="descricao" rows="3"></textarea>
        </div>

        <div class="botoes">
            <button type="submit" class="btn btn-primary mt-4">Atualizar</button>
        </div>
    </form>
</div>
</body>

</html>