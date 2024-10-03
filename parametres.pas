unit Parametres;

interface

uses typeDonnees, crt;

procedure parametresJeu();
procedure afficherScore(nomFichier: String);
procedure choisirTheme();
procedure modeDifficulte(var mode: Difficulte);

implementation

procedure afficherScore(nomFichier: String);
    var resultat: TResultat;
    var fichier: File of TResultat;
    
    begin
        assign(fichier, nomFichier);
        reset(fichier);

        while not EOF(fichier) do
        begin
            read(fichier, resultat);
            with resultat do
            begin
            writeLn('Mot: ', resultat.mot);
            writeLn('Score: ', resultat.score);
            writeLn('Gagné: ', resultat.gagne);
            writeLn('------------------------');
            end;
    end;

    close(fichier);
    end;

procedure choisirTheme();
    var choix: Integer;
    begin
        ClrScr;
        writeln('Choisir le thème');
        writeln('');
        writeln('1. Light  2. Dark  3. High Contrast');
        writeln('');
        repeat
            write('Choix: ');
            read(choix);
        until (choix >= 1) and (choix <= 4);

        if choix = 1 then
            begin
                TextBackground(white);
                TextColor(black);
            end
        else if choix = 2 then
            begin
                TextBackground(black);
                TextColor(white);
            end
        else
            begin
                TextBackground(yellow);
                TextColor(blue);
            end;
        
        ClrScr;
    end;

procedure modeDifficulte(var mode: Difficulte);
    var input: Integer;

    begin
        ClrScr;
        writeln('Choisir la difficulté');
        writeln('');
        writeln('1. Facile  2. Moyen  3. Difficile');
        readln(input);

        case input of
            1: mode := facile;
            2: mode := moyen;
        else
            mode := difficile;
        end;
        ClrScr;
    end;

procedure parametresJeu();
    var input: Integer;

    begin
        ClrScr;

        repeat
            writeln('Paramètres');
            writeln('');
            writeln('1. Afficher les scores');
            writeln('2. Choisir le thème');
            writeln('3. Changer de difficulté');
            writeln('4. Revenir au menu');
            writeln('');
            write('Entrée: ');
            read(input);

            ClrScr;

            if input = 1 then
                writeln('Affichage du score...')
            else if input = 2 then
                choisirTheme();

        until input = 4;
    end;

end.