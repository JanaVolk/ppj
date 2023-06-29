/*
3. naloga (30 toˇck)
V Prologu bomo sestavili program za urejanje seznamov z zlivanjem (angl. merge sort). To je
postopek tipa “deli & vladaj”, ki neurejeni seznam razdeli na dva enako dolga seznama, ju
rekurzivno uredi in nato zlije v urejen seznam, kot to prikazuje spodnji primer. Pozor: obiˇcajno
seznam razdelimo na pol, tu pa ga razdelimo na elemente na lihih in sodih mestih.
Najprej zapišimo glavni predikat uredi(L,S), ki velja, kadar je S po velikosti urejen seznam L:
uredi([], []).
uredi([X], [X]).
uredi([X1,X2|Xs], LS) :-
razdeli([X1,X2|Xs], Lihi, Sodi),
uredi(Lihi, LihiS),
uredi(Sodi, SodiS),
zlij(LihiS, SodiS, LS).
Sedaj je treba sestaviti še predikata razdeli in zlij.

a) (10 toˇck) Sestavite predikat razdeli(Xs,Ys,Zs), ki velja, kadar seznam Xs radelimo na seznama Ys in Zs tako, da so v Ys elementi iz lihih in 
v Zs elementi iz sodih položajev seznama Xs.
Primeri:
?- razdeli([42], Ys, Zs).
Ys = [42], Zs = [].
?- razdeli([1,3,5,7,9,42], Ys, Zs).
Ys = [1, 5, 9], Zs = [3, 7, 42].
*/

/*
razdeli(Xs, Ys, Zs) :- indeks(Xs, [], [], 1).
indeks([], Ys, Zs, K).
indeks([Hx|Tx], Ys, Zs, K) :- 1 =:= K mod 2, append(Ys, Hx, Y), K1 is K + 1, indeks(Tx, Y, Zs, K1).
indeks([Hx|Tx], Ys, Zs, K) :- 0 =:= K mod 2, append(Zs, Hx, Z), K1 is K + 1, indeks(Tx, Ys, Z, K1)., */

% Xs je prazen seznam
razdeli([], [], []).

% Xs ima samo en element
razdeli([X], [X], []).

% Xs ima vsaj dva elementa
razdeli([X1, X2 | Xs], [X1 | Ys], [X2 | Zs]) :-
    razdeli(Xs, Ys, Zs).

/*

DRUGA RESITEV

razdeli(Xs, Ys, Zs) :- indeks(Xs, [], YsRev, [], ZsRev, 1), reverse(YsRev, Ys), reverse(ZsRev, Zs).
indeks([], YAcc, YAcc, ZAcc, ZAcc, _).
indeks([Hx|Tx], YAcc, Ys, ZAcc, Zs, K) :- 
    1 =:= K mod 2, 
    K1 is K + 1, 
    indeks(Tx, [Hx|YAcc], Ys, ZAcc, Zs, K1).
indeks([Hx|Tx], YAcc, Ys, ZAcc, Zs, K) :- 
    0 =:= K mod 2, 
    K1 is K + 1, 
    indeks(Tx, YAcc, Ys, [Hx|ZAcc], Zs, K1).
*/

/*
b) (20 toˇck) Sestavite predikat zlij(Xs,Ys,Zs), ki velja kadar je izpolnjen naslednji pogoj: ˇce
sta Xs in Ys urejena seznama, je Zs urejen seznam elementov iz Xs in Ys. Primeri:
?- zlij([3,5,6,10,14], [1,2,5,6], Zs).
Zs = [1, 2, 3, 5, 5, 6, 6, 10, 14] ;
false.
?- zlij([], [1], Zs).
Zs = [1].
*/

/*
zlij(Xs, Ys, Zs) :- primerjaj(Xs, Ys, Zs).
primerjaj(Xs, [], []).
primerjaj(Xs, [], [Hz|Tz]) :- primerjaj([Hz| Xs], Ys, Tz).
primerjaj(Xs, [Hy|Ty], []) :- primerjaj([Hy| Xs], Ty, Zs).
primerjaj(Xs, [Hy|Ty], [Hz|Tz]) :- Hy < Hz, primerjaj([Hy| Xs], Ty, Zs).
primerjaj(Xs, [Hy|Ty], [Hz|Tz]) :- Hz < Hy, primerjaj([Hz| Xs], Ys, Tz).
primerjaj(Xs, [Hy|Ty], [Hz|Tz]) :- Hz =:= Hy, primerjaj([Hz, Hy| Xs], Ty, Tz).

*/

% Base case: if either list is empty, the result is just the other list.
zlij([], Ys, Ys).
zlij(Xs, [], Xs).

% Recursive case: if the head of Xs is less than or equal to the head of Ys, add it to Zs and recurse on the tail of Xs and whole Ys
zlij([Hx|Tx], [Hy|Ty], [Hx|Tz]) :- 
    Hx =< Hy, 
    zlij(Tx, [Hy|Ty], Tz).

% Recursive case: if the head of Ys is less than the head of Xs, add it to Zs and recurse on the tail of Ys and whole Xs
zlij([Hx|Tx], [Hy|Ty], [Hy|Tz]) :- 
    Hx > Hy, 
    zlij([Hx|Tx], Ty, Tz).
