{-# OPTIONS_GHC -Wall #-}

module List where

--Exercice 1 : Concaténation de deux listes
myConcat::([a],[a])->[a]
myConcat ([],[]) = []
myConcat ([],ys) = ys
myConcat (xs,[]) = xs
myConcat (x:xs,ys) = x : myConcat (xs,ys)

myConcat2::([a],[a])->[a]
myConcat2 ([],[]) = []
myConcat2 ([],y) = y
myConcat2 (x,[]) = x
myConcat2 (x,y) = x ++ y

--Exercice 2 : Inverser une liste
myReverse::[a]->[a]
myReverse [] = []
myReverse (x:xs) = myConcat (myReverse xs , [x])

myReverse2::[a]->[a]
myReverse2 [] = []
myReverse2(x:xs) = myReverse xs ++ [x]

--Exercice 3 : Palindrome
myPalindrome::(Eq a) => [a] -> Bool
myPalindrome (xs) = xs == myReverse xs

--Exercice 4 : Dupliquer les éléments d'une liste
duplicate::[a] -> [a]
duplicate [] = []
duplicate (x:xs) = x : x : duplicate xs

--Exercice 5 : Supprimer les doublons
myRepeat :: (Int, a) -> [a]
myRepeat (n,x)
    | n <= 0 = []
    | otherwise = x : myRepeat (n-1,x)

--Exercice 6 : Repéter les éléments d'une liste        
myReplicate :: (Int, [a]) -> [a]
myReplicate (_,[]) = []
myReplicate (n,x:xs)
    | n <= 0 = []
    | otherwise = myConcat (myRepeat (n,x), myReplicate (n,xs))

--Exercice 7 : Supprimer les elements consécutifs identiques
compress :: Eq a => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x:y:xs)
    | x == y = compress (y:xs)
    | otherwise = x : compress (y:xs)

--Exercice 8 : mets les éléments consécutifs identiques dans des sous-listes.
pack :: Eq a => [a] -> [[a]]
pack [] = []
pack [x] = [[x]]
pack (x:y:xs)
    | x == y = myConcat (myConcat ([[x]], pack (y:xs)), [])
    | otherwise = myConcat ([[x]], pack (y:xs))


--Exercice 9 : crée une liste contenant tous les entiers entre deux bornes.
range :: (Integer, Integer) -> [Integer]
range (a,b)
    | a > b = []
    | a == b = [a]
    | otherwise = a : range (a+1,b)

--Exercice 10 : qui retourne les premiers néléments d’une liste.
myTake :: (Integer, [a]) -> [a]
myTake (_,[]) = []
myTake (n,x:xs)
    | n <= 0 = []
    | otherwise = x : myTake (n-1,xs)


--Exercice 11 : qui retourne les nderniers éléments d’une liste.
suffix :: (Integer, [a]) -> [a]
suffix (n,xs) = myReverse (myTake (n, myReverse xs))


--Exercice 12 : qui extrait une partie de la liste.
slice :: (Integer, Integer, [a]) -> [a]
slice (_,_,[]) = []
slice (0,b,x:xs)
    | b < 0 = []
    | b == 0 = [x]
    | otherwise = x : slice (0,b-1,xs)
slice (a,b,_ : xs)
    | b < 0 = []
    | otherwise = slice (a-1,b-1,xs)



