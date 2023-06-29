% Xs je prazen seznam
razdeli([], [], []).

% Xs ima samo en element
razdeli([X], [X], []).

% Xs ima vsaj dva elementa
razdeli([X1, X2 | Xs], [X1 | Ys], [X2 | Zs]) :-
    razdeli(Xs, Ys, Zs).
