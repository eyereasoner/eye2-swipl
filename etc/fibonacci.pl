% See https://en.wikipedia.org/wiki/Fibonacci_number

'https://eyereasoner.github.io/etc#fibonacci'(A, B) :-
    fibonacci(A, 0, 1, B).

fibonacci(0, A, _, A).
fibonacci(1, _, A, A).
fibonacci(A, B, C, D) :-
    A > 1,
    E is A-1,
    F is B+C,
    fibonacci(E, C, F, D).

'https://eyereasoner.github.io/etc#golden_ratio'(A, B) :-
    'https://eyereasoner.github.io/etc#fibonacci'(A, C),
    D is A+1,
    'https://eyereasoner.github.io/etc#fibonacci'(D, E),
    B is E/C.

% query
true <=
    'https://eyereasoner.github.io/etc#fibonacci'(1, _),
    'https://eyereasoner.github.io/etc#fibonacci'(2, _),
    'https://eyereasoner.github.io/etc#fibonacci'(3, _),
    'https://eyereasoner.github.io/etc#fibonacci'(4, _),
    'https://eyereasoner.github.io/etc#fibonacci'(5, _),
    'https://eyereasoner.github.io/etc#fibonacci'(91, _),
    'https://eyereasoner.github.io/etc#fibonacci'(283, _),
    'https://eyereasoner.github.io/etc#fibonacci'(3674, _).

true <=
    'https://eyereasoner.github.io/etc#golden_ratio'(1, _),
    'https://eyereasoner.github.io/etc#golden_ratio'(10, _),
    'https://eyereasoner.github.io/etc#golden_ratio'(100, _),
    'https://eyereasoner.github.io/etc#golden_ratio'(1000, _).
