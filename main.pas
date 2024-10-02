program main;

var input: Integer;

begin
    writeln('Bienvenu au jeu du Pendu');
    writeln('');
    repeat
        begin
            writeln('1. Lancer une partie');
            writeln('2. Paramètres');
            writeln('3. Quitter');
            writeln('');
            write('Entrée: ');
            read(input);
            writeln('');

            case input of
                1: writeln('...');
                2: writeln('ooo');
            else
                writeln('Saisie incorrecte');
        end;

    until input = 3; 
end.
