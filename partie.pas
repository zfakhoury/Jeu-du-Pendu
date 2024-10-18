unit Partie;

interface

uses typeDonnees, affichageJeu, dictionnaire, crt, animation, ScoreManager, SDL2, SDL2_ttf;

procedure partieJeu(mode: TDifficulte);
function initMot(mode: TDifficulte): TMot;
procedure modeDifficulte(var mode: TDifficulte);
//function entreeValide(key: Char; mot: TMot): Boolean;
//procedure updateTMot(key: Char; var mot: TMot);
//procedure updateTentatives(valide: Boolean; key: Char; pressedKeys: TPressed; var tentatives: Integer);
//function partieGagnee(mot: TMot): Boolean;

implementation

function initMot(mode: TDifficulte): TMot;
    var i: Integer;

    begin
        Randomize;

        if mode = facile then
            initMot.chaine := motsFaciles[Random(10) + 1]
        else if mode = moyen then
            initMot.chaine := motsMoyens[Random(10) + 1]
        else
            initMot.chaine := motsDifficiles[Random(10) + 1];

        initMot.longueurMot := length(initMot.chaine);

        setLength(initMot.cache, initMot.longueurMot);

        for i := 1 to initMot.longueurMot do
            initMot.cache[i] := True;
    end;


procedure modeDifficulte(var mode: TDifficulte);
    var input: Integer;

    begin
        repeat
            ClrScr;
            animate('🤔 DIFFICULTÉ', 50, True);
            writeln('');
            writeln('1. Facile  2. Moyen  3. Difficile');
            writeln('');
            write('Niveau: ');
            read(input);

            case input of
                1: mode := facile;
                2: mode := moyen;
            else
                mode := difficile;
            end;

        until (input >= 1) and (input <= 3);
    end;


procedure partieJeu(mode: TDifficulte; renderer: PSDL_Renderer; font: PTTF_Font);
    var mot: TMot;
    var key: Char;
    var valide: Boolean;
    var tentatives, i: Integer;
    var pressedKeys: TPressed;
    var scoreManager: TScoreManager;
    
    begin
        tentatives := 0;
        valide := False;
        key := #0;
        mot := initMot(mode);
        InitScoreManager(scoreManager, 7, mot.chaine);

        for i := 1 to 26 do
            pressedKeys[i] := False;
            
       // while True do
        while not partieGagnee(mot) and (tentatives < 7) do
        begin
             //Mettre à jour le jeu ici
            //Affichage le jeu et calcule du score
             CalculateScore(scoreManager, valide);
        end;
            
        if partieGagnee(mot) then
            animate('Partie gagnée 🏆', 50, True)
        else
            animate('Partie perdue 💀', 50, True);

        RenderFinalScore(renderer, font, scoreManager);
        delay(3000);
    end;
end.
