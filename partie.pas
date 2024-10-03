unit Partie;

interface

uses typeDonnees, affichageJeu, dictionnaire, crt;

procedure partieJeu(mode: Difficulte);
procedure afficherJeu(valide: Boolean; mot: TMot);
function initMot(mode: Difficulte): TMot;
procedure lectureEntree();

implementation

function initMot(mode: Difficulte): TMot;
    var i: Integer;

    begin
        Randomize;

        if mode = facile then
            initMot.chaine := motsFaciles[Random(10) + 1]
        else if mode = moyen then
            initMot.chaine := motsMoyens[Random(10) + 1]
        else
            initMot.chaine := motsDifficiles[Random(10) + 1];

        initMot.longueurMot := length(initMot.chaine);

        setLength(initMot.cache, initMot.longueurMot);
        setLength(initMot.lettres, initMot.longueurMot);

        for i := 1 to initMot.longueurMot do
            begin
                initMot.lettres[i] := initMot.chaine[i];
                initMot.cache[i] := True;
            end;
    end;

procedure afficherJeu(valide: Boolean; mot: TMot);
    begin
        afficherMot(True, mot);
    end;


procedure partieJeu(mode: Difficulte);
    var mot: TMot;

    begin
        mot := initMot(mode);
        afficherJeu(True, mot);
        writeln(mot.chaine);
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
        y := 5;
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
                        delay(1500); // laisser du temps à l'utilisateur pour appréhender 
                        ClrScr;
                    end;

                #97..#122: begin  // Charactères ASCII de a à z (minuscule)
                    write(UpCase(ch));
                    if x < 80 then x := x + 1;
                end;
                end;
            end;
    end;


end.