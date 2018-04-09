Principe de l'application :
	Les joueurs doivent rechercher les trésors disponible qui auront tous été caché par d'autres joueurs de l'application

Partage entre client :
	La base de donnée contenant tous les trésors cachés par les joueurs

Noms et mots de passe (Nom / mot de passe) :
	Solok / motdepasse
	Solok2 / motedepasse2

Fichier de base de donnée à déployer :
	pwebcprojet.sql

Procédure d'installation :

1) --------
Placer l'archive sur un serveur wamp/u-wamp
-----
2) --------
Importer le fichier "pwebcprojet.sql" sur une base de donnée phpmyadmin ou équivalent
-----
3) --------
Configurer le fichier "M/connectBD.php" afin qu'il se connecte à la bonne base de donnée
----

BUGS CONNUS :

	- Le message d'alert nous disant si le trésor à été trouvé ou pas contient de l'affichage en trop depuis l'introduction de Bootstrap au projet
	- Il se peut qu'il y ait un bug lorsqu'on se connect affichant que "treasureSelecter n'existe pas", il n'arrive pas tout le temps