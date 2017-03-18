WITH Ada.Text_IO; USE Ada.Text_IO;

WITH Bibli; USE Bibli;
WITH Bibli.Functions; USE Bibli.Functions;

PROCEDURE App IS
   Categorie: T_Categorie;
   Oeuvre: T_Oeuvre;
BEGIN
   Categorie := Choix_Categorie(Donne_Chaine("Categorie (F, A, J, O)"));
   Oeuvre := Saisie_Oeuvre(Categorie);
   Affiche_Oeuvre(Oeuvre);
END App;
