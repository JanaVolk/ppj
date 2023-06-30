% Razdeli Xs na Ys in Zs, kjer Ys vsebuje lihe pozicije in Zs sode
razdeli([X], [X], []).
razdeli([X1, X2], [X1], [X2]).
razdeli([X1, X2 | T], [X1|Y], [X2|Z]) :-
    razdeli(T, Y , Z).

zlij([X], [], [X]).
zlij([], [Y], [Y]).
zlij(Xs, [], Xs).
zlij([], Ys, Ys).
zlij([X|Tx], [Y|Ty], Zs) :-
    (X =< Y, zlij(Tx, [Y | Ty], Z), append([X], Z, Zs));
    (X > Y, zlij([X|Tx], Ty, Z), append([Y], Z, Zs)).

% uredi([], []).
% uredi([X], [X]).
% uredi([X1,X2|Xs], LS) :-
%     razdeli([X1,X2|Xs], Lihi, Sodi),
%     uredi(Lihi, LihiS),
%     uredi(Sodi, SodiS),
%     zlij(LihiS, SodiS, LS).
