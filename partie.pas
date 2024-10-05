unit Partie;

interface

uses typeDonnees, affichageJeu, dictionnaire, crt, animation;

procedure partieJeu(mode: TDifficulte);
function initMot(mode: TDifficulte): TMot;
procedure modeDifficulte(var mode: TDifficulte);
function entreeValide(key: Char; mot: TMot): Boolean;
procedure updateTMot(key: Char; var mot: TMot);
procedure updateTentatives(valide: Boolean; key: Char; pressedKeys: TPressed; var tentatives: Integer);
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
            animate('🤔 DIFFICULTÉ', 50, True);
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
                    animate('❌ Saisie incorrecte...', 50, False);
                    delay(750);
                end;
        until (input >= 1) and (input <= 3);
    end;


procedure partieJeu(mode: TDifficulte);
    var mot: TMot;
    var key: Char;
    var valide: Boolean;
    var tentatives, i: Integer;
    var pressedKeys: TPressed;

    begin
        tentatives := 0;
        valide := False;
        key := #0;
        mot := initMot(mode);

        for i := 1 to 26 do
            pressedKeys[i] := False;

        ClrScr;

        while True do
            begin
                ClrScr;
                writeln('> Utiliser le clavier pour ajouter des lettres.');
                writeln('> Appuyer sur ESC pour quitter.');
                
                GotoXY(1, 4);
                afficherPendu(tentatives);
                GotoXY(20, 8);
                afficherMot(valide, mot);
                GotoXY(40, 4);
                write('Vies restantes: ', 6 - tentatives);
                GotoXY(40, 6);
                afficherPressedLettres(key, pressedKeys);

                if partieGagnee(mot) then
                    begin
                        delay(2000);
                        ClrScr;
                        animate('Partie gagnée 🏆', 50, True);
                        writeln('');
                        animate('Vous avez deviné ' + UpCase(mot.chaine), 50, False);
                        delay(3000);
                        break;
                    end
                else if tentatives = 6 then
                    begin
                        delay(2000);
                        ClrScr;
                        animate('Partie perdue 💀', 50, True);
                        writeln('');
                        animate('Le mot était ' + UpCase(mot.chaine), 50, False);
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
                            animate('🚪 Exiting...', 50, False);
                            for i := 1 to 2 do
                                begin
                                    delay(500);
                                    ClrScr;
                                    write('🚪 Exitin');
                                    animate('g...', 100, False);
                                end;
                            delay(750);
                            break;
                        end;

                    #97..#122:  // Charactères ASCII de a à z (minuscule)
                        begin
                            valide := entreeValide(key, mot);
                            updateTMot(key, mot);
                            updateTentatives(valide, key, pressedKeys, tentatives);
                            GotoXY(1, 1);
                        end;
                    else continue;

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


procedure updateTentatives(valide: Boolean; key: Char; pressedKeys: TPressed; var tentatives: Integer);
    var i, index: Integer;

    begin
        index := ord(key) - ord('a') + 1;

        if not(valide) then
            if not(pressedKeys[index]) then
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
            if key = mot.chaine[i] then
                begin
                    mot.cache[i] := False;
                    entreeValide := True;
                end
    end;


end.
