/*
V davnih ˇcasih so imeli mobiteli tipkovnice, na katerih so bile števke in ˇcrke:
Ker je bilo na vsaki tipki veˇc ˇcrk, iz zaporedja pritiskov ni bilo vedno možno razbrati, katero
besedo je natipkal uporabnik. Na primer, 6 7 3 5 lahko pomeni katerokoli od 81 štiriˇcrkovnh
besed:
mpdj, mpdk, mpdl, . . . , osfj, osfk, osfl.
V pomoˇc uporabniku so telefoni vsebovali spisek veljavnih besed. Ko je uporabnik natipkal zaporedje števk, so se prikazale samo veljavne besede iz slovarja. Na primer, v zgornjem primeru
bi se namesto vseh 81 možnosti prikazale besede “orel”, “osel” in “opel”.
a) (10 toˇck) V prologu sestavite predikat preslikaj(Beseda,Stevke), ki velja, kadar Beseda
natipkamo s zaporedjem stevk Stevke. V pomoˇc vam je predikat tipke:
tipke(2, [a,b,c]).
tipke(3, [d,e,f]).
tipke(4, [g,h,i]).
tipke(5, [j,k,l]).
tipke(6, [m,n,o]).
tipke(7, [p,q,r,s]).
tipke(8, [t,u,v]).
tipke(9, [w,x,y,z]).
Primer uporabe:
?- preslikaj([o,r,e,l], Stevke).
Stevke = [6, 7, 3, 5] ;
false.

*/

tipke(2, [a,b,c]).
tipke(3, [d,e,f]).
tipke(4, [g,h,i]).
tipke(5, [j,k,l]).
tipke(6, [m,n,o]).
tipke(7, [p,q,r,s]).
tipke(8, [t,u,v]).
tipke(9, [w,x,y,z]).

preslikaj([], []).
preslikaj([Hc|Tc], [Hs|Ts]) :- 
    tipke(N, List),
    member(Hc, List),
    Hs is N,
    preslikaj(Tc, Ts).

/*
b) (15 toˇck) Sestavite predikat moznosti(Veljavne,Stevke,Beseda), ki velja, kadar je Stevke
zaporedje števk, in je Beseda beseda s seznama Veljavne, ki bi jo lahko dobili s Stevke.
?- moznosti([[o,r,e,l],[o,p,i,c,a],[o,s,e,l],[r,i,b,a]], [6,7,3,5], Beseda).
Beseda = [o, r, e, l] ;
Beseda = [o, s, e, l] ;
false.
?- moznosti([[i,z,p,i,t],[j,e],[l,a,h,e,k]], Stevke, Beseda).
Stevke = [4, 9, 7, 4, 8],
Beseda = [i, z, p, i, t] ;
Stevke = [5, 3],
Beseda = [j, e] ;
Stevke = [5, 2, 4, 3, 5],
Beseda = [l, a, h, e, k] ;
false.
*/
moznosti([], _, []).
moznosti([Hv|Tv], Stevke, [Hv|Beseda]) :-
    preslikaj(Hv, Stevke),
    moznosti(Tv, Stevke, Besede).
moznosti([_|Tv], Stevke, Besede) :-
    moznosti(Tv, Stevke, Beseda).

/*
DRUGA REŠITEV
moznosti(_, [], []).
moznosti(Veljavne, Stevke, Beseda) :-
    member(Beseda, Veljavne),
    preslikaj(Beseda, Stevke).
*/