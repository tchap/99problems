{- (**) Calculate Euler's totient function phi(m) (improved). -}

import qualified Data.List as L

phi :: Int -> Int
phi 1 = 1
phi n = foldl1 (*) $ map mf $ primeFactorsMult n
    where mf (p, ex) = truncate $ 
            (fromIntegral $ p-1) * (fromIntegral p) ** (fromIntegral $ ex-1)

primeFactorsMult :: Int -> [(Int, Int)]
primeFactorsMult = map (\l -> (head l, length l)) . L.group . primeFactors

primeFactors :: Int -> [Int]
primeFactors n = reverse $ primeFactors' n []

primeFactors' :: Int -> [Int] -> [Int]
primeFactors' 1 ps = ps
primeFactors' n ps = primeFactors' q (k:ps)
    where k = head $ dropWhile (\x -> n `mod` x /= 0) [2,3..]
          q = n `div` k
