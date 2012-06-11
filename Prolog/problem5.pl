%% 1.05 (*) Reverse a list.

% reversed(+Xs, ?RXs)
reversed(Xs, RXs) :- reversed(Xs, [], RXs).

reversed([], Acc, Acc).
reversed([X|Xs], Acc, RXs) :- reversed(Xs, [X|Acc], RXs).
