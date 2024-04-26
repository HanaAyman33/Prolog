mem(X,[X|_]).
mem(X,[_|T]):-
    mem(X,T).
app([],L,L).
app(L1,L2,L):-
	L1 = [H|T],
	L = [H|T1],
	app(T,L2,T1).

rev([],[]).
rev([H|T],L):-
	rev(T,T1),
	app(T1,[H],L).

delete(X,[X|R],R).
delete(X,[H|T],[H|L]):-
	delete(X,T,L).

insert(X,L,[X|L]).
insert(X,[Y|L],[Y|L1]):-
	insert(X,L,L1).
%by using deletion
%insert(X,R,L):-
	%delete(X,R,L).

sum_list([],X,X).
sum_list([H|T],SumSoFar,FinalResult):-
	New is SumSoFar+H,
	sum_list(T,New,FinalResult).

reverse([],X,X).
reverse([X|Y],Z,W):-
	reverse(Y,[X|Z],W).

queens(P):-
	permutation([0,1,2,3],P),
	diagonals([0,1,2,3],P,S,D),
	all_diff(S),
	all_diff(D).
diagonals([],[],[],[]).
diagonals([H1|T1],[H2|T2],[H3|T3],[H4|T4]):-
	H3 IS H1+H2,
	H4 IS H1-H2,
	diagonals(T1,T1,T3,T4).
all_diff([X]).
all_diff([X|Y]):-
	\+member(X,Y),
	all_diff(Y).
