%EXCERCISE 2-2
edge(a,b).
edge(a,c).
edge(b,d).
edge(c,d).
edge(d,e).

path(X,Y):-
    edge(X,Y).
path(X,Y):-
    edge(X,Z),
    path(Z,Y).

%EXCERCISE 2-3
ingredient(flour,dough).
ingredient(egg,dough).
ingredient(dough,cake).
ingredient(sugar,frosting).
ingredient(chocolate,cake).

partOfRecipe(X,Y):-
	ingredient(X,Y).

partOfRecipe(X,Y):-
	ingredient(X,Z),
    partOfRecipe(Z,Y).

%EXCERCISE 2-4
reaction(h,h,h2).
reaction(h2,o,h2o).
reaction(o,h,oh).
reaction(h2,h,h3).
reaction(na,oh,naoh).

checkPartOf(X,Y):-  reaction(X,_,Y).
checkPartOf(X,Y):-  reaction(_,X,Y).
checkPartOf(X,Y):-
   (reaction(X,_,Z);reaction(_,X,Z)),
    checkPartOf(Z,Y).

%EXCERCISE 2-5
before(the_hunger_games,the_hunger_games_catching_fire).
before(the_hunger_games_catching_fire,the_hunger_games_mockingjay_part1).
before(the_hunger_games_mockingjay_part1,the_hunger_games_mockingjay_part2).

mustWatchBefore(M1,M2):-
    before(M1,M2).
mustWatchBefore(M1,M2):-
    before(M1,M),
    mustWatchBefore(M,M2).

%EXCERCISE 2-6
parent(ayman,hana).
parent(gehan,hana).
parent(abdelhamid,ayman).
parent(mohamed,gehan).
parent(gehan,ahmed).
parent(ayman,rana).
parent(rana,lara).

descendant(X,Y):-
    parent(Y,X).

descendant(X,Y):-
    parent(Y,Z),
    descendant(X,Z).

%EXCERCISE 2-7
composedOf(aggregate,sand).
composedOf(aggregate,rock).
composedOf(aggregate,gravel).
composedOf(concrete,aggregate).
composedOf(oncrete,water).
composedOf(wall,concrete).
composedOf(wall,brick).

partOf(X,Y):-
    composedOf(Y,X).
partOf(X,Y):-
    composedOf(Y,Z),
    partOf(X,Z).