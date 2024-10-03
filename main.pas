program main;

uses crt, partie, parametres, typeDonnees;

var input: Integer;
var mode: Difficulte;

begin
    TextBackground(white);
    ClrScr;
    TextColor(black);

    repeat
        begin
            writeln('Bienvenu au jeu du Pendu!');
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
                    partieJeu(mode);
                end
            else if input = 2 then
                parametresJeu()
            else if input <> 3 then
                writeln('Saisie incorrecte.');
        end;

    until input = 3; 
end.
