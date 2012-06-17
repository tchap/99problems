{-(**) Determine the prime factors of a given positive integer. 
       Construct a flat list containing the prime factors in ascending order.-}

primeFactors :: Int -> [Int]
primeFactors = primeFactors' []

primeFactors' :: [Int] -> Int -> [Int]
primeFactors' ps 1 = reverse ps
primeFactors' ps n = primeFactors' (k:ps) q
    where k = head $ dropWhile (\x -> n `mod` x /= 0) [2,3..]
          q = n `div` k
