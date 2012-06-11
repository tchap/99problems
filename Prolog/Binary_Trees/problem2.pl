%% 4.02 (**) Construct completely balanced binary trees

% cbal_tree(+N, -Tree)
cbal_tree(0, nil) :- !. % green cut
cbal_tree(N, Tree) :-
	N >= 1,
	Q is (N - 1) div 2,
	R is (N - 1) mod 2,
	cbal_tree(Q, R, Tree).

cbal_tree(Q, 0, t(L, 'x', R)) :-
	cbal_tree(Q, L),
	cbal_tree(Q, R).

cbal_tree(Q, 1, t(L, 'x', R)) :-
	NL is Q,
	NR is Q + 1,
	cbal_tree(NL, L),
	cbal_tree(NR, R).

cbal_tree(Q, 1, t(L, 'x', R)) :-
	NL is Q + 1,
	NR is Q,
	cbal_tree(NL, L),
	cbal_tree(NR, R).
