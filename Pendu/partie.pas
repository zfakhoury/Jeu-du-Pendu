unit Partie;

interface

uses typeDonnees, affichageJeu, dictionnaire, crt, sysUtils, animation;

procedure partieJeu(mode: TDifficulte); // Vue principale du jeu
function initMot(mode: TDifficulte): TMot; // Prépare un mot à partir du fichier dictionnaire.pas
procedure modeDifficulte(var mode: TDifficulte); // Choix de difficulté
function entreeValide(key: Char; mot: TMot): Boolean; // Vérifie la justesse de l'entrée (touche déjà appuyée? Exclusion des nombres, etc.)
procedure updateTMot(key: Char; var mot: TMot); // Mettre à jour le mot 
procedure updateTentatives(valide: Boolean; key: Char; pressedKeys: TPressed; var tentatives: Integer); // Met à jour le nombre de tentatives selon la validité de la touche appuyée 
function partieGagnee(mot: TMot): Boolean; // Vérifie si la partie a été gagnée ou pas
procedure saveResultat(resultat: TResultat); // Enregistre les résultats dans un fichier texte (historique du jeu)

implementation

procedure saveResultat(resultat: TResultat);
    var f: TextFile;

    begin
        assign(f, 'resultats.txt');
        if fileExists('resultats.txt') then
            append(f)
        else 
            rewrite(f);
        
        writeln(f, DateTimeToStr(Now));
        writeln(f, UpCase(resultat.mot));
        writeln(f, resultat.score, ' points');
        if resultat.gagne then
            writeln(f, 'Gagné')
        else 
            writeln(f, 'Perdu');

        writeln(f, '');
        
        close(f);
    end;

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
    var resultat: TResultat;

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
                        resultat.score := 10;
                        resultat.mot := mot.chaine;
                        resultat.gagne := True;
                        saveResultat(resultat);
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
                        resultat.score := 10;
                        resultat.mot := mot.chaine;
                        resultat.gagne := False;
                        saveResultat(resultat);
                        delay(3000);
                        break;
                    end;

                key := ReadKey;
                
                case key of
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
