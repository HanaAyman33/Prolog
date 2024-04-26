maximum(A,B,A):-	A>=B.
maximum(A,B,B):-	B>A.

%seq(F,L,N):-
	%F<=L,
	%N = F.
%seq(F,L,N):-
	%F<L,
	%F1 is F+1, 
	%seq(F1,L,N).

mult(_,0,0).
mult(X,Y,Z):-
	Y>0,
	Y1 is Y-1,
	mult(X,Y1,Z1),
	Z is X + Z1.

expo(_,0,1).
expo(X,Y,Z):-
	Y>0,
	Y1 is Y-1,
	expo(X,Y1,Z1),
	mult(X,Z1,Z).

ackermann(0,Y,Z):-
	Z is Y+1.
ackermann(X,0,Z):-
	X>0,
	X1 is X-1,
	ackermann(X1,1,Z).
ackermann(X,Y,Z):-
	X>0,Y>0,
	X1 is X-1,
	Y1 is Y-1,
	ackermann(X1,Y1,Z1),
	ackermann(X,Z1,Z).

date(1,january,31).
date(2,february,28).
date(3,march,31).
date(4,april,30).
date(5,may,31).
date(6,june,30).
date(7,july,31).
date(8,august,31).
date(9,september,30).
date(10,october,31).
date(11,november,30).
date(12,december,31).
days_left(Month,Day,DaysLeft):-
	date(_,Month,All),
	DaysLeft is All - Day.

course(csen403,timing(wednesday,1),lecturer(slim,abdennadher),room(c,h14)).
course(csen401,timing(monday,1),lecturer(slim,abdennadher),room(b,h3)).
schedule(Room_number,X):-
	course(X,_,_,room(_,Room_number)).
busy(Room_number,Day,Slot):-
	course(_,timing(Day,Slot),_,room(_,Room_number)).
	
bt(5, bt(6, nil, nil), bt(8,bt(9,nil, nil),nil)).
depth(nil,0).
depth(bt(_,LS,RS),D):-
	depth(LS,DL),
	depth(RS,DR),
	maximum(DL,DR,Dmax),
	D is Dmax+1.

sum(0,X,X).
sum(s(X),Y,Z):-
	sum(X,Y,Z1),Z = s(Z1).
sum(s(X),Y,s(Z1)):-
	sum(X,Y,Z1).

subtract(X,0,X).
subtract(s(X),s(Y),Z):-
	subtract(X,Y,Z).

mult2(X,0,0).
mult2(X,s(Y),Z):- 
	mult2(X,Y,W),
	sum(X,W,Z).


evaluate(plus(X,Y),Z):- evaluate(X,Z1),evaluate(Y,Z2), Z is Z1+Z2.
evaluate(minus(X,Y),Z):- evaluate(X,Z1),evaluate(Y,Z2), Z is Z1-Z2.
evaluate(times(X,Y),Z):- evaluate(X,Z1),evaluate(Y,Z2), Z is Z1*Z2.
evaluate(divide(X,Y),Z):- evaluate(X,Z1),evaluate(Y,Z2), Z is Z1/Z2.
evaluate(X,X):- number(X).
