unit TypesPuissance4;

interface

// Types pour le jeu Puissance 4
Type TTheme = (light, dark, high_contrast);
Type TJoueur = (JoueurRouge, JoueurJaune);
Type TCase = (Vide, Rouge, Jaune);
Type TPlateau = Array[0..5, 0..6] of TCase;  // 6 lignes x 7 colonnes
Type TEtatJeu = (EnCours, VictoireRouge, VictoireJaune, Egalite);

const UP = #72;
const DOWN = #80;
const LEFT = #75;
const RIGHT = #77;
const ENTER = #13;
const SPACE = #32;
const DEL = #8;
const ESC = #27;

implementation

end. 