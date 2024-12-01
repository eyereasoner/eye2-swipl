% Takeuchi function
% See https://en.wikipedia.org/wiki/Tak_(function)

'https://eyereasoner.github.io/etc#tak'([X, Y, Z], Z) :-
    X =< Y,
    !.
'https://eyereasoner.github.io/etc#tak'([X, Y, Z], A) :-
    X1 is X-1,
    'https://eyereasoner.github.io/etc#tak'([X1, Y, Z], A1),
    Y1 is Y-1,
    'https://eyereasoner.github.io/etc#tak'([Y1, Z, X], A2),
    Z1 is Z-1,
    'https://eyereasoner.github.io/etc#tak'([Z1, X, Y], A3),
    'https://eyereasoner.github.io/etc#tak'([A1, A2, A3], A).

% query
true ::-
    'https://eyereasoner.github.io/etc#tak'([34, 13, 8], _).
