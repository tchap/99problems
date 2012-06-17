{- (**) Determine whether a given integer number is prime. -}

isPrime :: Int -> Bool
isPrime n
    | d == [] = True
    | otherwise = False
    where n' = ceiling $ sqrt $ fromIntegral n
          d = dropWhile (\x -> n `mod` x /= 0 ) [2,3..n']
