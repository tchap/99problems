%% 4.16 (**) A string representation of binary trees

% tree_atom(?Tree, ?Atom) - at least one must be instantiated
tree_atom(Tree, Atom) :-
	nonvar(Tree),
	tree_to_atom(Tree, Atom),
	!. % green cut

tree_atom(Tree, Atom) :-
	var(Tree),
	nonvar(Atom),
	atom_to_tree(Atom, Tree).

% green cuts
tree_to_atom(nil, '') :- !.
tree_to_atom(t(V, nil, nil), V) :- !.
tree_to_atom(t(V, nil, R), Atom) :-
	R \= nil,
	tree_to_atom(R, RS),
	format(atom(Atom), '~a(,~a)', [V, RS]),
	!.
tree_to_atom(t(V, L, nil), Atom) :-
	L \= nil,
	tree_to_atom(L, LS),
	format(atom(Atom), '~a(~a,)', [V, LS]),
	!.
tree_to_atom(t(V, L, R), Atom) :-
	L \= nil,
	R \= nil,
	tree_to_atom(L, LS),
	tree_to_atom(R, RS),
	format(atom(Atom), '~a(~a,~a)', [V, LS, RS]),
	!.

atom_to_tree(Atom, Tree) :-
	atom_chars(Atom, List),
	next_tree(List, Tree, _).

% not so pretty and full of red cuts
next_tree([V, '(', L, ',', R, ')'|Rest],
	  t(V, t(L, nil, nil), t(R, nil, nil)), Rest) :- !.
next_tree([V, '(', ',', R, ')'|Rest], t(V, nil, t(R, nil, nil)), Rest) :- !.
next_tree([V, '(', L, ',', ')'|Rest], t(V, t(L, nil, nil), nil), Rest) :- !.
next_tree([V, '(', ','|Rest], t(V, nil, R), Leftover) :-
	next_tree(Rest, R, [')'|Leftover]),
	!.
next_tree([V, '(', L, ','|Rest], t(V, t(L, nil, nil), R), Leftover) :- 
	next_tree(Rest, R, [')'|Leftover]),
	!.
next_tree([V, '('|Rest], t(V, L, nil), Leftover) :-
	next_tree(Rest, L, [',', ')'|Leftover]),
	!.
next_tree([V, '('|Rest], t(V, L, R), Leftover) :-
	next_tree(Rest, L, [','|LLeftover]),
	next_tree(LLeftover, R, [')'|Leftover]).
