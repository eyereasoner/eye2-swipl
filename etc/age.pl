% age checker

% person data
'https://eyereasoner.github.io/etc#birthDay'('https://eyereasoner.github.io/etc#patH', [1944, 8, 21]).

% is the age of a person above some years?
'https://eyereasoner.github.io/etc#ageAbove'(S, A) :-
    'https://eyereasoner.github.io/etc#birthDay'(S, [Yb, Mb, Db]),
    Ya is Yb+A,
    date_time_stamp(date(Ya, Mb, Db, 0, 0, 0, 0, -, -), Ta),
    get_time(T),
    Ta < T.

% query
true ::-
    'https://eyereasoner.github.io/etc#ageAbove'(_, 80).
