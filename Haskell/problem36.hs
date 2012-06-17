{- (**) Determine the prime factors of a given positive integer.
        Construct a list containing the prime factors and their multiplicity.-}

import qualified Data.List as L

primeFactors :: Int -> [Int]
primeFactors n = reverse $ primeFactors' n []

primeFactors' :: Int -> [Int] -> [Int]
primeFactors' 1 ps = ps
primeFactors' n ps = primeFactors' q (k:ps)
    where k = head $ dropWhile (\x -> n `mod` x /= 0) [2,3..]
          q = n `div` k

primeFactorsMult :: Int -> [(Int, Int)]
primeFactorsMult = map (\l -> (head l, length l)) . L.group . primeFactors
