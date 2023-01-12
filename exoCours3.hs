--Filtrage par motif

somme :: Integer -> Integer
somme 0 = 0
somme n = n + somme ( n - 1)

--Nous pouvons le mélanger avec des gardes :
somme :: Integer -> Integer
somme 0 = 0
somme n
    | n < 0 = n + somme ( n + 1)
    | otherwise = n + somme ( n - 1)

--Filtrage par motif avec de listes
sommeList :: [ Integer ] -> Integer
sommeList [] = 0
sommeList ( x : xs ) = x + sommeList xs

longueur :: [ Integer ] -> Integer
longueur [] = 0
longueur ( _ : xs ) = 1 + longueur xs

sommeUnSurDeux :: [ Integer ] -> Integer
sommeUnSurDeux [] = 0
sommeUnSurDeux [_] = 0
sommeUnSurDeux ( x : y : zs ) = y + sommeUnSurDeux zs


--Fonction identité
id :: a -> a
id x = x

--Fonction swap
swap :: ( a , b ) -> ( b , a )
swap ( x , y ) = ( y , x )

suite :: Integer -> Integer
suite n
    | n <= 0 = 1
    | otherwise = suite ( n - 1) + 2

suite2 :: Integer -> Integer
suite2 n
    | n <= 0 = 1
    | otherwise = suite2 ( n - 1) + 5

raison :: ( Integer -> Integer ) -> Integer
raison f = (f 1) - (f 0)

sign :: Integer -> ( Double -> Double )
sign n = f where
    f x = ( -1) ^ n * x

sign :: Integer -> ( Double -> Double )
sign n = \ x -> ( -1) ^ n * x

--Pointeur de fonction
add = \x -> \y -> x + y 
--La fonction add est une fonction qui prend deux paramètres et qui renvoie la somme de ces deux paramètres
-- \ est l'opérateur de lambda, add attend deux paramètres x et y
suiv = add 1
--suiv prend la fonction add et lui met son premier paramètre à 1, elle attend donc un seul paramètre : y dans add
suiv 5 -- renvoie 6

--Curryfication

add1 :: ( Integer , Integer ) -> Integer
add1 (a , b ) = a + b

add2 :: Integer -> Integer -> Integer
add2 a b = a + b

-- Curryfier et uncurryfier
myCurry :: (( a , b ) -> c ) -> ( a -> b -> c )
myCurry f = \ x -> \ y -> f (x , y )

test= myCurry add1 5 -- test 4 renvoie 9

myUncurry :: ( a -> b -> c ) -> (( a , b ) -> c )
myUncurry f = \( x , y ) -> f x y

test = myUncurry add2 (1, 5) -- renvoie 6

compose :: ( b -> c ) -> ( a -> b ) -> ( a -> c )
compose f g = \ x -> f ( g x ) -- add3 = compose add1 add2 //// add3 4   pour l'utiliser
-- en Haskell compose est définie comme (.) et on peut l'utiliser comme ça : add3 = add1 . add2