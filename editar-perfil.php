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

// Formatando dados do usuário para adequar aos inputs
var_dump($_SESSION['usuario']);


/** CONTINUAR DAS PROFISSÕES */

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
        <link rel="stylesheet" href="./styles/editar-perfil.css" />
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
            <form action="<?= $_SERVER['PHP_SELF'] ?>" method="post" class="container w-75 mb-4">
                <h1 class="my-4 h4 text-center">Dados Pessoais</h1>

                <div class="form-group row">
                    <div class="col-md-5 p-0">
                        <label for="nome">Nome <sup class="text-danger">*</sup></label>
                        <input type="text" name="nome" id="nome" value="<?= $_SESSION['usuario']->nome ?>" placeholder=""
                               class="form-control <?= isset($erros['nome']) ? "border-danger" : "" ?> ">
                               <?= isset($erros['nome']) ? "<p class='mt-1 mb-0 text-danger'>É necessário informar o nome!</p>" : "" ?>
                    </div>

                    <div class="offset-md-1 col-md-6 p-0 mt-3 mt-md-0">
                        <label for="sobrenome">Sobrenome <sup class="text-danger">*</sup></label>
                        <input type="text" name="sobrenome" id="sobrenome" value="<?= $_SESSION['usuario']->sobrenome ?>" placeholder=""
                               class="form-control <?= isset($erros['sobrenome']) ? "border-danger" : "" ?> ">
                               <?= isset($erros['sobrenome']) ? "<p class='mt-1 mb-0 text-danger'>É necessário informar o sobrenome!</p>" : "" ?>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="email">E-mail <sup class="text-danger">*</sup></label>
                    <input type="text" name="email" id="email" value="<?= $_SESSION['usuario']->email ?>" placeholder=""
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
                        <input type="text" name="telefone" id="telefone" value="<?= $_SESSION['usuario']->telefone->ddd . $_SESSION['usuario']->telefone->numero ?>"
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
                        <input type="text" name="cep" id="cep" value="<?= $_SESSION['usuario']->cep ?>" placeholder="00000-000"
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
                        <option value="<?= !empty($dados['profissao']) ? $dados['profissao'] : "" ?>"><?=
                            (isset($dados['profissao']) and ! empty($dados['profissao'])) ? $db->query(
                                            "SELECT * FROM profissao WHERE id = {$dados['profissao']}"
                                    )->fetch()->nome : "Escolha uma profissão"
                            ?></option>
                        <?php foreach ($profissoes as $profissao_opcao): ?>
                            <option value="<?= $profissao_opcao->id ?>"><?= $profissao_opcao->nome ?></option>
                        <?php endforeach; ?>
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
                    <button type="submit" class="btn btn-primary mt-4">Atualizar</button>
                    <a href="<?= $_SERVER['PHP_SELF'] ?>">
                        <button type="button" class="btn btn-primary mt-4">Reload</button>
                    </a>
                </div>
            </form>
        </div>
    </body>

</html>