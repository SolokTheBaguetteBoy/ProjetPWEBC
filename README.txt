Principe de l'application :
	Les joueurs doivent rechercher les tr�sors disponible qui auront tous �t� cach� par d'autres joueurs de l'application

Partage entre client :
	La base de donn�e contenant tous les tr�sors cach�s par les joueurs

Noms et mots de passe (Nom / mot de passe) :
	Solok / motdepasse
	Solok2 / motedepasse2

Fichier de base de donn�e � d�ployer :
	pwebcprojet.sql

Proc�dure d'installation :

1) --------
Placer l'archive sur un serveur wamp/u-wamp
-----
2) --------
Importer le fichier "pwebcprojet.sql" sur une base de donn�e phpmyadmin ou �quivalent
-----
3) --------
Configurer le fichier "M/connectBD.php" afin qu'il se connecte � la bonne base de donn�e
----

BUGS CONNUS :

	- Le message d'alert nous disant si le tr�sor � �t� trouv� ou pas contient de l'affichage en trop depuis l'introduction de Bootstrap au projet
	- Il se peut qu'il y ait un bug lorsqu'on se connect affichant que "treasureSelecter n'existe pas", il n'arrive pas tout le temps