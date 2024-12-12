unit TypesTicTacToe;

interface

Type TPlayer = (JoueurX, JoueurO);
Type TCell = (Empty, PlayerX, PlayerO);
Type TBoard = Array[0..2, 0..2] of TCell; // Tableau 3 x 3
Type TGameState = (InProgress, XWins, OWins, Draw);

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