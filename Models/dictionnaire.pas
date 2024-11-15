unit Dictionnaire;

interface

Type Tfacile = Array[1..10] of String;
Type Tmoyen = Array[1..10] of String;
Type Tdifficile = Array[1..10] of String;

const motsFaciles: Tfacile = (
    'chat', 'chien', 'maison', 'voiture', 'pomme',
    'livre', 'porte', 'fleur', 'table', 'chaise'
  );

const motsMoyens: Tmoyen = (
    'ordinateur', 'bibliotheque', 'restaurant', 'television', 'chocolat',
    'jardin', 'ecole', 'hopital', 'musee', 'cinema'
  );

const motsDifficiles: Tdifficile = (
    'philosophie', 'psychologie', 'architecture', 'astronomie', 'biotechnologie',
    'meteorologie', 'archeologie', 'anthropologie', 'neurologie', 'genealogie'
  );

implementation

end.
