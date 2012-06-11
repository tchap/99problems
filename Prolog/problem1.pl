%% 1.01 (*) Find the last element of a list.

% last_elem(+Xs, ?Last)
last_elem([X], X) :- !. % green cut
last_elem([_|Xs], Last) :- last_elem(Xs, Last).
