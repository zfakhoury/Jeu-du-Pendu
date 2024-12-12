program Puissance4;

uses crt, partie, parametres, typesPuissance4, affichagePuissance4, logiquePuissance4, animation;

var input: Integer;
var theme: TTheme;

begin
    theme := dark;

    repeat
        ClrScr;
        CursorOff;
        animate('PUISSANCE 4 🎮', 50, True);
        writeln;
        writeln('1. Lancer une partie');
        writeln('2. Paramètres');
        writeln('3. Quitter');
        writeln;
        write('>>> ');
        read(input);

        if input = 1 then
            jouerPartie()
        else if input = 2 then
            parametresJeu(theme)
        else if input = 3 then
            begin
                ClrScr;
                animate('Au revoir! 👋', 50, True);
                delay(1000);
            end
        else if input <> 3 then
            begin
                ClrScr;
                animate('❌ Saisie incorrecte...', 50, False);
                delay(750);
            end;

    until input = 3;
end. 