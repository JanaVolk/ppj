tipke(2, [a,b,c]).
tipke(3, [d,e,f]).
tipke(4, [g,h,i]).
tipke(5, [j,k,l]).
tipke(6, [m,n,o]).
tipke(7, [p,q,r,s]).
tipke(8, [t,u,v]).
tipke(9, [w,x,y,z]).

get_num(Key, N) :-
    tipke(N, Keys),
    member(Key, Keys).

preslikaj([], []).
preslikaj([H|T], [N|S]) :-
    get_num(H, N),
    preslikaj(T, S).

moznost([], _, []).
moznosti([Beseda|_], Nums, Beseda) :-
    preslikaj(Beseda, Nums).
moznosti([_|H], Nums, Beseda) :-
    moznosti(H, Nums, Beseda).
