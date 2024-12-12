program Puissance4;

uses crt, typesPuissance4, affichagePuissance4, logiquePuissance4, animation;

var
    plateau: TPlateau;
    joueurActuel: TJoueur;
    etatJeu: TEtatJeu;
    cursorPosition: Integer;
    key: Char;
    i, j: Integer;
    input: Integer;

procedure initialiserPlateau;
begin
    // Initialise le plateau avec des cases vides
    for i := 0 to 5 do
        for j := 0 to 6 do
            plateau[i,j] := Vide;
end;

procedure jouerPartie;
begin
    ClrScr;
    initialiserPlateau;
    joueurActuel := JoueurRouge;
    cursorPosition := 3;  // Position initiale au milieu
    etatJeu := EnCours;

    // Animation du titre une seule fois au début
    animate('PUISSANCE 4', 50, True);
    writeln;

    while True do
    begin
        ClrScr;
        writeln('PUISSANCE 4');
        writeln;
        writeln('Utiliser les flèches ou WASD pour se déplacer');
        writeln('ENTER ou ESPACE pour jouer, ESC pour quitter');
        writeln;
        write('Joueur actuel: ');
        if joueurActuel = JoueurRouge then
        begin
            TextColor(Red);
            writeln('Rouge');
        end
        else begin
            TextColor(Yellow);
            writeln('Jaune');
        end;
        TextColor(LightGray);
        writeln('');
        writeln('');
        
        // Afficher le plateau et le curseur dans le bon ordre
        afficherPlateau(plateau);
        afficherCurseur(cursorPosition);
        
        key := ReadKey;
        case key of
            #0: begin
                key := ReadKey;
                case key of
                    LEFT: if cursorPosition > 0 then
                        cursorPosition := cursorPosition - 1;
                    RIGHT: if cursorPosition < 6 then
                        cursorPosition := cursorPosition + 1;
                end;
            end;
            'a', 'A': if cursorPosition > 0 then
                cursorPosition := cursorPosition - 1;
            'd', 'D': if cursorPosition < 6 then
                cursorPosition := cursorPosition + 1;
            ENTER, SPACE: begin
                if coupValide(plateau, cursorPosition) then
                begin
                    jouerCoup(plateau, cursorPosition, joueurActuel);
                    etatJeu := verifierVictoire(plateau);
                    
                    if etatJeu <> EnCours then
                        break;
                        
                    if joueurActuel = JoueurRouge then
                        joueurActuel := JoueurJaune
                    else
                        joueurActuel := JoueurRouge;
                end;
            end;
            ESC: Exit;
        end;
    end;

    // Affichage de fin de partie
    ClrScr;
    afficherPlateau(plateau);
    writeln;
    
    case etatJeu of
        VictoireRouge: begin
            TextColor(Red);
            animate('Le joueur Rouge a gagné! 🎉', 50, True);
        end;
        VictoireJaune: begin
            TextColor(Yellow);
            animate('Le joueur Jaune a gagné! 🎉', 50, True);
        end;
        Egalite: animate('Match nul! 🤝', 50, True);
    end;
    TextColor(LightGray);
    
    delay(2000);
    CursorOn;
end;

begin
    repeat
        ClrScr;
        CursorOff;
        animate('PUISSANCE 4 🎮', 50, True);
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
    CursorOn;
end. 