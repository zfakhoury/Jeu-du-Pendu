unit Parametres;

interface

uses typeDonnees, crt;

procedure parametresJeu(style: Theme);
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
    begin

    end;

procedure modeDifficulte(var mode: Difficulte);
    var input: Integer;

    begin
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

procedure parametresJeu(style: Theme);
    begin
        writeln('');
        writeln('1. Afficher les scores');
        writeln('2. Choisir le thème');
        writeln('3. Changer de difficulté');
        writeln('');
        write('Entrée: ');
        read(input);
    end;

end.