unit LogiquePuissance4;

interface

uses typesPuissance4;

// Fonctions principales du jeu
function verifierVictoire(plateau: TPlateau): TEtatJeu;
function coupValide(plateau: TPlateau; colonne: Integer): Boolean;
procedure jouerCoup(var plateau: TPlateau; colonne: Integer; joueur: TJoueur);
function trouverLigne(plateau: TPlateau; colonne: Integer): Integer;

implementation

function trouverLigne(plateau: TPlateau; colonne: Integer): Integer;
var ligne: Integer;
begin
    // Trouve la première position libre dans la colonne (en partant du bas)
    for ligne := 5 downto 0 do
        if plateau[ligne, colonne] = Vide then
            Exit(ligne);
    trouverLigne := -1;  // Colonne pleine
end;

function coupValide(plateau: TPlateau; colonne: Integer): Boolean;
begin
    // Vérifie si la colonne est valide et non pleine
    coupValide := (colonne >= 0) and (colonne <= 6) and 
                  (plateau[0, colonne] = Vide);
end;

procedure jouerCoup(var plateau: TPlateau; colonne: Integer; joueur: TJoueur);
var ligne: Integer;
begin
    // Place le jeton dans la première position libre de la colonne
    ligne := trouverLigne(plateau, colonne);
    if ligne >= 0 then
        if joueur = JoueurRouge then
            plateau[ligne, colonne] := Rouge
        else
            plateau[ligne, colonne] := Jaune;
end;

function verifierVictoire(plateau: TPlateau): TEtatJeu;
var 
    i, j: Integer;
    plateauPlein: Boolean;

    // Vérifie 4 jetons alignés dans une direction donnée
    function verifierDirection(ligne, col, dLigne, dCol: Integer): Boolean;
    var 
        count: Integer;
        couleur: TCase;
    begin
        couleur := plateau[ligne, col];
        if couleur = Vide then Exit(False);
        
        count := 1;
        // Vérifie dans la direction positive
        while (count < 4) and 
              (ligne + dLigne * count >= 0) and (ligne + dLigne * count <= 5) and
              (col + dCol * count >= 0) and (col + dCol * count <= 6) and
              (plateau[ligne + dLigne * count, col + dCol * count] = couleur) do
            Inc(count);
            
        verifierDirection := (count >= 4);
    end;

begin
    plateauPlein := True;

    // Vérifie toutes les positions possibles
    for i := 0 to 5 do
        for j := 0 to 6 do
        begin
            if plateau[i,j] = Vide then
                plateauPlein := False;

            // Vérifie horizontal, vertical et les deux diagonales
            if verifierDirection(i, j, 0, 1) or  // Horizontal
               verifierDirection(i, j, 1, 0) or  // Vertical
               verifierDirection(i, j, 1, 1) or  // Diagonale \
               verifierDirection(i, j, 1, -1) then  // Diagonale /
            begin
                if plateau[i,j] = Rouge then
                    Exit(VictoireRouge)
                else if plateau[i,j] = Jaune then
                    Exit(VictoireJaune);
            end;
        end;

    if plateauPlein then
        Exit(Egalite)
    else
        Exit(EnCours);
end;

end. 