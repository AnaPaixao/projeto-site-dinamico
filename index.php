<?php 
session_start();
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

    <title>Empresa - Página Inicial</title>
</head>

<body>
	
	<?php 
	if(isset($_SESSION['msg'])):
		echo "<div class='alert'>{$_SESSION['msg']}</p>";
		unset($_SESSION['msg']);
	else:
		echo "";
	endif;
	?>
    
	<main id="container">

        <ul>
            <li><a href="./cadastro-servico.php">Cadastre-se</a></li>
            <li><a href="./login.php">Login</a></li>
        </ul>

        <div class="intro-text">
            <h1>Achakí</h1>
            <h2>Sua plataforma de buscas de serviços online</h2>
        </div>

        <div class="img">
            <img src="./img/img-pag-inicial.svg" alt="">
        </div>

        

        <form action="" class="search-container">

            <select name="occupation" id="occupation">
                <option value="">Profissão</option>
                <option value="">Cozinheiro</option>
            </select>

            <input type="text" name="cep" placeholder="CEP">

            <button>Consultar</button>
    
        </form>

        <div class="icon">
            Ícones feitos por <a href="https://www.flaticon.com/br/autores/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/br/" title="Flaticon">www.flaticon.com</a>
        </div>
    </main>
</body>

</html>