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
        <div class="header-content">
            <h1>Escolha o melhor profissonal para o serviço que você deseja</h1>
        </div>
    </header>
    <form>
        <div class="occupation">
            <label for="occupation">Profissão</label>
            <select name="occupation" id="occupation">
                <option value=""></option>
            </select>
        </div>

        <div class="specialism">
            <label for="specialism" class="specialism">Especialidade</label>
            <select name="specialism" id="specialism">
                <option value=""></option>
            </select>
        </div>

        <div class="cep">
            <label for="cep" class="cep">CEP</label>
            <input type="text" name="cep" id="cep">
        </div>
    </form>

    <div class="card">
        <div class="img">
        <img src="" alt="">
        </div>
        <div class="professional">
            <p>Matheus dos Santos Caldeira</p>
            <p>Desing Gráfico</p>
            <p>Trabalho a mais de 10 anos na área de design já trabalhei para empresas como coca cola e pirelles, sou especialidade dendiediendineidneindei</p>
        </div>
        <div class="net whatss">
            <a href=""><img src="./img/icon/icon-whatsapp.svg" alt=""></a>
        </div>
        <div class="net email">
            <a href=""><img src="./img/icon/icon-email.svg" alt=""></a>
        </div>
    </div>
</body>
</html>