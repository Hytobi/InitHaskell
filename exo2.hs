{-Exercice : Écrivez la fonction sommeChiffres qui calcule la somme des chiffres décimaux d’un
entier naturel n. (Par exemple, pour n = 124 le résultat doit être 1 + 2 + 4 = 7.) -}

sommeChiffres :: Integer -> Integer
sommeChiffres n
  | n < 0 = 0
  | n < 10 = n
  | otherwise = ( n ‘mod ‘ 10) + sommeChiffres ( n ‘div ‘ 10)
