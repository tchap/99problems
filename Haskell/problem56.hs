{- (**) Symmetric binary trees -}

data Tree a = Node a (Tree a) (Tree a) | Empty deriving (Show)

symmetric :: Tree a -> Bool
symmetric Empty = True
symmetric (Node _ l r) = symmetric' l r

symmetric' :: Tree a -> Tree a -> Bool
symmetric' Empty Empty = True
symmetric' (Node _ l1 r1) (Node _ l2 r2) = symmetric' l1 r2 && symmetric' l2 r1
symmetric' _ _ = False
