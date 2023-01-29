
-- type de données en Haskell
data Cercle = CercleCons ((Double,Double),Double)
-- c = CercleCons ((1,2),3) -> Construit un Cercle et le stocke dans c
-- c -> Donne une erreur car c n'est pas défini

data Cercle2 = CercleCons2 ((Double,Double),Double) deriving Show
-- c = CercleCons2 ((1,2),3) -> Construit un Cercle et le stocke dans c
-- c  -> CercleCons2 ((1.0,2.0),3.0)

-- Solutions d'equation du second degré
data Solution = AucuneRacine
                | UneRacine Double
                | DeuxRacines (Double,Double)
                deriving Show

f::(Double,Double,Double)->Solution
f (a,b,c)
    | delta < 0 = AucuneRacine
    | delta == 0 = UneRacine (-b/(2*a))
    | otherwise = DeuxRacines ((((-b)+(sqrt(delta)))/(2*a)),(((-b)-(sqrt(delta)))/(2*a)))
    where delta = (b*b)-(4*a*c)

-- Autre exemple
data FailDouble = FailDouble
                | OK Double
                deriving Show

safeDiv :: Double -> Double -> FailDouble
safeDiv _ 0 = FailDouble
safeDiv x y = OK (x/y)


-- On doit definir des Selecteur pour les types de données
-- Selecteur pour Cercle
centre :: Cercle2 -> (Double,Double)
centre (CercleCons2 ((x,y),r)) = (x,y)

rayon :: Cercle2 -> Double
rayon (CercleCons2 ((x,y),r)) = r

centre2 :: Cercle2 -> (Double,Double)
centre2 (CercleCons2 c) = fst c

rayon2 :: Cercle2 -> Double
rayon2 (CercleCons2 c) = snd c

--Autre exemple
data Personne = PersonneCons String Integer deriving Show

unePersonne :: Personne
unePersonne = PersonneCons "Jean" 20

getNom :: Personne -> String
getNom (PersonneCons n _) = n

getAge :: Personne -> Integer
getAge (PersonneCons _ a) = a


--Observateur
nbSolution :: Solution -> Integer
nbSolution AucuneRacine = 0
nbSolution (UneRacine _) = 1
nbSolution (DeuxRacines _) = 2


-- Equals
data Cercle3 = CercleCons3 ((Double,Double),Double) deriving (Show,Eq) -- ce qu'on doit finalement faire

instance Eq Cercle2 where
    (CercleCons2 ((x1,y1),r1)) == (CercleCons2 ((x2,y2),r2)) = (x1==x2) && (y1==y2) && (r1==r2)


-- Definition de type
-- Type Somme
data Couleur = Rouge | Vert | Bleu deriving (Show,Eq)
-- Type produit
data Point = PointCons Double Double deriving (Show,Eq)
-- Type produit avec type somme
data Figure = Cercle Couleur Point Double
            | Rectangle Couleur Point Point
            | Carre Couleur Point Double
            deriving (Show,Eq)
-- Type énuméré
data Jour = Lundi | Mardi | Mercredi | Jeudi | Vendredi | Samedi | Dimanche deriving (Show,Eq,Ord,Enum)
-- Type récursif

-- Type récursif liste d'entier
data ListeEntier = VideEntier
                | ConsEntier Integer ListeEntier
                deriving (Show,Eq)

x = ConsEntier 1 (ConsEntier 2 (ConsEntier 3 VideEntier))

-- Typr polymorphe
data Liste a = Vide 
            | Cons a (Liste a)
            deriving (Show,Eq)

x1 = Cons 1 (Cons 2 (Cons 3 Vide))
x2 = Cons "a" (Cons "b" (Cons "c" Vide))

-- La fct len
len :: Liste a -> Integer
len Vide = 0
len (Cons _ l) = 1 + len l

-- La fct concat
concat :: Liste a -> Liste a -> Liste a
concat Vide l = l
concat (Cons x Vide) l = (Cons x l)
concat (Cons x l1) l2 = (Cons x (concat l1 l2))


--Maybe
data Maybe a = Nothing
            | Just a
            deriving (Show,Eq)

-- La fct safeHead
safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

-- La fct safeTail
safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (_:xs) = Just xs

--Utiliser Maybe
--x = Just 1
--y = Just 2
--x == y -- False
--x < y -- True

--z = Nothing
--x == z -- False
--x < z -- False
--x > z -- True


-- La fct fromMaybe (retourne la valeur contenue dans un Maybe)
fromMaybe :: a -> Maybe a -> a
fromMaybe x Nothing = x
fromMaybe _ (Just x) = x

--Exemple
--fromMaybe 0 (Just 1) -- 1
--fromMaybe 0 Nothing -- 0

-- Liste non vide
data NonEmptyList a = NEL a [a] deriving (Show,Eq)

nelHead :: NonEmptyList a -> a
nelHead (NEL x _) = x

nelTail :: NonEmptyList a -> [a]
nelTail (NEL _ xs) = xs

nelToList :: NonEmptyList a -> [a]
nelToList (NEL x xs) = x:xs

listToNEL :: [a] -> Maybe (NonEmptyList a)
listToNEL [] = Nothing
listToNEL (x:xs) = Just (NEL x xs)



-- Les modules
-- On peut créer des modules
-- On peut importer des modules
-- On peut créer des modules avec des types de données

-- Exemple de module
module ExporteTout where

module ExporteRien () where

module MonModule where
import AutreModule


--Arbre binaire
data Arbre a = Vide
            | Noeud a (Arbre a) (Arbre a)
            deriving (Show,Eq)


-- Exemple d'arbre (1 (2 (3 () ()) (4 () ())) (5 () ()))
monArbre :: Arbre 
monArbre = Noeud 1
                (Noeud 2
                    (Noeud 3 Vide Vide)
                    (Noeud 4 Vide Vide))
                (Noeud 5 Vide Vide)

hauteur :: Arbre a -> Integer
hauteur Vide = 0
hauteur (Noeud _ g d) = 1 + max (hauteur g) (hauteur d)

nbFeuille :: Arbre a -> Integer
nbFeuille Vide = 0
nbFeuille (Noeud _ Vide Vide) = 1
nbFeuille (Noeud _ g d) = nbFeuille g + nbFeuille d

parcoursInfixe :: Arbre a -> [a]
parcoursInfixe Vide = []
parcoursInfixe (Noeud x g d) = (parcoursInfixe g) ++ [x] ++ (parcoursInfixe d)

