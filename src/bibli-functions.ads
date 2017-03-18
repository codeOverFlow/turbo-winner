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
   WITH
     Pre => P_Ch.To_Upper(Str) = "A" OR P_Ch.To_Upper(Str) = "J" OR P_Ch.To_Upper(Str) = "F" OR P_Ch.To_Upper(Str) = "O",
     Post => Choix_Categorie'Result'Valid;

   -- choix support
   FUNCTION Choix_Support(Str: IN String) RETURN T_Support
   WITH Pre => T_Support'Value(P_Ch.To_Upper(Str)) IN T_Support,
     Post => Choix_Support'Result'img = P_Ch.To_Upper(Str);

   -- choix etoiles
   FUNCTION Choix_Etoiles(Str: IN String) RETURN T_Etoile
   WITH Pre => T_Etoile'Value(Str) IN T_Etoile,
     Post => Choix_Etoiles'Result = T_Etoile'Value(Str);

   -- choix langue
   FUNCTION Choix_Langue(Str: IN String) RETURN T_Langue
     WITH Pre => T_Langue'Value(P_Ch.To_Upper(Str)) IN T_Langue,
     Post => Choix_Langue'Result'img = P_Ch.To_Upper(Str);

   -- saisie oeuvre
   FUNCTION Saisie_Oeuvre(Categorie: IN T_Categorie) RETURN T_Oeuvre
   WITH
     Pre => Categorie'Valid,
     Post => Saisie_Oeuvre'Result.Categorie'Valid;
END Bibli.Functions;
