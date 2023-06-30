tipke(2, [a,b,c]).
tipke(3, [d,e,f]).
tipke(4, [g,h,i]).
tipke(5, [j,k,l]).
tipke(6, [m,n,o]).
tipke(7, [p,q,r,s]).
tipke(8, [t,u,v]).
tipke(9, [w,x,y,z]).

getNum(Beseda, Stevka) :-
    tipke(Stevka, Seznam),
    member(Beseda,Seznam).

preslikaj([], []).
preslikaj([Crka | T], [Stevka | S]) :-
    getNum(Crka, Stevka),
    preslikaj(T, S).


% moznosti([], _, []).
moznosti([H|_], Stevke, H):-
    preslikaj(H, Stevke).
moznosti([_|T], Stevke, Beseda) :-
    moznosti(T, Stevke, Beseda).
