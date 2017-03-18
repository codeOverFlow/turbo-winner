PACKAGE BODY Bibli.Functions IS
   FUNCTION Donne_Chaine(Prefix: IN String := "Valeur") RETURN String IS
   BEGIN
      Put(Prefix & ": ");

      RETURN Get_Line;
   END Donne_Chaine;

   FUNCTION Ajuste_Chaine(Chaine: IN String; Taille: IN Positive) RETURN String IS
      Str: String(1..Taille) := (OTHERS => ' ');
   BEGIN
      IF Chaine'Length > Str'Last THEN
         Str := Chaine(Chaine'First..Str'Last);
      ELSE
         Str(1..Chaine'Length) := Chaine;
      END IF;

      RETURN Str;
   END Ajuste_Chaine;

   PROCEDURE Affiche_Oeuvre(Oeuvre: IN T_Oeuvre) IS
      Chaine_Vide: String(1..T_Nom_Piste'Last) := (OTHERS => ' ');
   BEGIN
      Put_Line(">>>>>>>>" & Oeuvre.Titre(1..Oeuvre.Titre'Length));
      Put_Line(">>>> " &  Oeuvre.Categorie'Img);
      Put_Line(">>>> " & Oeuvre.Support'Img);
      Put_Line(">>>> " & Oeuvre.Etoiles'Img);
      NEW_Line;
   END Affiche_Oeuvre;

   FUNCTION Choix_Categorie(Str: IN String) RETURN T_Categorie IS
      Categorie: T_Categorie;
   BEGIN
      CASE P_Ch.To_Upper(Str(Str'First)) IS
         WHEN 'A' => Categorie := ALBUM;
         WHEN 'J' => Categorie := JEU;
         WHEN 'F' => Categorie := FILM;
         WHEN 'O' => Categorie := AUTRE;
         WHEN OTHERS => NULL; -- echec de la precondition !
      END CASE;

      RETURN Categorie;
   END Choix_Categorie;

   FUNCTION Choix_Support(Str: IN String) RETURN T_Support IS
      Support: T_Support := T_Support'Value(P_Ch.To_Upper(Str));
   BEGIN
      RETURN Support;
   END Choix_Support;

   FUNCTION Choix_Etoiles(Str: IN String) RETURN T_Etoile IS
      Etoiles: T_Etoile := T_Etoile'Value(Str);
   BEGIN
      RETURN Etoiles;
   END Choix_Etoiles;

   FUNCTION Choix_Langue(Str: IN String) RETURN T_Langue IS
      Langue: T_Langue := T_Langue'Value(Str);
   BEGIN
      RETURN Langue;
   END Choix_Langue;

   FUNCTION Saisie_Oeuvre(Categorie: IN T_Categorie) RETURN T_Oeuvre IS
      USE Ada.Strings.Unbounded;
      Oeuvre : T_Oeuvre(Categorie);
   BEGIN
      Oeuvre.Titre := Ajuste_Chaine(Donne_Chaine("Titre"), Oeuvre.Titre'Last);
      Oeuvre.Support := Choix_Support(Donne_Chaine("Support"));
      Oeuvre.Etoiles := Choix_Etoiles(Donne_Chaine("Etoiles (0..3)"));

      CASE Categorie IS
         WHEN Film =>
            Oeuvre.Realisateur := Ajuste_Chaine(Donne_Chaine("Realisateur"), Oeuvre.Realisateur'Last);
            Oeuvre.Langue := Choix_Langue(Donne_Chaine("Langue"));
         WHEN Album => NULL;
         WHEN Jeu => NULL;
         WHEN Autre => NULL;
      END CASE;
      RETURN Oeuvre;
   END Saisie_Oeuvre;
END Bibli.Functions;
