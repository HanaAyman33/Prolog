length1([],0).
length1([_|T],N):-
    length1(T,N1),   
    N1 is N+1.

union1([],L,L).
union1([H|T],L2,L):-
    member(H,L2),
    union1(T,L2,L).
union1([H|T],L2,[H|T1]):-
    \+member(H,L2),
    union1(T,L2,T1).

intersect1([],_,[]).
intersect1([H|T],L2,[H|T1]):-
    member(H,L2),
    intersect1(T,L2,T1).
intersect1([H|T],L2,L):-
    \+member(H,L2),
    intersect1(T,L2,L).

replace_all([],_,_,[]).
replace_all([X|T1],X,X1,[X1|T]):-
    replace_all(T1,X,X1,T).
replace_all([X|T1],Y,X1,[X|T2]):-
    X\=Y,
    replace_all(T1,Y,X1,T2).

perm([H|T],L) :- 
    perm(T,P),
    insert(H,P,L).
perm([],[]).
%either insert first
insert(X,L,[X|L]).
%or insert later in the tail
insert(X,[H|T],[H|T1]) :- 
    insert(X,T,T1).

check_sequence([]).
check_sequence([H|T]):-
    last(T,X),
    H\=X,
    reverse(T,[_|Tail]),
    check_sequence(Tail).

sum_if([],_,_,0).
sum_if([H|T],Min,Max,S):-
    H>=Min,H=<Max,
    sum_if(T,Min,Max,S1),
    S is S1+H.
sum_if([H|T],Min,Max,S):-
    (H<Min;H>Max),
    sum_if(T,Min,Max,S).

perm_sort(List,Sorted):-
    perm(List,Sorted),
    is_sorted(Sorted).
is_sorted([]).
is_sorted([_]).
is_sorted([X,Y|T]):-
    X=<Y,
    is_sorted([Y|T]).

insertion_sort(List,Sorted):-
    i_sort(List,[],Sorted).
i_sort([],X,X).
i_sort([H|T],Accumulator,Sorted):-
    insert1(H,Accumulator,N),
    i_sort(T,N,Sorted).
insert1(X,[Y|T],[Y|NT]):-
    X>Y,insert1(X,T,NT).
insert1(X,[Y|T],[X,Y|T]):-
    X=<Y.
insert1(X,[],[X]).

sum_list([],0).
sum_list([H|T],S):-
    sum_list(T,T1),
    S is H + T1.

sum_of(List,Sum,Res):- 
    sum_helper(List,Sum,[],Res).
sum_helper(_,Sum,Acc,Acc):- 
    sum_list(Acc,Sum).
sum_helper([H|T],Sum,Acc,Res):-
    sum_list(Acc,SumSoFar),
    SumSoFar\=Sum,
    append(Acc,[H],NewAcc),
    sum_helper(T,Sum,NewAcc,Res).
sum_helper([_|T],Sum,Acc,Res):-
    sum_list(Acc,SumSoFar),
    SumSoFar\=Sum,
    sum_helper(T,Sum,Acc,Res).

int_to_bin(X,Y):-
    int_to_bin(X,Y,null).
int_to_bin(0,Acc,Acc).
int_to_bin(X,Y,Acc):-
    X>0, X1 is X//2,
    1 is X mod 2,
    AccNew = s1(Acc),
    int_to_bin(X1,Y,AccNew).
int_to_bin(X,Y,Acc):-
    X>0, X1 is X//2,
    0 is X mod 2,
    AccNew = s0(Acc),
    int_to_bin(X1,Y,AccNew).

same_l([]).
same_l([_]).
same_l([H1,H2|T]):-
    \+is_list(H1),
    \+is_list(H2),
    same_l([H2|T]).
same_l([H1,H2|T]):-
    same_l(H1),
    same_l(H2),
    is_list(H1),
    is_list(H2),
    length(H1,L),
    length(H2,L),
    same_l([H2|T]).