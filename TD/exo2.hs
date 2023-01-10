{-
Exercice 1. Le mélange américain des cartes consiste à imbriquer deux paquets de cartes par
insertion des cartes de l’un dans l’autre pour former le paquet final. L’imbrication obéit à une seule
règle : l’ordre de cartes de chaque paquet doit subsister dans le paquet final.

    1. Considérez deux paquets de cartes toutes différentes. Écrivez une fonction qui, étant donné le
nombre de cartes de chaque paquet, calcule le nombre de paquets finaux différents qu’il est
possible d’obtenir avec le mélange américain.
    2. Même question mais avec trois paquets.
-}
min2 (a, b)
    | a <= b = a 
    | otherwise = b
max2 (a, b)
    | a >= b = a 
    | otherwise = b

melangeAmericain::(Integer,Integer) -> Integer
melangeAmericain (a, b)
    | a <= 0 || b <= 0 = 0
    | min2(a,b) == 1 = max2(a, b)
    | otherwise = melangeAmericain(a-1, b) + melangeAmericain(a, b-1)

melange3::(Integer,Integer,Integer) -> Integer
melange3 (a, b, c)
    | a <= 0 && b <= 0 && c <= 0 = 0
    | a == 0 = melangeAmericain(b, c)
    | b == 0 = melangeAmericain(a, c)
    | c == 0 = melangeAmericain(a, b)
    | otherwise = melangeAmericain(a, b+ c) * melangeAmericain(b, c) 

{-Exo 2 -}
calculRusses::(Integer,Integer) -> Integer
calculRusses(x,y)
    | x == 0 || y == 0 = 0
    | x == 1 = y
    | x `mod` 2 == 0 = calculRusses(x `div` 2, y*2)
    | otherwise = y + calculRusses(x-1, y)

{-Exo 3 
En fait c'est fleche puissance nb, nb=0 : a.b , nb=1 : a^b, nb=2 : a^(a^a....) -> on a nb fois l'exposant a
-}

fleche::(Integer,Integer,Integer) -> Integer
fleche(a,b,nb)
    | a == 0 = 0
    | b == 0 && nb>0 = 1
    | nb == 0 && b>0 = a*b
    | b==0 && nb==0 = 0
    | nb == 1 = a^b
    | nb <0 = error "nb doit etre positif"
    | b <0 = error "b doit etre positif"
    | otherwise = fleche(a,fleche(a,b-1,nb),nb-1)

{-Exo 4 -}
fibo::Integer -> Integer
fibo(n)
    | n == 0 = 0
    | n == 1 = 1
    | n < 0 = error "n doit etre positif"
    | otherwise = fibo(n-1) + fibo(n-2)

{- question 2

cas de base : 
x<0 erreur
x=0  return 0 terminer
x=1  return 1 terminer

cas n : 
Fonction recursive et s'appelle en soustractant x par 1 et 2 elle se ramene a un cas de base

conclusion : fibo termie pour tout x>=0
-}

tribo::Integer -> Integer
tribo(n)
    | n<=0 = 0  
    | n==1 = 1
    | otherwise = tribo(n-1) + tribo(n-2) + tribo(n-3)

nibo::(Integer,Integer) -> Integer
nibo(k,n)
    | k<=0 = 0
    | k==1 = 1
    | otherwise = nibo(k-1,n) + somme(k,n,n)
    where
        somme::(Integer,Integer,Integer) -> Integer
        somme(k,n,l)
            | l<=0 = 0
            | otherwise = nibo(k-1,n) + somme(k-1,n,l-1)

tetra(i) = nibo(4,i)
penta(i) = nibo(5,i)
hexa(i) = nibo(6,i)
{-Exo 5 -}
