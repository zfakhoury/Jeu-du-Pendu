unit Partie;

interface

uses typeDonnees, affichageJeu, dictionnaire, crt, animation;

procedure partieJeu(mode: TDifficulte);
function initMot(mode: TDifficulte): TMot;
procedure modeDifficulte(var mode: TDifficulte);
function entreeValide(key: Char; mot: TMot): Boolean;
procedure updateTMot(key: Char; var mot: TMot);
procedure updateTentatives(valide: Boolean; var tentatives: Integer);
function partieGagnee(mot: TMot): Boolean;

implementation

function initMot(mode: TDifficulte): TMot;
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

        for i := 1 to initMot.longueurMot do
            initMot.cache[i] := True;
    end;

procedure modeDifficulte(var mode: TDifficulte);
    var input: Integer;

    begin
        repeat
            ClrScr;
            animate('🤔 DIFFICULTÉ');
            writeln('');
            writeln('1. Facile  2. Moyen  3. Difficile');
            writeln('');
            write('Niveau: ');
            read(input);

            case input of
                1: mode := facile;
                2: mode := moyen;
            else
                mode := difficile;
            end;

            if input = 1 then
                mode := facile
            else if input = 2 then
                mode := moyen
            else if input = 3 then
                mode := difficile
            else
                begin
                    ClrScr;
                    animate('❌ Saisie incorrecte...');
                    delay(750);
                end;
        until (input >= 1) and (input <= 3);
    end;

procedure afficherJeu(valide: Boolean; mot: TMot);
    begin
        afficherMot(True, mot);
    end;


procedure partieJeu(mode: TDifficulte);
    var mot: TMot;
    var key: Char;
    var running: Boolean;
    var valide: Boolean;
    var tentatives: Integer;

    begin
        ClrScr;
        tentatives := 0;
        mot := initMot(mode);
        valide := False;

        while True do
            begin
                ClrScr;
                writeln('> Utiliser le clavier pour ajouter des lettres.');
                writeln('> Appuyer sur ESC pour quitter.');

                GotoXY(1, 4);
                afficherPendu(tentatives);
                GotoXY(20, 8);
                afficherMot(valide, mot);

                if partieGagnee(mot) then
                    begin
                        delay(2000);
                        ClrScr;
                        animate('Partie gagnée 🏆');
                        writeln('');
                        animate('Vous avez deviné ' + UpCase(mot.chaine));
                        delay(3000);
                        break;
                    end
                else if tentatives = 6 then
                    begin
                        delay(2000);
                        ClrScr;
                        animate('Partie perdue 💀');
                        writeln('');
                        animate('Le mot était ' + UpCase(mot.chaine));
                        delay(3000);
                        break;
                    end;

                key := ReadKey;

                case key of
                #0:
                    begin
                        // Pour l'instant on va uniquement lire les lettres

                        // ch := ReadKey;
                        // case ch of
                        // UP: if y > 1 then y := y - 1;
                        // DOWN: if y < 25 then y := y + 1;
                        // LEFT: if x > 1 then x := x - 1;
                        // RIGHT: if x < 80 then x := x + 1;
                        // end;
                    end;
                ESC:
                    begin
                        ClrScr;
                        animate('🚪 Exiting...');
                        delay(750);
                        break;
                    end;

                #97..#122:  // Charactères ASCII de a à z (minuscule)
                    begin
                        valide := entreeValide(key, mot);
                        writeln(valide);
                        updateTMot(key, mot);
                        updateTentatives(valide, tentatives);
                    end;
                end;

            end;
    end;


procedure updateTMot(key: Char; var mot: TMot);
    var i: Integer;

    begin
        for i := 1 to mot.longueurMot do
            if key = mot.chaine[i] then
                begin
                    if mot.cache[i] = True then
                        mot.cache[i] := False;
                end
    end;


procedure updateTentatives(valide: Boolean; var tentatives: Integer);
    begin
        if valide then
            tentatives := tentatives + 1;
    end;

function partieGagnee(mot: TMot): Boolean;
    var i: Integer;

    begin
        partieGagnee := True;

        for i := 1 to mot.longueurMot do
            if mot.cache[i] = True then
                begin
                    partieGagnee := False;
                    break;
                end;

    end;

function entreeValide(key: Char; mot: TMot): Boolean;
    var i: Integer;

    begin
        entreeValide := False;
        for i := 1 to mot.longueurMot do
            if (key = mot.chaine[i]) and (mot.cache[i] = True) then
                    mot.cache[i] := False;
    end;

end.
