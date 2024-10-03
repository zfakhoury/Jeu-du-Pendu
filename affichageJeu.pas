unit affichageJeu;

interface

uses crt, typeDonnees;

procedure afficherMot(valide: Boolean; mot: TMot);

implementation

procedure afficherMot(valide: Boolean; mot: TMot);
    var i: Integer;

    begin
        for i := 1 to mot.longueurMot do
            if mot.cache[i] = true then
                write('_ ')
            else
                write(mot.chaine[i], ' ');
    end;

end.