{-
Exercice 1. Pour chacune des expressions ci-dessous, essayez d’inférer son type sans vérifier sur
l'interpréteur. Ensuite, vérifier votre réponse. Si votre réponse n’est pas correcte, essayez d’en
comprendre la raison :
1. \x -> x + 1
2. \(x,y) -> g (x,y) where g (x, y) | x == 0 = y | otherwise = 0.5
3. \x -> \y -> g (x,y) where g (x,y) | x == 0 = y | otherwise = 0.5
4. \x -> \y -> x y
5. \x -> \y -> \z -> x (y,z)
6. \x -> \(y,z) -> x y z
-}
-- 1. Num a => a -> a
-- 2. (a, b) -> Double
-- 3. a -> b -> Double
-- 4. (a -> b) -> a -> b
-- 5. (a -> b -> c) -> a -> b -> c
-- 6. (a -> b -> c) -> a -> b -> c


{-
Exercice 2. Pour chacun des types suivants, écrivez une expression en Haskell ayant le type (vous
n’avez pas droit de copier les expressions de l’exercice antérieur) :
1. (a, b) -> a
2. (a, b) -> b
3. Num c => (a, b) -> c
4. Num a => (a, a) -> a
5. a -> b -> a
6. Num a => a -> a -> a
7. Num a => (a -> b) -> b
8. (Num a, Num b) -> (a -> b) -> b
-}

myFst :: (a, b) -> a
myFst (x, y) = x

mySnd :: (a, b) -> b
mySnd (x, y) = y

mySum1 :: Num c => (a, b) -> c -- pas sur
mySum1 (x, y) = x + y

mySum :: Num a => (a, a) -> a
mySum = \(x,y) -> x + y

myFst2 :: a -> b -> a
myFst2 x y = x

mySum2 :: Num a => a -> a -> a
mySum2 x y = x + y

myFst3 :: Num a => (a -> b) -> b
myFst3 f = f 0

myFst4 :: (Num a, Num b) => (a -> b) -> b
myFst4 f x = f x

{-
Pour tous les exercices qui suivent. N’oubliez pas d’indiquer le type de chaque fonction.
Exercice 3.
1. Écrire en Haskell une fonctionnelle sommeTermes qui calcule la somme des n + 1 premiers
termes d’une suite (un ) de nombres réels qui est donnée comme argument.
2. Écrire en Haskell une expression (une fonction sans argument) qui calcule la somme des 100
premiers entiers naturels non nuls.
3. Écrire en Haskell une expression qui calcule la somme 1 − 2 + 3 − 4 + 5 − 6 + ... + 99. (Vérifier
avec l’interpréteur que cette somme est égal à 50).
4. Définir la fonction inv100 qui à tout nombre réel x associe la somme : (1 − x)0 + (1 − x)1 +
(1 − x)2 + · · · + (1 − x)100 .
Exercice 4.
1. Écrire une fonction sommeFiltre qui, étant donné un entier n et une fonction f, qui à tout
entier associe un booléen, renvoie la somme de tous les entiers naturels p tel que p ≤ n et
f(p) est vrai.
2. Un nombre parfait est un entier naturel non nul égal à la moitié de la somme de ses diviseurs.
Par exemple, 6 est un nombre parfait car ses diviseurs sont 1, 2, 3 et 6, et 2 × 6 = 1 + 2 + 3 + 6.
Utiliser la fonction sommeFiltre écrite précédemment pour écrire la fonction parfait qui
retourne si un nombre est parfait.
3. Écrire la fonction parfaits qui, étant donné un entier naturel n, retourne la liste de nombres
parfaits de 0 jusqu’à n.
Exercice 5.
1. Écrire une fonction appelée applyn qui, étant donné un entier naturel n, une fonction f et
une valeur x (les arguments sont à donner dans cet ordre), calcule le résultat de f appliquée
n fois sur x, c’est à dire : f n (x) = f (...(f (x))...).
2. Utiliser la fonction applyn pour définir une fonction power qui calcule xn , la n-ième puissance
de x, où x est un entier, sans utiliser l’opérateur ^. (Retourner 0 si n est inférieur à zéro).
-}