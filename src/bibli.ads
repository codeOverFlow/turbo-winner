WITH Ada.Text_IO; USE Ada.Text_IO;

PACKAGE Bibli IS

   TYPE T_Categorie IS (AUTRE, FILM, JEU, ALBUM);
   TYPE T_Support IS (CD, DVD, BLUERAY, VHS, HDDVD);
   SUBTYPE T_Etoile IS Natural RANGE 0..3;

   TYPE T_Langue IS (VF, VO, VOSTFR);
   TYPE T_Nom_Piste IS NEW String(1..50);
   TYPE T_Pistes IS ARRAY(1..30) OF T_Nom_Piste;

   TYPE T_Oeuvre(Categorie: T_Categorie := AUTRE) IS PRIVATE;

   TYPE T_Autre IS PRIVATE;
   TYPE T_FILM IS PRIVATE;
   TYPE T_JEU IS PRIVATE;
   TYPE T_ALBUM IS PRIVATE;

PRIVATE

   TYPE T_Oeuvre(Categorie: T_Categorie := AUTRE) IS RECORD
      Titre: String(1..100) := (OTHERS => ' ');
      Support: T_Support := CD;
      Etoiles: T_Etoile := 0;

      CASE Categorie IS
         WHEN FILM =>
            Realisateur: String(1..50) := (OTHERS => ' ');
            Langue: T_Langue := VF;
         WHEN JEU =>
            Console: String(1..30) := (OTHERS => ' ');
            Est_Fini: Boolean := False;
         WHEN ALBUM =>
            Artiste: String(1..50) := (OTHERS => ' ');
            Pistes: T_Pistes := (OTHERS => (OTHERS => ' '));
         WHEN OTHERS => NULL;
      END CASE;
   END RECORD;

   TYPE T_Autre IS NEW T_Oeuvre;
   TYPE T_FILM IS NEW T_Oeuvre(FILM);
   TYPE T_JEU IS NEW T_Oeuvre(JEU);
   TYPE T_ALBUM IS NEW T_Oeuvre(ALBUM);
END Bibli;
