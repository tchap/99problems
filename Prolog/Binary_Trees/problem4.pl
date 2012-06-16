%% 4.04 (**) Binary search trees (dictionaries)

construct(List, Tree) :- construct(List, nil, Tree).

construct([], Tree, Tree).
construct([X|Xs], AccTree, Tree) :-
	add(X, AccTree, NextTree),
	construct(Xs, NextTree, Tree).

% green cuts
add(X, nil, t(X, nil, nil)) :- !.
add(X, t(X, L, R), t(X, L, R)) :- !.
add(X, t(Y, L, R), t(Y, NewL, R)) :-
	X < Y,
	add(X, L, NewL),
	!.
add(X, t(Y, L, R), t(Y, L, NewR)) :-
	Y < X,
	add(X, R, NewR),
	!.
