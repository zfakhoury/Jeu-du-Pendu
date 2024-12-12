program TicTacToe;

uses crt, typesTicTacToe, affichageTicTacToe, logiqueTicTacToe, animation;

var
    plateau: TBoard;
    joueurActuel: TPlayer;
    gameState: TGameState;
    cursorX, cursorY: Integer;
    key: Char;
    i, j: Integer;
    input: Integer;

procedure initialiserPlateau;
begin
    for i := 0 to 2 do
        for j := 0 to 2 do
            plateau[i,j] := Empty;
end;

procedure jouerPartie;
begin
    ClrScr;
    initialiserPlateau;
    joueurActuel := JoueurX;
    cursorX := 1;
    cursorY := 1;
    gameState := InProgress;

    animate('TIC TAC TOE', 50, True);
    writeln;

    while True do
    begin
        ClrScr;
        writeln('TIC TAC TOE');
        writeln;
        writeln('Utiliser les flèches ou WASD pour se déplacer');
        writeln('Appuyer sur ENTER ou ESPACE pour jouer');
        writeln('Apputer sur ESC pour quitter');
        writeln('');
        write('Joueur actuel: ');
        if joueurActuel = JoueurX then
        begin
            TextColor(LightBlue);
            writeln('X');
        end
        else begin
            TextColor(LightRed);
            writeln('O');
        end;
        TextColor(LightGray);
        writeln('');
        afficherPlateau(plateau);
        afficherCurseur(cursorX, cursorY);

        key := ReadKey;
        case key of
            #0: begin
                key := ReadKey;
                case key of
                    UP: if cursorY > 0 then cursorY := cursorY - 1;
                    DOWN: if cursorY < 2 then cursorY := cursorY + 1;
                    LEFT: if cursorX > 0 then cursorX := cursorX - 1;
                    RIGHT: if cursorX < 2 then cursorX := cursorX + 1;
                end;
            end;
            'w', 'W': if cursorY > 0 then cursorY := cursorY - 1;
            's', 'S': if cursorY < 2 then cursorY := cursorY + 1;
            'a', 'A': if cursorX > 0 then cursorX := cursorX - 1;
            'd', 'D': if cursorX < 2 then cursorX := cursorX + 1;
            ENTER, SPACE: begin // Enter key or Space key
                if coupValide(plateau, cursorX, cursorY) then
                begin
                    jouerCoup(plateau, cursorX, cursorY, joueurActuel);
                    gameState := verifierVictoire(plateau);
                    
                    if gameState <> InProgress then
                        break;
                        
                    if joueurActuel = JoueurX then
                        joueurActuel := JoueurO
                    else
                        joueurActuel := JoueurX;
                end;
            end;
            ESC: Exit; // ESC key
        end;
    end;

    ClrScr;
    afficherPlateau(plateau);
    writeln;
    
    case gameState of
        XWins: begin
            TextColor(LightBlue);
            animate('Le joueur X a gagné! 🎉', 50, True);
        end;
        OWins: begin
            TextColor(LightRed);
            animate('Le joueur O a gagné! 🎉', 50, True);
        end;
        Draw: animate('Match nul! 🤝', 50, True);
    end;
    TextColor(LightGray);
    
    delay(2000);
    CursorOn;
end;

begin
    repeat
        ClrScr;
        CursorOn;
        animate('TIC TAC TOE 🎮', 50, True);
        writeln;
        writeln('1. Nouvelle partie');
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