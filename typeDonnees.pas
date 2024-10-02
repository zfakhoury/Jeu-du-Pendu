unit TypeDonnees;

interface

// Interface section: declare public types, variables, constants

type Theme = (spring, summer, autumn, winter);

type Difficulte = (facile, moyen, difficile);

Type TMot = Record
    lettres: Array of Char;
    cache: Array of Boolean;
    longueurMot: Integer;
end;

Type TResultat = Record
    score: Integer;
    gagne: Boolean;
    mot: String;
end;


implementation

end.
