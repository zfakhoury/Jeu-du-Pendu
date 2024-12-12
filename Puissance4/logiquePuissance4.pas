unit LogiquePuissance4;

interface

uses typesPuissance4;

function verifierVictoire(plateau: TPlateau): TEtatJeu; // Vérifie si un des joueurs a réussi à aligner 4 jetons
function coupValide(plateau: TPlateau; colonne: Integer): Boolean; // Vérifie la validité du coup (colonne pleine?)
function trouverLigneLibre(plateau: TPlateau; colonne: Integer): Integer; // Pour trouver la 1ère ligne libre dans une colonne
procedure jouerCoup(var plateau: TPlateau; colonne: Integer; joueur: TJoueur); // Pour placer le jeton à la position trouvée grâce à trouverLigneLibre()

implementation

function trouverLigneLibre(plateau: TPlateau; colonne: Integer): Integer;
var ligne: Integer;
begin
    for ligne := 5 downto 0 do
        if plateau[ligne, colonne] = Vide then
            Exit(ligne);
    trouverLigneLibre := -1;  // Colonne pleine
end;

function coupValide(plateau: TPlateau; colonne: Integer): Boolean;
begin
    coupValide := (colonne >= 0) and (colonne <= 6) and 
                  (plateau[0, colonne] = Vide);
end;

procedure jouerCoup(var plateau: TPlateau; colonne: Integer; joueur: TJoueur);
var ligne: Integer;
begin
    ligne := trouverLigneLibre(plateau, colonne);
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

    // Vérifie si 4 jetons sont alignés dans une direction donnée (verticale, horizontale ou diagonale)
    function verifierDirection(ligne, col, dLigne, dCol: Integer): Boolean;
    // Convention des paramètres
    // dLigne = 1, dCol = 0 : vers le bas
    // dLigne = 0, dCol = 1 : vers la droite
    // dLigne = 1, dCol = 1 : en bas à droite
    // dLigne = 1, dCol = -1 : en bas à gauche
    var 
        count: Integer;
        couleur: TCase;
    begin
        couleur := plateau[ligne, col];
        if couleur = Vide then Exit(False);
        
        count := 1;
        // Vérifie la présence de jetons de la même couleur dans une direction
        while (count < 4) and 
              (ligne + dLigne * count >= 0) and (ligne + dLigne * count <= 5) and
              (col + dCol * count >= 0) and (col + dCol * count <= 6) and
              (plateau[ligne + dLigne * count, col + dCol * count] = couleur) do
            
            count := count + 1;
            
        verifierDirection := (count >= 4);
    end;

begin
    plateauPlein := True;

    for i := 0 to 5 do
        for j := 0 to 6 do
        begin
            if plateau[i,j] = Vide then
                plateauPlein := False;

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