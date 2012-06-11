% vim: set filetype=prolog:

last_elem([X], X) :- !.
last_elem([_|Xs], Last) :- last_elem(Xs, Last).
