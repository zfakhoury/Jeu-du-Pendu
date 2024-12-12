unit Animation;

interface

uses crt;

// Affiche le texte avec un délai donné entre chaque caractère pour un style d'animation
procedure animate(texte: String; time: Integer; skipLine: Boolean);

implementation

procedure animate(texte: String; time: Integer; skipLine: Boolean);
    var i: Integer;

    begin
        for i := 1 to length(texte) do
            begin
                write(texte[i]);
                delay(time);
            end;
        
        if skipLine = true then
            writeln('');
    end;


end.
