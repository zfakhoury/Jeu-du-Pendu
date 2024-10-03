program main;

uses crt, partie, parametres, typeDonnees, animation;

var input: Integer;
var mode: TDifficulte;
var theme: TTheme;

begin
    theme := dark;

    repeat
        begin
            ClrScr;
            animate('Bienvenu au jeu du Pendu 🫥');
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
                parametresJeu(theme)
            else if input <> 3 then
                begin
                    ClrScr;
                    animate('❌ Saisie incorrecte...');
                    delay(750);
                end;
        end;

    until input = 3; 
end.
