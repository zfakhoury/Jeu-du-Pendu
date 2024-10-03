unit Partie;

interface

uses typeDonnees, dictionnaire, crt;

procedure partieJeu(style: Theme; mode: Difficulte);
procedure afficherJeu(valide: Boolean; mot: TMot);
function initMot(mode: Difficulte): String;
procedure lectureEntree();

implementation

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


procedure partieJeu(style: Theme; mode: Difficulte);
    var mot: String;
    
    begin
        mot := initMot(mode);
        writeln(mot);
        lectureEntree();

    end;

procedure lectureEntree();
    var
        ch: char;
        x, y: integer;
        running: boolean;

    begin
        ClrScr;
        x := 10;
        y := 10;
        running := true;
        
        writeln('Utiliser les flêches pour naviguer, le clavier pour ajouter des lettres, ENTRER pour valider, ESC pour quitter.');
        
        while running do
            begin
                GotoXY(x, y);
                ch := ReadKey;
                
                case ch of
                #0: 
                    begin
                        ch := ReadKey;
                        case ch of
                        // UP: if y > 1 then y := y - 1;
                        // DOWN: if y < 25 then y := y + 1;
                        LEFT: if x > 1 then x := x - 1;
                        RIGHT: if x < 80 then x := x + 1;
                        end;
                    end;
                ESC: 
                    begin
                        writeln('Exiting...');
                        running := false;
                    end;

                #97..#122: begin  // Charactères ASCII de a à z (minuscule)
                    write(UpCase(ch));
                    if x < 80 then x := x + 1;
                end;
                end;
            end;
    end;


end.