/*
Oznake na povezavah so dolžine dvosmernih cest, ki povezujejo vozlišča. V vsakem vozlišču je
zaloga goriva, na primer v vozlišču d je 5 enot goriva. Preden se Klemen odpelje iz vozlišča,
vedno dotoči vse razpoložljivo gorivo. V sanjah ima avto dovolj velik rezervoar, da se nikoli ne
napolni do konca. Avto porabi eno enoto goriva za eno enoto razdalje. Primer: če ima avto 2
enoti goriva v rezervoarju, se lahko pelje po poti a–b–c, ne more pa se peljati po poti a–e–m,
ker mu za povezavo e–m zmanjka goriva.
Da bo nočna mora popolna, bomo Klemna usmerjali s prologom. Začetne zaloge goriva v
vozliščih in cestne povezave predstavimo s predikatoma zacetne_zaloge in cesta:
zacetne_zaloge ([a/10, b/3, c/0, d/5, e/1, m/3, g/2]).
cesta(a, b, 8).
cesta(b, c, 3).
cesta(c, d, 4).
cesta(a, e, 6).
cesta(e, m, 9).
cesta(m, g, 3).
cesta(g, d, 5).
cesta(g, b, 4).
Pozor, cesta navaja samo po eno od obeh smeri.


a) (8 točk) Sestavite predikat sprazni(V, Z1, Z2), ki sprazni zaloge goriva v vozlišču V, pri
čemer so Z1 trenutne zaloge in Z2 zaloge, ko spraznimo V. Primer:
?- sprazni(c, [a/5, b/3, c/4, d/8], Z2).
Z2 = [a/5, b/3, c/0, d/8].
*/

zacetne_zaloge([a/10, b/3, c/0, d/5, e/1, m/3, g/2]).
cesta(a, b, 8).
cesta(b, c, 3).
cesta(c, d, 4).
cesta(a, e, 6).
cesta(e, m, 9).
cesta(m, g, 3).
cesta(g, d, 5).
cesta(g, b, 4).

sprazni(V, [], []).
sprazni(V,[V/H1|T1], [V/0|T2]) :- sprazni(V, T1, T2).
sprazni(V, [K/H1|T1], [K/H1|T2]) :- V \== K, sprazni(V, T1, T2).

/*
b) (8 točk) Sestavite predikat natoci(V, G1, Z1, G2, Z2), ki sprejme vozlišče V, trenutno
gorivo v avtu G1 in zaloge Z1. Gorivo iz vozlišča V pretoči v avto, da dobi novo stanje goriva G2
in zaloge Z2. Primer:
?- natoci(c, 4, [a/5, b/3, c/4, d/8], G2 , Z2).
G2 = 8, Z2 = [a/5, b/3, c/0, d/8].

*/

natoci(V, G1, [], G2, []).
natoci(V, G1, [V/X|T1], G2, [V/0|T2]) :- G2 is G1+X, natoci(V, G1, T1, G2, T2).
natoci(V, G1, [K/X|T1], G2, [K/X|T2]) :- V\== K, natoci(V, G1, T1, G2, T2).

/*
c) (8 točk) Sestavite predikat etapa(V1, G1, Z1, V2, G2, Z2), ki prevozi cesto med V1 in V2,
če ta obstaja in če ima avto dovolj goriva. Pred etapo dotoči zalogo iz V1. Pri tem sta G1 in Z1
začetno gorivo v avtu in vozliščih, ter G2 in Z2 končno gorivo v avtu in vozliščih. Primeri:
?- etapa(a, 5, [a/10, b/3, c/0, d/5, e/1, m/3, g/2], b, G2 , Z2).
G2 = 7, Z2 = [a/0, b/3, c/0, d/5, e/1, m/3, g/2] .
?- etapa(a, 5, [a/10, b/3, c/0, d/5, e/1, m/3, g/2], c, G2 , Z2).
false.
?- etapa(e, 5, [a/10, b/3, c/0, d/5, e/1, m/3, g/2], m, G2 , Z2).
false.
?- etapa(e, 9, [a/10, b/3, c/0, d/5, e/1, m/3, g/2], m, G2 , Z2).
G2 = 1, Z2 = [a/10, b/3, c/0, d/5, e/0, m/3, g/2] .
*/

etapa(V1, G1, [], V2, G2, []).
etapa(V1, G1, [V1/K1|T1], V2, G2, [V1/0|T2]) :- 
    (cesta(V1, V2, X); cesta(V2, V1, X)), 
    G2 is G1 + K1 - X,
    G2 >= 0,
    etapa(V1, G1, T1, V2, G2, T2).
etapa(V1, G1, [Y1/K1|T1], V2, G2, [Y1/K1|T2]) :- 
    (cesta(V1, V2, X); cesta(V2, V1, X)),  
    Y1 \== V1,
    etapa(V1, G1, T1, V2, G2, T2).

/*
d) (8 točk) Sestavite predikat pot(L, G1, Z1, G2, Z2), ki prevozi pot, navedeno v seznamu
vozlišč L, če je to možno. Pri tem sta G1 in Z1 začetno gorivo v avtu in vozliščih, ter G2 in Z2
končno gorivo v avtu in vozliščih. Pozor, pot lahko vodi večkrat skozi isto vozlišče. Primeri:
?- pot ([a], 0, [a/10, b/3, c/0, d/5, e/1, m/3, g/2], G2 , Z2).
G2 = 0, Z2 = [a/10, b/3, c/0, d/5, e/1, m/3, g/2].
?- pot ([a, b, c, d], 0, [a/10, b/3, c/0, d/5, e/1, m/3, g/2], G2 , Z2).
false.
?- pot ([a, b, c, d], 5, [a/10, b/3, c/0, d/5, e/1, m/3, g/2], G2 , Z2).
G2 = 3, Z2 = [a/0, b/0, c/0, d/5, e/1, m/3, g/2] .
*/


%prva resitev
%pot([], G, Z, G, Z).
%pot([V], G, Z, G, Z).
%pot([E1, E2 |R], G1, Z1, G2, Z2) :- etapa(E1, G1, Z1, E2, G3, Z3), pot([E2,R], G3, Z3, G2, Z2).

%druga resitev
pot([], G, Z, G, Z).
pot([V], G, Z, G, Z).
pot([V1,V2|Rest], G1, Z1, G2, Z2) :-
    natoci(V1, G1, Z1, G3, Z3),
    (cesta(V1, V2, X); cesta(V2, V1, X)), 
    G4 is G3 - X,
    G4 >= 0, 
    sprazni(V1, Z3, Z4),
    pot([V2|Rest], G4, Z4, G2, Z2).


/*
e) (6 točk) Navedite poizvedbo, ki ugotovi, ali lahko avto prevozi pot a–e–m–g–b–c–d–g–b–a,
če je na začetku v rezervoarju 22 enot goriva. Začetne zaloge v vozliščih so navedene s predikatom
zacetne_zaloge. Kakšen je odgovor?
*/

%pot([a, e, m, g, b, c, d, g, b, a], 22, [a/10, b/3, c/0, d/5, e/1, m/3, g/2], G2, Z2).

