% Access control policy example

'https://eyereasoner.github.io/etc#policy'('https://eyereasoner.github.io/etc#test1', 'https://eyereasoner.github.io/etc#PolicyX').
'https://eyereasoner.github.io/etc#has'('https://eyereasoner.github.io/etc#test1', 'https://eyereasoner.github.io/etc#A').
'https://eyereasoner.github.io/etc#has'('https://eyereasoner.github.io/etc#test1', 'https://eyereasoner.github.io/etc#B').
'https://eyereasoner.github.io/etc#has'('https://eyereasoner.github.io/etc#test1', 'https://eyereasoner.github.io/etc#C').
'https://eyereasoner.github.io/etc#Policy'('https://eyereasoner.github.io/etc#PolicyX').
'https://eyereasoner.github.io/etc#allOf'('https://eyereasoner.github.io/etc#PolicyX', 'https://eyereasoner.github.io/etc#A').
'https://eyereasoner.github.io/etc#allOf'('https://eyereasoner.github.io/etc#PolicyX', 'https://eyereasoner.github.io/etc#B').
'https://eyereasoner.github.io/etc#anyOf'('https://eyereasoner.github.io/etc#PolicyX', 'https://eyereasoner.github.io/etc#C').
'https://eyereasoner.github.io/etc#noneOf'('https://eyereasoner.github.io/etc#PolicyX', 'https://eyereasoner.github.io/etc#D').

'https://eyereasoner.github.io/etc#pass'(A, 'https://eyereasoner.github.io/etc#allOfTest') :-
    'https://eyereasoner.github.io/etc#policy'(B, A),
    'https://eyereasoner.github.io/etc#Policy'(A),
    forall(
        'https://eyereasoner.github.io/etc#allOf'(A, C),
        'https://eyereasoner.github.io/etc#has'(B, C)
    ).

'https://eyereasoner.github.io/etc#pass'(A, 'https://eyereasoner.github.io/etc#anyOfTest') :-
    'https://eyereasoner.github.io/etc#policy'(B, A),
    'https://eyereasoner.github.io/etc#Policy'(A),
    findall(C,
        (
            'https://eyereasoner.github.io/etc#anyOf'(A, C),
            'https://eyereasoner.github.io/etc#has'(B, C)
        ),
        D
    ),
    length(D, E),
    E \= 0.

'https://eyereasoner.github.io/etc#pass'(A, 'https://eyereasoner.github.io/etc#noneOfTest') :-
    'https://eyereasoner.github.io/etc#policy'(B, A),
     'https://eyereasoner.github.io/etc#Policy'(A),
    findall(C,
        (
            'https://eyereasoner.github.io/etc#noneOf'(A, C),
            'https://eyereasoner.github.io/etc#has'(B, C)
        ),
        D
    ),
    length(D, 0).

% query
true ::-
    'https://eyereasoner.github.io/etc#Policy'(A),
    'https://eyereasoner.github.io/etc#pass'(A, 'https://eyereasoner.github.io/etc#allOfTest'),
    'https://eyereasoner.github.io/etc#pass'(A, 'https://eyereasoner.github.io/etc#anyOfTest'),
    'https://eyereasoner.github.io/etc#pass'(A, 'https://eyereasoner.github.io/etc#noneOfTest').
