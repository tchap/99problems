{-(**) Determine the prime factors of a given positive integer. 
       Construct a flat list containing the prime factors in ascending order.-}

primeFactors n = reverse $ primeFactors' n []

primeFactors' 1 ps = ps
primeFactors' n ps = primeFactors' q (k:ps)
    where k = head $ dropWhile (\x -> n `mod` x /= 0) [2,3..]
          q = n `div` k
