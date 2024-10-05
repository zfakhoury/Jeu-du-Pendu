unit TypeDonnees;

interface

Type TTheme = (light, dark, high_contrast);

Type TDifficulte = (facile, moyen, difficile);

Type TPressed = Array[1..26] of Boolean;

Type TLettres = Record 
    lettres: Array of Char;
    n: Integer;
end;

Type TMot = Record
    chaine: String;
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
