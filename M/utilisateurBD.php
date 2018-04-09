<?php
	/*Fonctions-modèle réalisant les requètes de gestion des utilisateurs en base de données*/
	
	// verif_bd : fonction booléenne. 
	// Si vraie, alors le profil de l'utilisateur est affecté en sortie à $profil
	function verif_bd($nom,$num,&$profil ) {
		
		require ("M/connectBD.php") ; //connexion $link à MYSQL et sélection de la base
	
		$select_joueur= "select * from joueur where nomjoueur like '%s' and motdepasse like '%s'"; 
		$req_joueur = sprintf($select_joueur,$nom,$num);
		
		
		$res_joueur = mysqli_query($link, $req_joueur)	
		or die (utf8_encode("erreur de requête : ") . $req_joueur); 
		
		if (mysqli_num_rows ($res_joueur) > 0) {
			$profil = mysqli_fetch_assoc($res_joueur);
			var_dump($profil);
			//accueil();
			return -1;
		} 
		else {
			$profil = null;
			echo 'Echec de connexion';
			return 0;
		}
		}
		
		
	
?>