%% 1.02 (*) Find the last but one element of a list.

last_but_one([_,X], X) :- !.
last_but_one([_|Xs], LBO) :- last_but_one(Xs, LBO).
