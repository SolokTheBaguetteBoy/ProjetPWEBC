<?php 
	/*controleur utilisateur.php :
		fonctions-action de gestion des utilisateurs
	*/

	function ident () {
		$nom=isset($_POST['nom'])?trim($_POST['nom']):'';
		$num=isset($_POST['num'])?trim($_POST['num']):'';
		$msg="Utilisateur inexistant";
		$_SESSION['profil'] = "";
		
		require ("./M/utilisateurBD.php");
		
		//if (count($_POST)==0)
		
	//	else {
			if (verifS_ident($nom, $num, $err) && (verif_bd($nom, $num, $profil) == -1)) {
				//echo ('<br />PROFIL : <pre>'); print_r ($profil); echo ('</pre><br />'); die("ident");
				
				//session_start(); //fait dans index
				$_SESSION['profil'] = $profil;
				
				trouverTresorAutres();
				trouverTresorPropre();
				$nexturl = "index.php?controle=utilisateur&action=accueil&selecterTreasure=" . $_SESSION['selecterTreasure'];
				header ("Location:" . $nexturl);
			}
			else {
				$msg = $err;
				require("V/utilisateur/ident.tpl");
			}
		}
		
	function treasureChecker(){
		require ("M/connectBD.php") ; //connexion $link à MYSQL et sélection de la base
		
		$select_lat= "select CoordonneeX from Tresor where IdTresor = %s"; 
		$select_lng= "select CoordonneeY from Tresor where IdTresor = %s"; 
		$req_lat = sprintf($select_lat, $_SESSION['selecterTreasure']);
		$req_lng = sprintf($select_lng, $_SESSION['selecterTreasure']);
		
		$res_lat = mysqli_query($link, $req_lat)	
		or die (utf8_encode("erreur de requête : ") . $req_lat); 
		
		$res_lng = mysqli_query($link, $req_lng)	
		or die (utf8_encode("erreur de requête : ") . $req_lng); 
		//var_dump($_GET['longitude']);
		while($test = mysqli_fetch_assoc($res_lat)){
			$latTreasure = $test["CoordonneeX"];
		}
		while($test2 = mysqli_fetch_assoc($res_lng)){
			$lngTreasure = $test2["CoordonneeY"];
		}
		//$lngTreasure = mysql_fetch_assoc($res_lng);
		//$latTreasure = mysql_fetch_assoc($res_lat);
		
		if ((($lngTreasure - $_GET['longitude']) < 10) && (($latTreasure - $_GET['latitude']) < 10) && (($lngTreasure - $_GET['longitude']) > -10) && (($latTreasure - $_GET['latitude']) > -10)) {
			echo "Trésor trouvé";
			treatTreasureFound($_SESSION['selecterTreasure']);
			return "Trésor trouvé";
		} 
		else {
			echo "Trésor non trouvé";
			return "Trésor non trouvé";
		}
	}
	
	function treatTreasureFound($idTresor){
		require("M/connectBD.php");
		$select_treasure = "UPDATE TRESOR SET BTrouve = 1 WHERE idTresor = %s";
		$fullquery = sprintf($select_treasure, $idTresor);
		mysqli_query($link, $fullquery) or die(utf8_encode("erreur de requête : ") . $fullquery);
		trouverTresorAutres();
		
		
	}
	
	function accueil() {
		//require ("modele/contactBD.php");
	
		$idn = $_SESSION['profil'];
		//echo $idn;
		//$Contact = contacts($idn);
		$_SESSION['selecterTreasure'] = $_SESSION['tresors'][1]['IdTresor'];
		if($_SESSION['tresors'][0] > 0){require ("./V/utilisateur/chasseAuTresor.tpl");}
		else {require("./V/utilisateur/noTreasuresFound.tpl");}

	}
	
	function creatorMode(){
		$_SESSION['selecterTreasure'] = $_SESSION['tresorsOwn'][1];
		$_SESSION['selecterTreasure'] = $_SESSION['tresorsOwn'][1]['IdTresor'];
		require("./V/utilisateur/creatorMode.tpl");
	}
	
	// vérification syntaxique des saisies
	// nom : composé de caractères alphanumériques et du tiret, chaîne non vide de 30 caractères maximum
	// num : composé de caractères alphanumériques, à raison de 6 à 8 caractères
	// En cas d'erreur, une information sur l'erreur est retournée dans $err 
	function verifS_ident($nom, $num, &$err) {
		if (!preg_match("`^[[:alpha:][:digit:]\-]{1,30}$`", $nom)) {
			$err = 'erreur de syntaxe sur le nom';
			return false;
		}
		if (!preg_match("`^[[:alpha:][:digit:]]{2,20}$`", $num)) {
			$err = 'erreur de syntaxe sur l\'identifiant.';
			return false;
		}
		return true;
	} 
	
	function ajout_u()  {
		echo ("ajout_u ::");
	}
	function maj_u() {
		echo ("maj_u ::");
	}
	function destr_u ()  {
		echo ("destr_u ::");
	}			
	
	function queryCreaTresor(){
		require($_SERVER['DOCUMENT_ROOT']."/Dep_info/infoa2/gr205/leguern2/ProjetPWEBC/M/connectBD.php");
		$idNewTresorQuerry = "SELECT IdTresor FROM Tresor";
		$idNewTresor = '0';
		$res_joueur = mysqli_query($link, $idNewTresorQuerry)	
			or die (utf8_encode("erreur de requête : ") . $idNewTresorQuerry); 
		
		if (mysqli_num_rows ($res_joueur) > 0) {
			$idNewTresor = mysqli_num_rows($res_joueur);
			
		} 
		else {
			$profil = null;
			echo 'Echec de connexion';
			$idNewTresor = '0';
		}
		
		$reqAjoutTresor = "INSERT INTO tresor(IdTresor, CoordonneeX, CoordonneeY, IdJoueurAuteur, Nom, BTrouve) VALUES (%s, %s, %s, %s, \" %s \", 0)";
		$reqAjoutTresorFilled = sprintf($reqAjoutTresor, $idNewTresor, $_POST["coordX"], $_POST["coordY"], $_POST["idAuteur"], $_POST["name"]);
		$res_ajout = mysqli_query($link, $reqAjoutTresorFilled) or die (utf8_encode("erreur de requête (ajout) : ") . $reqAjoutTresorFilled);
		trouverTresorPropre();
		require($_SERVER['DOCUMENT_ROOT']."/Dep_info/infoa2/gr205/leguern2/ProjetPWEBC/V/utilisateur/creatorMode.tpl");
		$nextirl = "index.php?controle=utilisateur&action=creatorMode&selecterTreasure=" . $idNewTresor;
		header ("Location:" . $nextirl);
	}
	
	function trouverTresorAutres(){
		require ("M/connectBD.php") ; //connexion $link à MYSQL et sélection de la base
		$i = 1;
		$select_tre= "select * from Tresor where IdJoueurAuteur <> %s and BTrouve = 0"; 
		$req_tre = sprintf($select_tre, $_SESSION['profil']['IdJoueur']);
		
		$res_tre = mysqli_query($link, $req_tre)	
		or die (utf8_encode("erreur de requête : ") . $select_tre); 
		$_SESSION['tresors'][0] = mysqli_num_rows($res_tre);
		if(mysqli_num_rows($res_tre) > 0){
			while($fetch = mysqli_fetch_assoc($res_tre)){
				$_SESSION['tresors'][$i] = $fetch;
				$i = $i + 1;
			}
			
		
			$_SESSION['selecterTreasure'] = $_SESSION['tresors'][1]['IdTresor'];
		}
		else {
			require("./V/utilisateur/noTreasuresFound.tpl");
		}
		

	}
	
	function trouverTresorPropre(){
		require ("M/connectBD.php") ; //connexion $link à MYSQL et sélection de la base
		$i = 1;
		$select_tre= "select * from Tresor where IdJoueurAuteur = %s"; 
		$req_tre = sprintf($select_tre, $_SESSION['profil']['IdJoueur']);
		
		$res_tre = mysqli_query($link, $req_tre)	
		or die (utf8_encode("erreur de requête : ") . $select_tre); 
		
		while($fetch = mysqli_fetch_assoc($res_tre)){
			$_SESSION['tresorsOwn'][$i] = $fetch;
			$i = $i + 1;
		}
		$_SESSION['tresorsOwn'][0] = mysqli_num_rows($res_tre);
		
	}
	
	function treasureChange(){
		//require("./V/utilisateur/chasseAuTresor.tpl");
		
		$nextirl = "index.php?controle=utilisateur&action=accueil&selecterTreasure=" . $_POST['tresorCherch'];
		$_SESSION['treasureSelecter'] = $_POST['tresorCherch'];
		
		
		header ("Location:" . $nextirl);
		
	}
	
	function creatorChange(){
		$nextirl = "index.php?controle=utilisateur&action=creatorMode&selecterTreasure=" . $_POST['tresorCherch'];
		$_SESSION['treasureSelecter'] = $_POST['tresorCherch'];
		header ("Location:" . $nextirl);

	}
	
	function queryClueLink(){
		$idTresorUsed = $_SESSION['selecterTreasure'];
		/*var_dump($_POST['tresorPrIndice']);
		var_dump($_SESSION['selecterTreasure']);
		var_dump($_SESSION);
		var_dump($idTresorUsed);*/
		require ("M/connectBD.php") ; //connexion $link à MYSQL et sélection de la base
		$idNewClue = "SELECT IdIndice FROM indicecreateur";
		$idClue = '0';
		$res_id = mysqli_query($link, $idNewClue)	
			or die (utf8_encode("erreur de requête : ") . $idNewClue); 
		
		if (mysqli_num_rows ($res_id) > 0) {
			$idClue = mysqli_num_rows($res_id);
			$createClue = "insert into indicecreateur(IdIndice, Description, IdTresor) values (%s, \"%s\", %s)"; 
			$fullCreate = sprintf($createClue, $idClue, $_POST['indice'], $_POST['tresorPrIndice']);
			var_dump($fullCreate);
			$res_tre = mysqli_query($link, $fullCreate)	
			or die (utf8_encode("erreur de requête : ") . $fullCreate); 
		
		} 
		else {
			$profil = null;
			echo 'Echec de connexion';
			$idClue = '0';
		}
		require($_SERVER['DOCUMENT_ROOT']."/Dep_info/infoa2/gr205/leguern2/ProjetPWEBC/V/utilisateur/creatorMode.tpl");
		$nextirl = "index.php?controle=utilisateur&action=creatorMode&selecterTreasure=" . $_SESSION['selecterTreasure'];
		header ("Location:" . $nextirl);
	}
	
	function getCluesTreasure(){
		//var_dump($_POST['selecterTreasure']);
		require ("M/connectBD.php") ; //connexion $link à MYSQL et sélection de la base
		$testVar[] = "";
		$i = 1;
		$select_clues= "select * from indicecreateur where IdTresor = %s"; 
		$req_clues = sprintf($select_clues, $_GET['selecterTreasure']);
		
		$res_clues = mysqli_query($link, $req_clues)	
		or die (utf8_encode("erreur de requête : ") . $req_clues); 
		
		
		
		while($fetch = mysqli_fetch_assoc($res_clues)){
			echo "<div id=\"info\" class=\"ui-widget-content\"><p>" . $fetch['Description'] . "</p></div>";
			$i = $i + 1;
		}
		/*require($_SERVER['DOCUMENT_ROOT']."/ProjetPWEBC/V/utilisateur/chasseAuTresor.tpl");
		$nextirl = "index.php?controle=utilisateur&action=accueil&selecterTreasure=" . $_SESSION['selecterTreasure'];
		header ("Location:" . $nextirl);*/
	
	}
	
	function disconnect(){
		require("fin.php");
	}
	
	function register(){
		require ("M/connectBD.php");
		$req_inscription = "INSERT INTO joueur(IdJoueur, NomJoueur, MotDePasse) VALUES (%s, \"%s\", \"%s\")";
		$select_id_joueur = "SELECT * FROM JOUEUR";
		$res_idj = mysqli_query($link, $select_id_joueur)	
		or die (utf8_encode("erreur de requête : ") . $select_id_joueur); 
		$req_full = sprintf($req_inscription, mysqli_num_rows($res_idj), $_POST['nom'], $_POST['num']);
		mysqli_query($link, $req_full);
		ident();
	}