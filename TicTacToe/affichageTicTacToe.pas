unit AffichageTicTacToe;

interface

uses crt, typesTicTacToe, animation;

procedure afficherPlateau(plateau: TBoard);
procedure afficherCurseur(x, y: Integer);
procedure effacerCurseur(x, y: Integer);

implementation

procedure afficherPlateau(plateau: TBoard);
var i, j: Integer;
begin
    writeln('     │     │     ');
    for i := 0 to 2 do
    begin
        write('  ');
        for j := 0 to 2 do
        begin
            case plateau[i,j] of
                Empty: write(' ');
                PlayerX: begin
                    TextColor(LightBlue);  // X en bleu
                    write('X');
                    TextColor(LightGray);
                end;
                PlayerO: begin
                    TextColor(LightRed);   // O en rouge
                    write('O');
                    TextColor(LightGray);
                end;
            end;
            if j < 2 then
                write('  │  ');
        end;
        writeln;
        if i < 2 then
            writeln('─────┼─────┼─────');
        if i = 2 then
            writeln('     │     │     ');
    end;
end;

procedure afficherCurseur(x, y: Integer);
begin
    GotoXY(x * 6 + 2, y * 2 + 9);
    write('[');
    GotoXY(x * 6 + 4, y * 2 + 9);
    write(']');
end;

procedure effacerCurseur(x, y: Integer);
begin
    GotoXY(x * 6 + 2, y * 2 + 9);
    write(' ');
    GotoXY(x * 6 + 4, y * 2 + 9);
    write(' ');
end;

end. 