unit Partie;

interface

uses crt, sysUtils, typesTicTacToe, logiqueTicTacToe, affichageTicTacToe, animation;

// Déclarations des procédures et fonctions publiques
procedure initialiserPlateau(var plateau: TBoard);
procedure jouerPartie;

implementation

var
    i, j: Integer;

// Initialise le plateau avec des cases vides
procedure initialiserPlateau(var plateau: TBoard);
begin
    for i := 0 to 2 do
        for j := 0 to 2 do
            plateau[i,j] := Empty;
end;

// Gère le déroulement d'une partie de Tic Tac Toe
procedure jouerPartie;
var
    plateau: TBoard;
    joueurActuel: TPlayer;
    gameState: TGameState;
    cursorX, cursorY: Integer;
    key: Char;
begin
    ClrScr;
    initialiserPlateau(plateau);
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
        writeln('Appuyer sur ESC pour quitter');
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
            ENTER, SPACE: begin
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
            ESC: Exit;
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
end;

end.