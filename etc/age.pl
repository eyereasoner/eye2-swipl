% age checker

% person data
'urn:example:birthDay'('urn:example:patH', [1944, 8, 21]).

% is the age of a person above some years?
'urn:example:ageAbove'(S, A) :-
    'urn:example:birthDay'(S, [Yb, Mb, Db]),
    get_time(T),
    stamp_date_time(T, date(Yl, Ml, Dl, _, _, _, _, _, _), 0),
    Yl >= Yb+A,
    Ml >= Mb,
    Dl >= Db.

% query
'urn:example:ageAbove'(_S, 80) :+ true.
