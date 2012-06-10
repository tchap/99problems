{- (*) Find the K'th element of a list. 
       The first element in the list is number 1. -}

elementAt :: [a] -> Int -> Maybe a
elementAt (x:_) 1 = Just x
elementAt [] _ = Nothing
elementAt (_:xs) i
  | i < 1 = Nothing
  | otherwise = elementAt xs (i - 1)

elementAt' :: [a] -> Int -> a
elementAt' xs i = head . (drop $ i - 1) $ xs
