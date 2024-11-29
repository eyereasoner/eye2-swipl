% See https://en.wikipedia.org/wiki/Complex_number

'https://eyereasoner.github.io/etc#sum'([[A, B], [C, D]], [E, F]) :-
    E is A+C,
    F is B+D.

'https://eyereasoner.github.io/etc#difference'([[A, B], [C, D]], [E, F]) :-
    E is A-C,
    F is B-D.

'https://eyereasoner.github.io/etc#product'([[A, B], [C, D]], [E, F]) :-
    E is A*C-B*D,
    F is A*D+B*C.

'https://eyereasoner.github.io/etc#quotient'([[A, B], [C, D]], [E, F]) :-
    E is (A*C+B*D)/(C^2+D^2),
    F is (B*C-A*D)/(C^2+D^2).

'https://eyereasoner.github.io/etc#exponentiation'([[A, B], [C, D]], [E, F]) :-
    polar([A, B], [G, H]),
    E is G^C*exp(-D*H)*cos(D*log(G)+C*H),
    F is G^C*exp(-D*H)*sin(D*log(G)+C*H).

'https://eyereasoner.github.io/etc#log'([[A, B], [C, D]], [E, F]) :-
    polar([A, B], [G, H]),
    polar([C, D], [I, J]),
    K is log(G),
    L is log(I),
    'https://eyereasoner.github.io/etc#quotient'([[L, J], [K, H]], [E, F]).

'https://eyereasoner.github.io/etc#sin'([A, B], [C, D]) :-
    C is sin(A)*(exp(B)+exp(-B))/2,
    D is cos(A)*(exp(B)-exp(-B))/2.

'https://eyereasoner.github.io/etc#cos'([A, B], [C, D]) :-
    C is cos(A)*(exp(B)+exp(-B))/2,
    D is -sin(A)*(exp(B)-exp(-B))/2.

'https://eyereasoner.github.io/etc#tan'(A, B) :-
    'https://eyereasoner.github.io/etc#sin'(A, C),
    'https://eyereasoner.github.io/etc#cos'(A, D),
    'https://eyereasoner.github.io/etc#quotient'([C, D], B).

'https://eyereasoner.github.io/etc#asin'([A, B], [C, D]) :-
    E is (sqrt((1+A)^2+B^2)-sqrt((1-A)^2+B^2))/2,
    F is (sqrt((1+A)^2+B^2)+sqrt((1-A)^2+B^2))/2,
    C is asin(E),
    D is log(F+sqrt(F^2-1)).

'https://eyereasoner.github.io/etc#acos'([A, B], [C, D]) :-
    E is (sqrt((1+A)^2+B^2)-sqrt((1-A)^2+B^2))/2,
    F is (sqrt((1+A)^2+B^2)+sqrt((1-A)^2+B^2))/2,
    C is acos(E),
    D is -log(F+sqrt(F^2-1)).

'https://eyereasoner.github.io/etc#atan'(A, B) :-
    'https://eyereasoner.github.io/etc#difference'([[0, 1], A], C),
    'https://eyereasoner.github.io/etc#sum'([[0, 1], A], D),
    'https://eyereasoner.github.io/etc#quotient'([C, D], E),
    X is 0+e,
    'https://eyereasoner.github.io/etc#log'([[X, 0], E], F),
    'https://eyereasoner.github.io/etc#quotient'([F, [0, 2]], B).

polar([A, B], [C, D]) :-
    C is sqrt(A^2+B^2),
    E is acos(abs(A)/C),
    angular(A, B, E, D).

angular(A, B, C, D) :-
    A >= 0,
    B >= 0,
    D = C.
angular(A, B, C, D) :-
    A < 0,
    B >= 0,
    D is pi-C.
angular(A, B, C, D) :-
    A < 0,
    B < 0,
    D is C+pi.
angular(A, B, C, D) :-
    A >= 0,
    B < 0,
    D is 2*pi-C.

% query
'https://eyereasoner.github.io/etc#quotient'([[1, 0], [0, 1]], _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#exponentiation'([[-1, 0], [0.5, 0]], _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#exponentiation'([[e, 0], [0, pi]], _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#log'([[e, 0], [-1, 0]], _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#log'([[0, 1], [0, 1]], _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#sin'([1.570796326794897, 1.316957896924817], _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#cos'([0, -1.316957896924817], _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#tan'([1.338972522294493, 0.4023594781085251], _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#asin'([2, 0], _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#acos'([2, 0], _ANSWER) :+ true.
'https://eyereasoner.github.io/etc#atan'([1, 2], _ANSWER) :+ true.
