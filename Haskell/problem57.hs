{- (**) Binary search trees (dictionaries) -}

data Tree a = Node a (Tree a) (Tree a) | Empty deriving (Show)

add :: (Ord a, Eq a) => Tree a -> a -> Tree a
add Empty x = Node x Empty Empty
add orig@(Node v l r) x
    | x == v = orig
    | x < v =
        let t = add l x
	in Node v t r
    | x > v =
        let t = add r x
	in Node v l t

construct :: (Ord a, Eq a) => [a] -> Tree a
construct = foldl add Empty 
