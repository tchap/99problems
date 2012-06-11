%% 1.04 (*) Find the number of elements of a list.

% len(+Xs, ?Len)
len(Xs, Len) :- len(Xs, 0, Len).

len([], Acc, Acc).
len([_|Xs], Acc, Len) :- NextAcc is Acc + 1, len(Xs, NextAcc, Len).
