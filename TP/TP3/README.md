# Matrice en Haskell

## Utilisation

- ghci
- :load TestMatrix
- TestAll (pour faire tout les test sur les fonctions)

## Information matrice

Une matrice est definie comme suit :
type Matrix = (Integer, Integer) -> (Bool, Integer)

Une matrice matA de taille 3x3 renvera les valeur suivante :
matA (3,3) renvoi (True,**_valeur de la matrice en position (3,3)_**)
matA (2,7) renvoi (False, 0)

## Fonction disponible

- Revoie une fonction definisant la matrice identite ->> identity :: Integer -> Matrix

- Renvoie la dimmention d'une matrice ->> dims :: Matrix -> (Integer, Integer)

- Convertir une matrice en liste de liste ->> toList :: Matrix -> [[Integer]]

- Revoie une fonction modelisant la somme de 2 matrices ->> add :: Matrix -> Matrix -> Matrix
