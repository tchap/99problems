%% 4.13 (**) Layout a binary tree (1)

% layout_binary_tree(+Tree, -LayoutTree)
layout_binary_tree(nil, nil).
layout_binary_tree(t(V, L, R), PT) :- layout(t(V, L, R), 1, 0, _, PT).

layout(nil, _, Seq, Seq, nil).
layout(t(V, L, R), D, SeqIn, SeqOut, t(V, D, Seq, PL, PR)) :-
	DS is D + 1,
	layout(L, DS, SeqIn, LeftSeqOut, PL),
	Seq is LeftSeqOut + 1,
	layout(R, DS, Seq, SeqOut, PR).
