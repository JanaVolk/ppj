/*
Klemen se na morju igra s prelivanjem vode med kanglicami. V vsakem koraku lahko naredi
eno od naslednjih potez:
• Izprazni eno od kanglic.
• Napolni eno od kanglic do roba.
• Pretoˇci vodo iz ene kanglice v drugo, dokler ni prva prazna ali druga polna.
Na primer, ˇce ima prazno kanglico prostornine 3 ` in kanglico prostornine 5 `, v kateri so že 4 `
vode, lahko napolni prvo ali drugo kanglico, izprazni drugo, ali pretoˇci 3 ` iz druge v prvo.
Klemna je od nekdaj zanimalo, kako bi z danimi kanglicami v nekaj potezah izmeril želeno
koliˇcino vode.
Pomagali mu bomo odgovoriti na vprašanje v Prologu. Trenutno stanje kanglic predstavimo
s seznamom
[v1/c1, v2/c2, . . . , vn/cn]
pri ˇcemer vi/ci pomeni, da ima i-ta kanglica prostornino ci
in da je v njej vi
litrov vode. Vse
prostornine so seveda pozitivne in vse koliˇcine vode nenegativne. (Pozor, v prologu zapis V/C
ne oznaˇcuje ulomka ali deljenja, ampak urejeni par V in C.)


a) (5 toˇck) Sestavite predikat resitev(X,L), ki velja, kadar je v eni od kanglic s seznama L
natanko X litrov vode. Primer uporabe:
?- resitev(3, [4/11, 3/5, 0/7]).
true.
?- resitev(4, []).
false.
*/

resitev(_, []) :- false.
resitev(X, [X/_|T]) :- true.
resitev(X, [_/_|T]) :- resitev(X, T).

/*
b) (8 toˇck) Sestavite predikat napolni(L,M), ki velja, kadar lahko dobimo seznam kanglic M iz
seznama L tako, da napolnimo eno od še ne polnih kanglic. Primer uporabe:
?- napolni([4/11, 0/3, 7/7], M).
M = [11/11, 0/3, 7/7] ;
M = [4/11, 3/3, 7/7] ;
false.
?- napolni([11/11, 7/7], M).
false.
?- napolni([], M).
false.

*/
napolni([],[]):-false.
napolni([H/C|T],[C/C|T]):- H<C.
napolni([H/C|T], [H/C|Rest]):- H=<C, napolni(T,Rest).

/*
c) (7 toˇck) Sestavite predikat sprazni(L,M), ki velja, kadar lahko dobimo seznam kanglic M iz
seznama L tako, da spraznimo eno od nepraznih kanglic. Primer uporabe:
?- sprazni([4/11, 0/3, 7/7], M).
M = [0/11, 0/3, 7/7] ;
M = [4/11, 0/3, 0/7] ;
false.
?- sprazni([0/3, 0/7], M).
false.
?- sprazni([], M).
false.

*/

sprazni([],[]) :- false.
sprazni([H/C|T],[0/C|T]):- H<C.
sprazni([H/C|T], [H/C|Rest]):- H=<C, sprazni(T,Rest).

/*
d) (10 toˇck) Klemen je sestavil predikat pretoci1(V1/C1, V2/C2, W1/C1, W2/C2), ki velja,
kadar s pretakanjem vode iz kanglice V1/C1 v kanglico V2/C2 dobimo kanglici W1/C1 in W2/C2:
pretoci1(V1/C1, V2/C2, W1/C1, W2/C2) :-
V1 > 0, V2 < C2, W2 is min(V1+V2,C2), W1 is V1+V2-W2.
Poleg tega je sestavil še predikat izberi2(L, X, Y, M), ki iz seznama L izbere dva elementa
X in Y in je M enak L brez izbranih dveh elementov:
izberi1([X|L], X, L).
izberi1([Y|M], X, [Y|L]) :- izberi1(M, X, L).
izberi2(M, X, Y, L) :- izberi1(M, X, K), izberi1(K, Y, L).
Sestavite predikat pretoci(L, M), ki velja, kadar lahko seznam kanglic M dobimo iz seznama
L tako, da izberemo dve kanglici in pretoˇcimo vodo iz ene v drugo. (Vrstnega reda kanglic ni
treba ohraniti.) Primer uporabe:
?- pretoci([4/10, 0/3, 7/7], M).
M = [1/10, 3/3, 7/7] ;
M = [1/7, 10/10, 0/3] ;
M = [4/7, 3/3, 4/10] ;
false.
?- pretoci([3/7, 2/3], M).
M = [2/7, 3/3] ;
M = [0/3, 5/7] ;
false.
?- pretoci([2/7, 0/3], M).
M = [0/7, 2/3] ;
false.
?- pretoci([2/7], M).
false.

*/

pretoci1(V1/C1, V2/C2, W1/C1, W2/C2) :-
V1 > 0, V2 < C2, W2 is min(V1+V2,C2), W1 is V1+V2-W2.

izberi1([X|L], X, L).
izberi1([Y|M], X, [Y|L]) :- izberi1(M, X, L).
izberi2(M, X, Y, L) :- izberi1(M, X, K), izberi1(K, Y, L).

/*
?- pretoci([4/10, 0/3, 7/7], M).
M = [1/10, 3/3, 7/7] ;
M = [1/7, 10/10, 0/3] ;
M = [4/7, 3/3, 4/10] ;
false.
?- pretoci([3/7, 2/3], M).
M = [2/7, 3/3] ;
M = [0/3, 5/7] ;
false.


*/
pretoci([X], M) :- false.
pretoci(L, M) :- izberi2(L, V1/C1, V2/C2, R), pretoci1(V1/C1, V2/C2, W1/C1, W2/C2), append(R, [W1/C1, W2/C2], M).

/*
e) (10 toˇck) Na koncu sestavite še predikat poteze(V, L, M), ki velja, kadar je M seznam seznamov kanglic, ki predstavlja zaporedje potez, ki vodijo od zaˇcetnega stanja kanglic L do
kanglic, od katerih vsaj ena vsebuje V litrov vode. Primer uporabe:
?- length(M,3), poteze(4, [0/3, 0/7], M).
M = [[0/3, 0/7], [0/3, 7/7], [4/7, 3/3]] ;
false.
?- length(M,4), poteze(2, [1/1, 0/3], M).
M = [[1/1, 0/3], [1/1, 3/3], [0/1, 3/3], [2/3, 1/1]] ;
M = [[1/1, 0/3], [0/1, 0/3], [0/1, 3/3], [2/3, 1/1]] ;
M = [[1/1, 0/3], [0/1, 1/3], [1/1, 1/3], [0/1, 2/3]] ;
M = [[1/1, 0/3], [0/1, 1/3], [0/1, 3/3], [2/3, 1/1]] .
?- length(M,10), poteze(3, [0/2, 0/4], M).
false.

*/
 
poteze(V,L,M) :- napolni(L, N), resitev(V, N) .
poteze(V,L,M) :- napolni(L,N), pretoci(N,P), resitev(V,P), append() .