% See https://en.wikipedia.org/wiki/Padovan_sequence

'https://eyereasoner.github.io/etc#padovan'(A, B) :-
    padovan(A, 0, 1, 1, B).

padovan(0, A, _, _, A).
padovan(1, _, A, _, A).
padovan(2, _, _, A, A).
padovan(A, B, C, D, E) :-
    A > 2,
    F is A-1,
    G is B+C,
    padovan(F, C, D, G, E).

'https://eyereasoner.github.io/etc#plastic_ratio'(A, B) :-
    'https://eyereasoner.github.io/etc#padovan'(A, C),
    D is A+1,
    'https://eyereasoner.github.io/etc#padovan'(D, E),
    B is E/C.

% query
'https://eyereasoner.github.io/etc#padovan'(1, _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#padovan'(2, _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#padovan'(3, _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#padovan'(4, _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#padovan'(5, _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#padovan'(91, _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#padovan'(283, _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#padovan'(3674, _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#plastic_ratio'(1, _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#plastic_ratio'(10, _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#plastic_ratio'(100, _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#plastic_ratio'(1000, _ANSWER) :+ true.