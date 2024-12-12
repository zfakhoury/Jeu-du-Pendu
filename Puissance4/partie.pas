unit partie;

interface

uses crt, sysUtils, typesPuissance4, logiquePuissance4, affichagePuissance4, animation;

procedure initialiserPlateau(var plateau: TPlateau); // Tableau 6 x 7 à cases vides
procedure jouerPartie(); // Vue principale du jeu

implementation

procedure initialiserPlateau(var plateau: TPlateau);
var
    i, j: Integer;
begin
    for i := 0 to 5 do
        for j := 0 to 6 do
            plateau[i,j] := Vide;
end;

procedure jouerPartie();
var
    plateau: TPlateau;
    joueurActuel: TJoueur;
    cursorPosition: Integer;
    etatJeu: TEtatJeu;
    key: Char;
begin
    ClrScr;
    initialiserPlateau(plateau);
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
        writeln('ENTRER ou ESPACE pour jouer, ESC pour quitter');
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

    ClrScr;
    afficherPlateau(plateau);
    writeln;
    
    case etatJeu of
        VictoireRouge: 
        begin
            TextColor(Red);
            animate('Le joueur Rouge a gagné! 🎉', 50, True);
        end;
        VictoireJaune: 
        begin
            TextColor(Yellow);
            animate('Le joueur Jaune a gagné! 🎉', 50, True);
        end;
        Egalite: animate('Match nul! 🤝', 50, True);
    end;
    TextColor(LightGray);
    
    delay(2000);
    CursorOn;
end;

end.