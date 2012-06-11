{- (*) Reverse a list. -}

reversed :: [a] -> [a]
reversed = reversed_ []

reversed_ :: [a] -> [a] -> [a]
reversed_ acc [] = acc
reversed_ acc (x:xs) = reversed_ (x:acc) xs

reversed' :: [a] -> [a]
reversed' = foldl (\acc x -> x:acc) []

reversed'' :: [a] -> [a]
reversed'' = foldl (flip (:)) []
