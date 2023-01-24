# List en Haskell

## Utilisation

- ghci
- :load TestCarteBanque
- TestAll (pour faire tout les test sur les fonctions)

## Fonction disponible

- Concaténation de deux listes ->> myConcat::([a],[a])->[a]

- Inverser une liste ->> myReverse::[a]->[a]

- Palindrome ->> myPalindrome::(Eq a) => [a] -> Bool

- Dupliquer les éléments d'une liste ->> duplicate::[a] -> [a]

- Supprimer les doublons ->> myRepeat :: (Int, a) -> [a]

- Repéter les éléments d'une liste ->> myReplicate :: (Int, [a]) -> [a]

- Supprimer les elements consécutifs identiques ->> compress :: Eq a => [a] -> [a]

- Mets les éléments consécutifs identiques dans des sous-listes ->> pack :: Eq a => [a] -> [[a]]

- Crée une liste contenant tous les entiers entre deux bornes ->> range :: (Integer, Integer) -> [Integer]

- Retourne les premiers néléments d’une liste ->> myTake :: (Integer, [a]) -> [a]

- Retourne les nderniers éléments d’une liste ->> suffix :: (Integer, [a]) -> [a]

- Extrait une partie de la liste ->> slice :: (Integer, Integer, [a]) -> [a]
