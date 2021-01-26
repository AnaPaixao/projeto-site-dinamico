<?php
require __DIR__."/DB/Connect.php";
$db = Connect::getInstance();

$profissoes = $db->query("SELECT * FROM profissao ORDER BY nome ASC")->fetchAll();


$consulta = filter_input_array(INPUT_GET, FILTER_SANITIZE_STRIPPED);

if(isset($consulta)){
    var_dump($consulta);
    
    if($consulta['profissao']){
        
        try {
            $stmt = $db->prepare("SELECT * FROM especialidade WHERE profissao_id = :id");
            $stmt->bindParam(":id", $consulta['profissao'], PDO::PARAM_INT);
            $stmt->execute();
            
            $especialidades = $stmt->fetchAll();
            var_dump($especialidades);
            
            $stmt = $db->prepare("SELECT * FROM profissao WHERE id = :id");
            $stmt->bindParam(":id", $consulta['profissao'], PDO::PARAM_INT);
            $stmt->execute();
            
            $profissao_selecionada = $stmt->fetch();
            var_dump($profissao_selecionada);
            
        } catch (Exception $ex) {
           echo "Deu erro tio: {$ex}";
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

    <title>Empresa - Consultar Profissional</title>
</head>

<body>
    <header>
        <a href="./index.php" class="botao-voltar"><img src="./img/arrow.svg" alt="botão voltar"></a>
        <div class="header-content">
            <h1>Escolha o melhor profissonal para o serviço que você deseja</h1>
        </div>
    </header>
    <form action="<?= $_SERVER['PHP_SELF'] ?>" post="get">
        <div class="occupation">
            <label for="profissao">Profissão</label>
            <select name="profissao" id="occupation" onchange="this.form.submit()">
                
                <?php if(!isset($profissao_selecionada)): ?>
                    <option value="">Selecione uma Profissão</option>
                <?php else: ?>
                    <option value="<?= $profissao_selecionada->id ?>"><?= $profissao_selecionada->nome ?></option>
                <?php endif; ?>
                <?php foreach($profissoes as $profissao): ?>
                    <option value="<?= $profissao->id ?>"><?= $profissao->nome ?></option>
                <?php endforeach; ?>
            </select>
        </div>

        <div class="specialism">
            <label for="especialidade" class="specialism">Especialidade</label>
            <select name="especialidade" id="specialism">
                <?php if(!isset($especialidades)): ?>
                    <option value="">Selecione uma profissão ANTES CARALHO</option>
                <?php else: ?>
                    <option value="">Selecione uma especialidade</option>
                    <?php foreach($especialidades as $especialidade): ?>
                    <option value="<?= $especialidade->id ?>"><?= $especialidade->nome ?></option>
                    <?php endforeach; ?>
                <?php endif; ?>
            </select>
        </div>

        <div class="cep">
            <label for="cep" class="cep">CEP</label>
            <input type="text" name="cep" id="cep">
        </div>
        
        <div class="cep">
            <button type="submit">></button>
        </div>
    </form>

    <div class="card">
        <div class="img">
        <img src="" alt="">
        </div>
        <div class="professional">
            <p>Matheus dos Santos Caldeira</p>
            <p>Desing Gráfico</p>
            <p>
                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
            </p>
        </div>
        <div class="social-media">
        <div class="net whatss">
            <a href=""><img src="./img/icon/icon-whatsapp.svg" alt=""></a>
        </div>
        <div class="net email">
            <a href=""><img src="./img/icon/icon-email.svg" alt=""></a>
        </div>
        </div>
    </div>
</body>
</html>