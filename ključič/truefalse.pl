eval(true, true).
eval(false, false).
eval(and(P, Q), B) :- eval(P, true), eval(Q, B).
eval(and(P, _Q), false) :- eval(P, false).
eval(or(P,Q), B) :- eval(P, false), eval(Q, B).
eval(or(P,_Q), true) :- eval(P, true).
