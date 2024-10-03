unit TypeDonnees;

interface

Type Theme = (light, dark, github, high_contrast);

Type Difficulte = (facile, moyen, difficile);

Type TMot = Record
    chaine: String;
    lettres: Array of Char;
    cache: Array of Boolean;
    longueurMot: Integer;
end;

Type TResultat = Record
    score: Integer;
    gagne: Boolean;
    mot: String;
end;

const UP = #72;
const DOWN = #80;
const LEFT = #75;
const RIGHT = #77;
const ENTER = #13;
const DEL = #8;
const ESC = #27;

implementation

end.
