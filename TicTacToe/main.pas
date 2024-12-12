program TicTacToe;

uses crt, partie, typesTicTacToe, affichageTicTacToe, logiqueTicTacToe, animation;

var input: Integer;

begin
    repeat
        ClrScr;
        animate('TIC TAC TOE 🎮', 50, True);
        writeln;
        writeln('1. Lancer une partie');
        writeln('2. Quitter');
        writeln;
        write('>>> ');
        read(input);

        case input of
            1: jouerPartie;
            2: begin
                ClrScr;
                animate('Au revoir! 👋', 50, True);
                delay(1000);
            end;
        else
            begin
                ClrScr;
                animate('❌ Saisie incorrecte...', 50, False);
                delay(750);
            end;
        end;

    until input = 2;
end. 