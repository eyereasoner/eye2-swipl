% Peano arithmetic
% See https://en.wikipedia.org/wiki/Peano_axioms

% add
'https://eyereasoner.github.io/etc#add'(A, 0, A).
'https://eyereasoner.github.io/etc#add'(A, s(B), s(C)) :-
    'https://eyereasoner.github.io/etc#add'(A, B, C).

% multiply
'https://eyereasoner.github.io/etc#multiply'(_, 0, 0).
'https://eyereasoner.github.io/etc#multiply'(A, s(B), C) :-
    'https://eyereasoner.github.io/etc#multiply'(A, B, D),
    'https://eyereasoner.github.io/etc#add'(A, D, C).

% factorial
'https://eyereasoner.github.io/etc#factorial'(A, B) :-
    fac(A, s(0), B).

fac(0, A, A).
fac(s(A), B, C) :-
    'https://eyereasoner.github.io/etc#multiply'(B, s(A), D),
    fac(A, D, C).

% query
'https://eyereasoner.github.io/etc#multiply'(s(0), s(s(0)), A),
'https://eyereasoner.github.io/etc#add'(A, s(s(s(0))), B),
'https://eyereasoner.github.io/etc#factorial'(B, _C) :+
    true.
