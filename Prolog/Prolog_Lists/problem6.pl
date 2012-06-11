%% 1.06 (*) Find out whether a list is a palindrome.

% palindrome(+List)
palindrome(List) :- palindrome(List, List, []).

palindrome(Xs, [], Xs) :- !. % green cut
palindrome([_|Xs], [_], Xs) :- !. % green cut
palindrome([X|Xs], [_,_|Ys], Acc) :- palindrome(Xs, Ys, [X|Acc]).
