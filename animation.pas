unit Animation;

interface

uses crt;

procedure animate(texte: String);

implementation

procedure animate(texte: String);
    var i: Integer;

    begin
        for i := 1 to length(texte) do
            begin
                write(texte[i]);
                delay(50);
            end;
        
        writeln('');
    end;

end.
