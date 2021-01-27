<?php
require __DIR__ . "/DB/Connect.php";
$db = Connect::getInstance();

$profissoes = $db->query("SELECT * FROM profissao ORDER BY nome ASC")->fetchAll();
$cep = "";

$consulta = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRIPPED);

if (isset($consulta)) {
    // var_dump($consulta);
    if (!empty($consulta['cep'])) {
        $cep = $consulta['cep'];

        if (preg_match("/^[0-9]{5}-[0-9]{3}/", $consulta['cep']) != 1) {
            $erros['cep_formato'] = true;
        } else {
            $viacep = file_get_contents("https://viacep.com.br/ws/{$consulta['cep']}/json/");
            if (!isset(json_decode($viacep)->erro)) {
                $consulta['bairro'] = json_decode($viacep)->bairro;
                $consulta['municipio'] = json_decode($viacep)->localidade;
            } else {
                $erros['cep_invalido'] = true;
            }
        }
    }

    if (!empty($consulta['profissao'])) {

        try {
            $stmt = $db->prepare("SELECT * FROM especialidade WHERE profissao_id = :id");
            $stmt->bindParam(":id", $consulta['profissao'], PDO::PARAM_INT);
            $stmt->execute();

            $especialidades = $stmt->fetchAll();
            // var_dump($especialidades);

            $stmt = $db->prepare("SELECT * FROM profissao WHERE id = :id");
            $stmt->bindParam(":id", $consulta['profissao'], PDO::PARAM_INT);
            $stmt->execute();

            $profissao_selecionada = $stmt->fetch();
            // var_dump($profissao_selecionada);

            if (!empty($consulta['especialidade'])) {
                $especialidade_selecionada = $db->query("SELECT * FROM especialidade WHERE id =" . $consulta['especialidade'])->fetch();
                // var_dump($especialidade_selecionada);
            }
        } catch (Exception $ex) {
            echo "Deu erro tio: {$ex}";
        }
    }

    if (!isset($erros) && !empty($consulta['cep']) && !empty($consulta['profissao']) && !empty($consulta['especialidade'])) {

        try {
            $stmt = $db->prepare("SELECT * FROM profissional WHERE municipio = :municipio AND bairro = :bairro AND profissao_id = :profissao_id AND especialidade_id = :especialidade_id");
            $stmt->bindParam(":municipio", $consulta['municipio']);
            $stmt->bindParam(":bairro", $consulta['bairro']);
            $stmt->bindParam(":profissao_id", $consulta['profissao']);
            $stmt->bindParam(":especialidade_id", $consulta['especialidade']);
            $stmt->execute();
            $profissionais = $stmt->fetchAll();
        } catch (Exception $ex) {
            "Deu ruim: " . $ex;
        }
    } elseif (!isset($erros) && !empty($consulta['cep']) && !empty($consulta['profissao'])) {
        try {
            $stmt = $db->prepare("SELECT * FROM profissional WHERE municipio = :municipio AND bairro = :bairro AND profissao_id = :profissao_id");
            $stmt->bindParam(":municipio", $consulta['municipio']);
            $stmt->bindParam(":bairro", $consulta['bairro']);
            $stmt->bindParam(":profissao_id", $consulta['profissao']);
            $stmt->execute();
            $profissionais = $stmt->fetchAll();
        } catch (Exception $ex) {
            "Deu ruim: " . $ex;
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
        <link rel="stylesheet" href="./styles/index.css" />
        <link rel="stylesheet" href="./styles/consultar-profissional.css" />
        <script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.mask.min.js"></script>

        <title>Empresa - Consultar Profissional</title>
    </head>

    <body>
        <header>
            <a href="./index.php" class="botao-voltar"><img src="./img/arrow.svg" alt="botão voltar"></a>
            <div class="header-content">
                <h1>Escolha o melhor profissonal para o serviço que você deseja</h1>
            </div>
        </header>
        <form action="<?= $_SERVER['PHP_SELF'] ?>" method="post" id="consulta">
            <div class="occupation">
                <label for="profissao">Profissão</label>
                <select name="profissao" id="occupation" onchange="submeterProfissao()">

                    <?php if (!isset($profissao_selecionada)): ?>
                        <option value="">Selecione uma Profissão</option>
                    <?php else: ?>
                        <option value="<?= $profissao_selecionada->id ?>"><?= $profissao_selecionada->nome ?></option>
                    <?php endif; ?>
                    <?php foreach ($profissoes as $profissao): ?>
                        <?php if (isset($profissao_selecionada)): ?>
                            <?php
                            if ($profissao->id == $profissao_selecionada->id): continue;
                            endif;
                            ?>
                            <option value="<?= $profissao->id ?>"><?= $profissao->nome ?></option>
                        <?php else: ?>
                            <option value="<?= $profissao->id ?>"><?= $profissao->nome ?></option>
                        <?php endif; ?>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="specialism">
                <label for="especialidade" class="specialism">Especialidade</label>
                <select name="especialidade" id="especialidade">
                    <?php if (!isset($especialidades)): ?>
                        <option value="">---</option>
                    <?php else: ?>
                        <?php if (isset($especialidade_selecionada)): ?>
                            <option value="<?= $especialidade_selecionada->id ?>"><?= $especialidade_selecionada->nome ?></option>
                        <?php else: ?>
                            <option value="">Todos</option>
                        <?php endif; ?>
                        <?php foreach ($especialidades as $especialidade): ?>
                            <?php if (isset($especialidade_selecionada)): ?>
                                <?php
                                if ($especialidade->id == $especialidade_selecionada->id): continue;
                                endif;
                                ?>
                                <option value="<?= $especialidade->id ?>"><?= $especialidade->nome ?></option>
                            <?php else: ?>
                                <option value="<?= $especialidade->id ?>"><?= $especialidade->nome ?></option>
                            <?php endif; ?>
                        <?php endforeach; ?>
                        <?php if (isset($especialidade_selecionada)): ?>
                            <option value="">Todos</option>
                        <?php endif; ?>
                    <?php endif; ?>
                </select>
            </div>

            <div class="cep">
                <label for="cep" class="cep">CEP</label>
                <input type="text" name="cep" id="cep" <?= (isset($erros['cep_formato']) or isset($erros['cep_invalido'])) ? "style='border: 1px solid red;'" : "" ?> value="<?= $cep ?>"><!-- pattern="[0-9]{5}-[0-9]{3}" title="99999-999" -->
                <script type="text/javascript">$("#cep").mask("00000-000");</script>
            </div>

            <div class="button">
                <button type="submit">Buscar</button>
            </div>
        </form>


        <?php if (!isset($erros)): ?>
            <?php if (isset($profissionais) && !empty($profissionais)): ?>
                <?php foreach ($profissionais as $profissional): ?>

                    <?php $tel = $db->query("SELECT * FROM telefone WHERE profissional_id = " . $profissional->id)->fetch(); ?>
                    <?php $prof = $db->query("SELECT * FROM profissao WHERE id = " . $profissional->profissao_id)->fetch(); ?>
                    <?php if (!empty($profissional->especialidade_id)) {
                        $esp = $db->query("SELECT * FROM especialidade WHERE id = " . $profissional->especialidade_id)->fetch();
                    } else {
                        $esp = null;
                    } ?>

                    <div class="card">
                        <div class="img">
                            <img src="./img/icon/<?= $prof->icone ?>" width="100" height="100" alt="">
                        </div>
                        <div class="professional">
                            <p><?= $profissional->nome ?></p>
                            <p><?= (isset($esp->nome) and ! empty($esp->nome)) ? $esp->nome : "Sem especialidade" ?></p>
                            <p>
            <?= $profissional->descricao ?>
                            </p>
                        </div>
                        <div class="social-media">
                            <div class="net whatss">
                                <a href="https://api.whatsapp.com/send?phone=55<?= $tel->ddd . $tel->numero ?>&text=Oi%2C+<?= urlencode($profissional->nome) ?>%2C+encontrei+voc%C3%AA+pelo+Achaki.+Gostaria+de+informa%C3%A7%C3%B5es+sobre+os+seus+servi%C3%A7os."><img src="./img/icon/icon-whatsapp.svg" alt=""></a>
                            </div>
                            <div class="net email">
                                <a href="mailto:<?= $profissional->email ?>"><img src="./img/icon/icon-email.svg" alt=""></a>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php elseif (!is_null($consulta) && !empty($consulta['cep']) && !empty($consulta['profissao']) && empty($profissionais)): ?>
                <div class="card">
                    <h2>Nenhum profissional cadastrado no seu bairro com essas informações.</h2>
                </div>
            <?php else: ?>
                <div class="card">
                    <h2>Os resultados irão aparecer aqui.</h2>
                </div>
    <?php endif; ?>

        <?php else: ?>
            <div class="card">
                <h1>CEP INVÁLIDO</h1>
            </div>
<?php endif; ?>

        <script>
            function submeterProfissao() {
                let form = document.getElementById("consulta");
                let especialidade = document.getElementById("especialidade");

                especialidade.value = "";
                form.submit();

            }
        </script>
    </body>
</html>