min(N1,N2,N3,Min):-
    min_help(N1,N2,N3,M),
    (M=1,
    Min=N1 ;
    M=2,
    Min=N2 ;
    M=3,
    Min=N3).
min_help(0,_,_,1).
min_help(_,0,_,2).
min_help(_,_,0,3).
min_help(s(X),s(Y),s(Z),Min):- 
    min_help(X,Y,Z,Min).

sorted_merge([],L,L).
sorted_merge(L,[],L).
sorted_merge([H1|T1],[H2|T2],[H2|TL]):-
    H1>H2,
sorted_merge([H1|T1],T2,TL).
sorted_merge([H1|T1],[H2|T2],[H1|TL]):-
    H2>=H1,
    sorted_merge(T1,[H2|T2],TL).

