
somme :: Integer -> Integer
somme x
    |x <= 0 = 0
    |x > 0 = somme ( x - 1) + x

{-Exercice : Écrivez la fonction sommeChiffres qui calcule la somme des chiffres décimaux d’un
entier naturel n. (Par exemple, pour n = 124 le résultat doit être 1 + 2 + 4 = 7.) -}

sommeChiffres :: Integer -> Integer
sommeChiffres n
    | n < 0 = sommeChiffres ( abs n )
    | n < 10 = n
    | otherwise = ( n `mod` 10) + sommeChiffres ( n `div` 10)


pgcd :: Integer -> Integer
pgcd (a , b )
    | a < 0 || b < 0 = 0
    | a >= 0 && b == 0 = a
    | a >= 0 && b > 0 = pgcd (b , a `mod` b )


pair :: Integer -> Bool
pair n
    | n == 0 = True
    | n == 1 = False
    | n > 0 = pair ( n - 2)
    | n < 0 = pair ( n + 2)

fac :: Integer -> Integer
fac n
    | n < 0 = 0
    | n == 0 = 1
    | n > 0 = fac ( n - 1) * n

-- Terminal recursive
fac’ :: Integer -> Integer
fac’ n = facAux (1 , n )

facAux :: ( Integer , Integer ) -> Integer
facAux (a , n )
    | n < 0 = 0
    | n == 0 = a
    | n > 0 = facAux ( a * n , n - 1)

-- Avec sous fonction
fac’’ :: Integer -> Integer
fac’’ n = facAuxW (1 , n )
    where
        facAuxW (a , n )
            | n < 0 = 0
            | n == 0 = a
            | n > 0 = facAux ( a * n , n - 1)

--Récursivité mutuelle (croisée)

pair :: Integer -> Bool
pair n
    | n < 0 = pair ( abs n )
    | n == 0 = True
    | n > 0 = impair ( n - 1)

impair :: Integer -> Bool
impair n
    | n < 0 = impair ( abs n )
    | n == 0 = False
    | n == 1 = True
    | n > 1 = pair ( n - 1)
