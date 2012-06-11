%% 1.03 (*) Find the K'th element of a list.

replicate(N, X, List) :- replicate(N, X, [], List).

replicate(0, _, Acc, Acc) :- !. % green cut
replicate(N, X, Acc, List) :- 
	N >= 1,
	C is N - 1,
	replicate(C, X, [X|Acc], List).

kth(K, List, E) :- 
	replicate(K, 1, C),
	kth_acc(List, C, E).

kth_acc([X|_], [_], X).
kth_acc([_|List], [_|C], K) :- kth_acc(List, C, K).
