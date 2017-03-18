WITH Ada.Strings.Unbounded;
WITH Ada.Characters.Handling;
WITH Bibli;
PACKAGE Bibli.Functions IS
   pragma Assertion_Policy(Check);
   USE Bibli;

   PACKAGE P_Ch RENAMES Ada.Characters.Handling;

   -- lit une string sur STDIN
   FUNCTION Donne_Chaine(Prefix: IN String := "Valeur") RETURN String;


   -- met une string a la bonne taille
   FUNCTION Ajuste_Chaine(Chaine: IN String; Taille: IN Positive) RETURN String
   WITH Post => Ajuste_Chaine'Result'Length = Taille;


   -- affiche une oeuvre
   PROCEDURE Affiche_Oeuvre(Oeuvre: IN T_Oeuvre);

   -- choix categorie
   FUNCTION Choix_Categorie(Str: IN String) RETURN T_Categorie
   WITH Post => (Str'Length > 0 AND THEN Choix_Categorie'Result'Img(Choix_Categorie'Result'Img'First) = Str(Str'First)) OR ELSE Choix_Categorie'Result'Valid;

   -- choix support
   FUNCTION Choix_Support(Str: IN String) RETURN T_Support
   WITH Post => Choix_Support'Result'img = P_Ch.To_Upper(Str) OR ELSE Choix_Support'Result'Valid;

   -- choix etoiles
   FUNCTION Choix_Etoiles(Str: IN String) RETURN T_Etoile
   WITH Post => (Str'Length > 0 AND THEN Choix_Etoiles'Result = T_Etoile'Value(Str)) OR ELSE Choix_Etoiles'Result'Valid;

   -- choix langue
   FUNCTION Choix_Langue(Str: IN String) RETURN T_Langue
     WITH Post => Choix_Langue'Result'img = P_Ch.To_Upper(Str) OR ELSE Choix_Langue'Result'Valid;

   -- saisie oeuvre
   FUNCTION Saisie_Oeuvre(Categorie: IN T_Categorie) RETURN T_Oeuvre
   WITH Post => Saisie_Oeuvre'Result.Categorie = Categorie;
END Bibli.Functions;
