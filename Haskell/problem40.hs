{- (**) Goldbach's conjecture. -}

goldbach :: Int -> Maybe (Int, Int)
goldbach n
    | n < 1 || odd n = Nothing
    | otherwise = Just $ head $ [(x, x') | x <- [2,3..b], let x' = n - x, 
					                  isPrime x,isPrime x']
    where b = ceiling $ fromIntegral $ n `div` 2

isPrime :: Int -> Bool
isPrime n
    | d == [] = True
    | otherwise = False
    where n' = ceiling $ sqrt $ fromIntegral n
	  d = dropWhile (\x -> n `mod` x /= 0 ) [2,3..n']
