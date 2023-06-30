resitev(_, []) :- false.
resitev(X, [V/_ | T]) :-
    X = V -> true;
    resitev(X, T).

napolni([], []) :- false.
napolni([V/C|T], [C/C | T]) :- V < C.
napolni([V/C | T], [V/C | H]) :-
    napolni(T, H).


sprazni([], []) :- false.
sprazni([V/C|T], [0/C | T]) :- V > 0.
sprazni([V/C|T], [V/C | H]) :- 
    sprazni(T, H).


pretoci1(V1/C1, V2/C2, W1/C1, W2/C2) :-
    V1 > 0, V2 < C2,
    W2 is min(V1 + V2, C2),
    W1 is V1 + V2 - W2.

izberi1([X|L], X, L).
izberi1([Y|M], X, [Y|L]) :- izberi1(M, X, L).

izberi2(M, X, Y, L) :- 
    izberi1(M, X, K),
    izberi1(K, Y, L).

pretoci(L, M):-
    izberi2(L, X, Y, N),
    pretoci1(X, Y, W1, W2),
    append(N, [W1,W2], M).

poteze(V, L, [L|M)] :-
    length(M, _),
    poteze_helper(V,L,M).

poteze_helper(V, L, []) :-
    resitev(V, L).

poteze_helper(V, L1, [L2|M]) :-
    (pretoci(L1, L2); napolni(L1, L2); sprazni(L1, L2)),
    poteze_helper(V, L2, M).

% resitev(_, []) :- false.
% resitev(X, [V/_|T]) :-
%     (X = V -> true;
%     resitev(X,T)).

% napolni([], _) :- false.
% napolni([V/C|T], [C/C | T]) :- V < C.
% napolni([V/C|T], M) :- M= [C/C|T],
%     napolni(T, M).
% napolni([V/C|T], [V/C | M]) :- V = C, napolni(T, M).

% sprazni([V/C|T], [0/C | T]) :- V > 0.
% sprazni([V/C|T], [0/C | M]) :- V > 0, sprazni(T, M).
% sprazni([V/C|T], [V/C | M]) :- V = 0, sprazni(T, M). 
