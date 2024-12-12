unit AffichagePuissance4;

interface

uses crt, typesPuissance4;

procedure afficherPlateau(plateau: TPlateau);
procedure afficherCurseur(position: Integer);

implementation

procedure afficherPlateau(plateau: TPlateau);
var 
    i, j: Integer;
begin
    // Affiche les numéros des colonnes
    write('  ');
    for j := 0 to 6 do
        write(j+1, '   ');
    writeln;
    
    // Affiche le plateau
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
    
    // Affiche la base du plateau
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