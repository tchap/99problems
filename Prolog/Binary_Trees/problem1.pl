%% 4.01 (*) Check whether a given term represents a binary tree

% tree(+Tree)
tree(nil).
tree(t(L, _, R)) :- tree(L), tree(R).
