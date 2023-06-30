fib([]).
fib([0]).
fib([1, 0]).
fib([X1, X2, X3 | T]) :-
    fib([X2, X3 | T]),
    X1 is X2 + X3.