%% 4.05 (**) Generate-and-test paradigm

:- consult(problem2).
:- consult(problem3).

sym_cbal_trees(N, Trees) :-
	find_balanced(N, Balanced),
	drop_asymmetric(Balanced, [], Trees),
	!. % red cut :-(

find_balanced(N, Trees) :- find_balanced(N, [], Trees).

find_balanced(N, Found, Trees) :-
	cbal_tree(N, Tree),
	\+ member(Tree, Found),
	find_balanced(N, [Tree|Found], Trees).
find_balanced(_, Trees, Trees).

drop_asymmetric([], Acc, Acc) :- !. % green cut
drop_asymmetric([T|Ts], Acc, Syms) :-
	symmetric(T),
	drop_asymmetric(Ts, [T|Acc], Syms).
drop_assymetric([T|Ts], Acc, Syms) :-
	\+ symmetric(T),
	drop_asymmetric(Ts, Acc, Syms).
