<?php
session_start();

require __DIR__ . "/DB/Connect.php";
$db = Connect::getInstance();

$profissoes = $db->query("SELECT * FROM profissao ORDER BY nome ASC")->fetchAll();
// var_dump($profissoes[1]->id);
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
        <script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.mask.min.js"></script>

        <title>Empresa - Página Inicial</title>
    </head>

    <body>

        <?php
        if (isset($_SESSION['msg'])):
            echo "<div class='alert'>{$_SESSION['msg']}</p>";
            unset($_SESSION['msg']);
        else:
            echo "";
        endif;
        ?>

        <main id="container">

            <ul>
                <?= isset($_SESSION['usuario']) ? "" : "<li><a href='./cadastro-servico.php'>Cadastre-se</a></li>" ?>
                <li><a href="./login.php" class='border-left'><?= !isset($_SESSION['usuario']) ? "Login" : "Minha conta" ?></a></li>
            </ul>

            <div class="intro-text">
                <h1>Achakí</h1>
                <h2>Sua plataforma de buscas de serviços online</h2>
            </div>

            <div class="img">
                <img src="./img/img-pag-inicial.svg" alt="">
            </div>



            <form action="consultar-profissional.php" class="search-container" method="post">

                <select name="profissao" id="occupation">
                    <option value="">Escolha uma profissão</option>
                    <?php foreach ($profissoes as $profissao): ?>
                        <option value="<?= $profissao->id ?>"><?= $profissao->nome ?></option>
                        <?php endforeach; ?>
                </select>

                <input type="text" name="cep" id="cep" placeholder="CEP"  pattern="[0-9]{5}-[0-9]{3}" title="99999-999">
                <script type="text/javascript">$("#cep").mask("00000-000");</script>

                <button>Consultar</button>

            </form>

            <div class="icon">
                Ícones feitos por <a href="https://www.flaticon.com/br/autores/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/br/" title="Flaticon">www.flaticon.com</a>
            </div>
        </main>
    </body>

</html>