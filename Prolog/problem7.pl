%% 1.07 (**) Flatten a nested list structure.

% flatten(+NList, -FList)
% Be sure to really pass a list!
flatten(Elem, [Elem]) :- atomic(Elem), !. % green cut
flatten(List, FList) :-
	\+ atomic(NList),
	map(flatten, NList, List),
	concat(List, FList).

map(Function, List, MList) :-
	map_acc(Function, List, [], MList).

map_acc(_, [], Acc, Acc) :- !. % green cut
map_acc(Func, [X|Xs], Acc, MList) :-
	F =.. [Func, X],
	call(F, M),
	map_acc(Func, Xs, [M|Acc], MList).

concat(LL, L) :- concat(LL, [], L).

concat([], Acc, Acc).
concat([L|Ls], Acc, FList) :- 
	append(L, Acc, LAcc), 
	concat(Ls, LAcc, FList).
