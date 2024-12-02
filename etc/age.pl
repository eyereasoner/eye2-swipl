% age checker

% person data
'urn:example:birthDay'('urn:example:patH', [1944, 8, 21]).

% is the age of a person above some years?
'urn:example:ageAbove'(S, A) :-
    'urn:example:birthDay'(S, [Yb, Mb, Db]),
    Ya is Yb+A,
    date_time_stamp(date(Ya, Mb, Db, 0, 0, 0, 0, -, -), Ta),
    get_time(T),
    Ta < T.

% query
true ?-
    'urn:example:ageAbove'(_, 80).
