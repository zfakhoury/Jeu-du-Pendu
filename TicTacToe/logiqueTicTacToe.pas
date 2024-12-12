unit LogiqueTicTacToe;

interface

uses typesTicTacToe;

function verifierVictoire(plateau: TBoard): TGameState; // Victoire si un joueur parvient à en aligner 3
function coupValide(plateau: TBoard; x, y: Integer): Boolean; // Vérifie si un coup est valide (Case vide? Limites du plateau?)
procedure jouerCoup(var plateau: TBoard; x, y: Integer; joueur: TPlayer); // Place un jeton selon la validité de coup
function plateauPlein(plateau: TBoard): Boolean; // Vérifie si le plateau en entier est plein

implementation

function verifierVictoire(plateau: TBoard): TGameState;
var i: Integer;
begin
    // Check rows
    for i := 0 to 2 do
    begin
        if (plateau[i,0] = plateau[i,1]) and (plateau[i,1] = plateau[i,2]) then
        begin
            case plateau[i,0] of
                PlayerX: Exit(XWins);
                PlayerO: Exit(OWins);
            end;
        end;
    end;

    // Check columns
    for i := 0 to 2 do
    begin
        if (plateau[0,i] = plateau[1,i]) and (plateau[1,i] = plateau[2,i]) then
        begin
            case plateau[0,i] of
                PlayerX: Exit(XWins);
                PlayerO: Exit(OWins);
            end;
        end;
    end;

    // Check diagonals
    if (plateau[0,0] = plateau[1,1]) and (plateau[1,1] = plateau[2,2]) then
    begin
        case plateau[0,0] of
            PlayerX: Exit(XWins);
            PlayerO: Exit(OWins);
        end;
    end;

    if (plateau[0,2] = plateau[1,1]) and (plateau[1,1] = plateau[2,0]) then
    begin
        case plateau[0,2] of
            PlayerX: Exit(XWins);
            PlayerO: Exit(OWins);
        end;
    end;

    if plateauPlein(plateau) then
        Exit(Draw)
    else
        Exit(InProgress);
end;

function coupValide(plateau: TBoard; x, y: Integer): Boolean;
begin
    coupValide := (x >= 0) and (x <= 2) and (y >= 0) and (y <= 2) and 
                 (plateau[y,x] = Empty);
end;

procedure jouerCoup(var plateau: TBoard; x, y: Integer; joueur: TPlayer);
begin
    if joueur = JoueurX then
        plateau[y,x] := PlayerX
    else
        plateau[y,x] := PlayerO;
end;

function plateauPlein(plateau: TBoard): Boolean;
var i, j: Integer;
begin
    plateauPlein := True;
    for i := 0 to 2 do
        for j := 0 to 2 do
            if plateau[i,j] = Empty then
                plateauPlein := False;
end;

end. 