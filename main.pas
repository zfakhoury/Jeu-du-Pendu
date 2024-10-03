program main;

uses crt, partie, parametres, typeDonnees;

var input: Integer;
var mode: Difficulte;

begin
    TextBackground(white);
    ClrScr;
    TextColor(black);
    writeln('Bienvenu au jeu du Pendu');
    repeat
        begin
            writeln('');
            writeln('1. Lancer une partie');
            writeln('2. Paramètres');
            writeln('3. Quitter');
            writeln('');
            write('Entrée: ');
            read(input);
            
            ClrScr;

            if input = 1 then
                begin
                    modeDifficulte(mode);
                    writeln(mode);
                    partieJeu(spring, mode);
                end
            else if input = 2 then
                parametresJeu(spring)
            else if input <> 3 then
                writeln('Saisie incorrecte.');
        end;

    until input = 3; 
end.
