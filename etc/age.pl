% age checker

% person data
'https://eyereasoner.github.io/etc#birthDay'('https://eyereasoner.github.io/etc#patH', [1944, 8, 21]).

% is the age of a person above some years?
'https://eyereasoner.github.io/etc#ageAbove'(S, A) :-
    'https://eyereasoner.github.io/etc#birthDay'(S, [Yb, Mb, Db]),
    get_time(T),
    stamp_date_time(T, date(Yl, Ml, Dl, _, _, _, _, _, _), 0),
    Yl >= Yb+A,
    Ml >= Mb,
    Dl >= Db.

% query
'https://eyereasoner.github.io/etc#ageAbove'(_S, 80) :+ true.
