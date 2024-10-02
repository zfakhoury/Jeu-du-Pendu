unit Partie;

interface

uses typeDonnees, dictionnaire;
// Interface section: declare procedures/functions here

procedure partie(style: Theme);
procedure afficherJeu(valide: Boolean; mot: TMot);
function initMot(mode: Difficulte): String;

implementation

// Implementation section: define the procedures/functions declared in the interface section here

function initMot(mode: Difficulte): String;
    begin
        Randomize;

        if mode = facile then
            initMot := motsFaciles[Random(10) + 1]
        else if mode = moyen then
            initMot := motsMoyens[Random(10) + 1]
        else
            initMot := motsDifficiles[Random(10) + 1];
    end;

procedure afficherJeu(valide: Boolean; mot: TMot);
    begin
    
    end;


procedure partie(style: Theme);
    var mot: String;
    
    begin
        mot := initMot(facile)
    end;

end.
