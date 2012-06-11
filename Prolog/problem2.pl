%% 1.02 (*) Find the last but one element of a list.

% last_but_one(+Xs, ?LBO)
last_but_one([X,_], X) :- !.% green cut
last_but_one([_|Xs], LBO) :- last_but_one(Xs, LBO).
