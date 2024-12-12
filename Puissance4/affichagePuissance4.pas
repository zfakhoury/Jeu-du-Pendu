unit AffichagePuissance4;

interface

uses crt, typesPuissance4;

procedure afficherPlateau(plateau: TPlateau); // Affiche un tableau 6 x 7
procedure afficherCurseur(position: Integer); // Affiche la position du curseur 

implementation

procedure afficherPlateau(plateau: TPlateau);
var 
    i, j: Integer;
begin
    write('  ');
    for j := 1 to 7 do
        write(j, '   ');
    writeln;
    
    for i := 0 to 5 do
    begin
        write('│');
        for j := 0 to 6 do
        begin
            write(' ');
            case plateau[i,j] of
                Vide: write('·');
                Rouge: begin
                    TextColor(Red);
                    write('O');
                    TextColor(LightGray);
                end;
                Jaune: begin
                    TextColor(Yellow);
                    write('O');
                    TextColor(LightGray);
                end;
            end;
            write(' │');
        end;
        writeln;
        if i < 5 then
        begin
            write('├');
            for j := 0 to 6 do
            begin
                if j < 6 then
                    write('───┼')
                else
                    write('───┤');
            end;
            writeln;
        end;
    end;
    
    write('└');
    for j := 0 to 6 do
    begin
        if j < 6 then
            write('───┴')
        else
            write('───┘');
    end;
    writeln;
end;

procedure afficherCurseur(position: Integer);
begin
    GotoXY(position * 4 + 3, 8);
end;

end. 