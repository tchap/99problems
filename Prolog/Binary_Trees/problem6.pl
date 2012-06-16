%% 4.06 (**) Construct height-balanced binary trees

hbal_tree(0, nil) :- !. % green cut
hbal_tree(1, t(x, nil, nil)) :- !. % green cut
hbal_tree(H, t(x, L, R)) :-
	HS is H - 1,
	hbal_tree(HS, L),
	hbal_tree(HS, R).
hbal_tree(H, t(x, L, R)) :-
	HL is H - 1,
	HR is H - 2,
	hbal_tree(HL, L),
	hbal_tree(HR, R).
hbal_tree(H, t(x, L, R)) :-
	HL is H - 2,
	HR is H - 1,
	hbal_tree(HL, L),
	hbal_tree(HR, R).
