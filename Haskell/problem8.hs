{- (**) Eliminate consecutive duplicates of list elements. -}

import qualified Data.List as L

compress :: (Eq a) => [a] -> [a]
compress = map head . L.group
