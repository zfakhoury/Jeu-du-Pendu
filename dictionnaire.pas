unit Dictionnaire;

interface

type Tfacile = Array[1..10] of String;
type Tmoyen = Array[1..10] of String;
type Tdifficile = Array[1..10] of String;

const motsFaciles: Tfacile = (
    'chat', 'chien', 'maison', 'voiture', 'pomme',
    'livre', 'porte', 'fleur', 'table', 'chaise'
  );

const motsMoyens: Tmoyen = (
    'ordinateur', 'bibliothèque', 'restaurant', 'télévision', 'chocolat',
    'jardin', 'école', 'hôpital', 'musée', 'cinéma'
  );

const motsDifficiles: Tdifficile = (
    'philosophie', 'psychologie', 'architecture', 'astronomie', 'biotechnologie',
    'météorologie', 'archéologie', 'anthropologie', 'neurologie', 'généalogie'
  );

implementation

end.
