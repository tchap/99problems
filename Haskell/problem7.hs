{- (**) Flatten a nested list structure. -}

data NestedList a = List [NestedList a] | Elem a deriving (Show)

flatten :: NestedList a -> [a]
flatten (Elem e) = [e]
flatten (List l) = concatMap flatten l
