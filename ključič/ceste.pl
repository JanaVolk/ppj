zacetne_zaloge([a/10, b/3, c/0, d/5, e/1, m/3, g/2]).

cesta(a, b, 8).
cesta(b, c, 3).
cesta(c, d, 4).
cesta(a, e, 6).
cesta(e, m, 9).
cesta(m, g, 3).
cesta(g, d, 5).
cesta(g, b, 4).

% example() :-
%   condtion,
%   CODE IF TRUE;
%   CODE IF FALSE.

sprazni(_, [], _) :- false.
sprazni(V, [X/Y | T], Z) :-
    X = V,
    Z = [X/0|T];
    sprazni(V, T, Z2),
    append([X/Y], Z2, Z).


natoci(V, G1, Z1, G2, Z2) :-
    sprazni(V, Z1, Z2),
    member(V/N, Z1),
    G2 is G1 + N.

etapa(V1, G1, Z1, V2, G2, Z2) :-
    natoci(V1, G1, Z1, G, Z2),
    cesta(V1, V2, C),
    G2 is G - C,
    G2 >= 0.

pot([_], G, Z, G, Z).
pot([V1, V2|T], G1, Z1, G2, Z2) :-
    etapa(V1, G1, Z1, V2, G, Z),
    pot([V2|T], G, Z, G2, Z2).

% zacetne_zaloge(A), pot([a,e,m,b,g,b,c,d,g,b,a], 22, A, G2, Z2).
% False