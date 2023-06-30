fib([]).  % Prvi primer: Prazen seznam je seznam Fibonaccijevih števil v padajočem vrstnem redu.

fib([X]).  % Drugi primer: Seznam z enim elementom je seznam Fibonaccijevih števil v padajočem vrstnem redu.

fib([X,Y|Rest]) :-  % Tretji primer: Seznam z vsaj dvema elementoma je seznam Fibonaccijevih števil v padajočem vrstnem redu, če
  X > Y,  % prvi element X je večji od drugega elementa Y in
  fib([Y|Rest]),  % preostanek seznama (brez prvega elementa) je seznam Fibonaccijevih števil v padajočem vrstnem redu.
  X is Y + Rest.  % Poleg tega mora veljati, da je prvi element X enak vsoti drugega elementa Y in preostanka seznama (brez prvega elementa).
