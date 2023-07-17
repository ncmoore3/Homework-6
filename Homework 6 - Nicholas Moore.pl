isSet([]).
isSet([H|T]) :- \+ (member(H, T)), isSet(T).

subset([], _).
subset([H|T], S) :- member(H, S), subset(T, S).

union(A, [], A).
union([], B, B).
union([H|T], B, C) :- member(H, B), union(T, B, C).
union([H|T], B, [H|C]) :- \+ (member(H, B)), union(T, B, C).

intersection(_, [], []).
intersection([], _, []).
intersection([H|T], B, C) :- \+ (member(H, B)), intersection(T, B, C).
intersection([H|T], B, [H|C]) :- member(H, B), intersection(T, B, C).

tally(_, [], 0).
tally(H, [H|T], N) :- tally(H, T, X), N is X + 1.
tally(E, [H|T], N) :- E \= H, tally(E,T,N).

and(A, B) :- A, B.
or(A, B) :- A; B.
nand(A, B) :- \+ (and(A, B)).
nor(A, B) :- \+ (or(A, B)).
xor(A, B) :- or(A,B), nand(A, B).
equ(A, B) :- or(and(A, B), nor(A, B)).

gcd(X, 0, X).
gcd(X, Y, G) :- Z is X mod Y,  gcd(Y, Z, G).

flatten([], []).
flatten([H|T], B) :- is_list(H) -> flatten(H,C), flatten(T,D), append(C, D, B); flatten(T, D), append([H], D, B).

