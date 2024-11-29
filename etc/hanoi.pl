% Towers of Hanoi
% See https://en.wikipedia.org/wiki/Tower_of_Hanoi

'https://eyereasoner.github.io/etc#move'(0, [_, _, _]) :-
    !.
'https://eyereasoner.github.io/etc#move'(N, [A, B, C]) :-
    M is N-1,
    'https://eyereasoner.github.io/etc#move'(M, [A, C, B]),
    'https://eyereasoner.github.io/etc#move'(M, [C, B, A]).

% query
'https://eyereasoner.github.io/etc#move'(14, [left, centre, right]) :+ true.
