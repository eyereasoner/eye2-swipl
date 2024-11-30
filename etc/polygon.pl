% Calculating the area of a polygon

'https://eyereasoner.github.io/etc#area'([_], 0).
'https://eyereasoner.github.io/etc#area'([[A, B], [C, D]|E], F) :-
    'https://eyereasoner.github.io/etc#area'([[C, D]|E], G),
    F is (A*D-B*C)/2+G.

% query
true <=
    'https://eyereasoner.github.io/etc#area'([[3, 2], [6, 2], [7, 6], [4, 6], [5, 5], [5, 3], [3, 2]], _).
