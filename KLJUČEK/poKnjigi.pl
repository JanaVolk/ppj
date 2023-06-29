footmassage(vincent, mia).
footmassage(joe, mia).
footmassage(rob, barbara).
kills(marcellus, X) :-
    footmassage(X, mia).

nutritious(apple).
nutritious(broccoli).
tasty(cake).
tasty(pasta).
eats(jules, X) :- nutritious(X).
eats(jules, X) :- tasty(X).

%vertical(line(point(X,Y), point(X,Z))).
%horizontal(line(point(X,Y), point(Z,Y))).

f(a).
f(b).
g(a).
g(b).
h(b).
k(X) :- f(X),g(X),h(X).

house_elf(dobby).
witch(hermione).
witch('McGonagall').
witch(rita_skeeter).
wizard(harry).
magic(X):-house_elf(X).
magic(X):-wizard(X).
magic(X):-witch(X).

word(abalone,a,b,a,l,o,n,e).
word(abandon,a,b,a,n,d,o,n).
word(enhance,e,n,h,a,n,c,e).
word(anagram,a,n,a,g,r,a,m).
word(connect,c,o,n,n,e,c,t).
word(elegant,e,l,e,g,a,n,t).

crosswd(Word1V, Word2V, Word3V, Word1H, Word2H, Word3H) :-
    word(Word1V, _A, A, _B, D, _C, G, _D),
    word(Word2V, _E, B, _F, E, _G, H, _H),
    word(Word3V, _I, C, _J, F, _K, I, _L),
    word(Word1H, _M, A, _N, B, _O, C, _P),
    word(Word2H, _R, D, _S, E, _T, F, _U),
    word(Word3H, _V, G, _Z, H, _X, I, _Y).

% Russian dolls
mama(katarina, olga).
mama(olga, natasha).
mama(natasha, irina).

in(X, Y) :- mama(X, Y).
in(X, Y) :-
    mama(X, Z),
    in(Z, Y).

numeral(0).
numeral(succ(X)) :- numeral(X).

add(0, Y, Y).
add(succ(X), Y, succ(Z)) :-
    add(X, Y, Z).

greater_than(succ(_), 0).
greater_than(succ(X), succ(Y)) :-
    greater_than(X, Y).
    

leaf(1).
leaf(2).
leaf(3).
leaf(4).
leaf(5).

tree(leaf(X), leaf(Y)) :- X \== Y.
tree(X, Y) :-
    tree(leaf(X), leaf(Y)),
    tree(tree(X), tree(Y)).


directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(fahlquemont,stAvold).
directTrain(stAvold,forbach).
directTrain(saarbruecken,dudweiler).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).


travelBetween(X, Y) :- directTrain(X, Y).
travelBetween(X, Y) :-
    directTrain(X, Z),
    travelBetween(Z, Y).

travelBetween(X, Y) :- directTrain(Y, X).
travelBetween(X, Y) :-
    directTrain(Y, Z),
    travelBetween(Z, X).


byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).
byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).
byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

travel(X, Y) :- byCar(X, Y).
travel(X, Y) :- byPlane(X, Y).
travel(X, Y) :- byTrain(X, Y).

travel(X, Y) :-
    byCar(X, Z),
    travel(Z, Y).

travel(X, Y) :-
    byPlane(X, Z),
    travel(Z, Y).

travel(X, Y) :-
    byTrain(X, Z),
    travel(Z, Y).

%travel(X, Y, Z) :- 


% LISTS %
% [X|Y] = [[], dead(zed), [2, [b, chopper]]].

a2b([],[]).
a2b([a|Ta], [b|Tb]) :- a2b(Ta, Tb).


tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).

listtran([], []).
listtran([X|Tx], [Y|Ty]) :-
    tran(X,Y),
    listtran(Tx, Ty).


twice([],[]).
twice([X|Tx],[X, X|Ty]) :-
    twice(Tx, Ty).


combine1([],[],[]).
combine1([X|Tx],[Y|Ty], [X,Y|W]) :-
    combine1(Tx, Ty, W).

combine2([],[],[]).
combine2([X|Tx],[Y|Ty], [[X,Y]|W]) :-
    combine2(Tx, Ty, W).

combine3([],[],[]).
combine3([X|Tx],[Y|Ty], [join(X,Y)|W]) :-
    combine3(Tx, Ty, W).


member(X,[X|_]).
member(X, [_|T]) :-
    member(X, T).


mysubset([], _).
mysubset([X|Tx],Y):-
    member(X,Y),
    mysubset(Tx,Y).


mysuperset(_,[]).
mysuperset(X, [Y|Ty]) :-
    member(Y,X),
    mysuperset(X, Ty).


increment(X,Y) :- X =:= Y-1.

sum(X,Y,Z) :- Z =:= X + Y.


addone([], []).
addone([H|T], [A|Ty]) :-
    A is H+1,
    addone(T, Ty).

/* To pa ne dela
addone([], []).
addone([H|T], [A is H+1|Ty]) :-
    addone(T, Ty).
*/


accMin(List, Min) :-
    List = [H|_],
    accMinHelper(List, H, Min).

accMinHelper([H|T], A, Min) :-
    H < A,
    accMinHelper(T, H, Min).

accMinHelper([H|T], A, Min) :-
    H >= A,
    accMinHelper(T, A, Min).

accMinHelper([], A, A).

scalarMulti(_, [], []).
scalarMulti(X, [H|T], [A|R]) :-
    A is X*H,
    scalarMulti(X, T, R).

%scalarMulti(_, [], []).


dot(X,Y,Res) :-
    dotHelper(X, Y, 0, Res).

dotHelper([], [], A, A).
dotHelper([X|Tx], [Y|Ty], A, Res) :-
    N is X*Y+A,
    dotHelper(Tx, Ty, N, Res).


% append([],L,L).
% append([H|T], L2, [H|L3]) :- append(T, L2, L3).


prefix(P, L) :- append(P, _, L).

postfix(P, L) :- append(_, P, L).

reverse(L, R) :- accReverse(L, [], R).
accReverse([H|T], A, R) :- accReverse(T, [H|A], R).
accReverse([], A, A).


doubled(List) :- append(X, X, List).

palindrome(List) :-
    reverse(List, Rez),
    equal(List, Rez).

equal([],[]).
equal([X|Tx], [X|Ty]) :-
    %X =:= Y,
    equal(Tx, Ty).
%equal(X, Y) :- X=Y.


second(X, [_, X|_]).

swap12([X, Y|T], [Y, X|T]).

final(X, List) :-
    reverse(List, [X|_]).


% toptail([_|T], Rez) :-
%     reverse(T, [_|Ty]),
%     reverse(Ty, Rez).

toptail(List, Rez) :- append([_|Rez], [_], List).

swapfl(List1, List2) :-
    append([X|Vmes], [Y], List1),
    append([Y|Vmes], [X], List2).

% ne dela
% swapfl2([H1|_], List2) :-
%     List2 = [H2|_],
%     append([H2|_], [H1], List2).


% english(red).
% red(english).
% english()
% spanish(jaguar).
% jaguar(spanish).

% people().
% colour

% zebra(X) :-


% member(X,[X|_]).
% member(X, [_|T]) :-
%     member(X, T).


member2(X, List) :- append(_,[X|_],List).


% TUKAJ SEM OSTALA!! TA SE NI DOKONCANA. STRAN 91.
set(List1, List2) :- setAcc(List1, [], List2).

setAcc([], A, A).
setAcc([H|T], A, Rez) :-
    member(H, T),
    append(A, H, W),
    setAcc(T, W, Rez).

%set(List1, List2) :-


clovek(andrej).
clovek(anja).
clovek(tomaz).
clovek(hana).
star(tomaz).
mlad(hana).

delavec(X) :- clovek(X), star(X).
delavec(X) :- clovek(X), mlad(X).
