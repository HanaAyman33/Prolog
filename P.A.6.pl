position('Spielberg', director).
position('Allen', manager).
position('Lee', supervisor).
find_position:-
    write('Which position do you want to know?'),nl,
    read(X),
    position(Y,X),
    write('The '),
    write(X),
    write(' is '),
    write(Y),
    write('.').

sum_to(1, 1):- !.
    sum_to(N, S) :-
            N1 is N-1,
            sum_to(N1, S1),
            S is S1+N.

a(X, Y) :- b(X), !, c(Y).
b(1).
b(2).
b(3).
c(1).
c(2).
c(3).
