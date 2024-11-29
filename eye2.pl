% ------------------
% eye2 -- Jos De Roo
% ------------------
%
% See https://github.com/eyereasoner/eye2
%

:- op(1150,xfx,-:).

:- dynamic((-:)/2).
:- dynamic(answer/1).
:- dynamic(brake/0).
:- dynamic(ether/3).

term_expansion((Head :- Body),(Head :- Body)).

version_info('eye2 v0.0.1 (2024-11-29)').

% main goal
main :-
    nb_setval(closure,0),
    nb_setval(limit,-1),
    nb_setval(fm,0),
    nb_setval(mf,0),
    (   (_ -: _)
    ->  format(":- op(1150,xfx,-:).~n~n",[])
    ;   version_info(Version),
        format("~w~n",[Version])
    ),
    run,
    nb_getval(fm,Fm),
    (   Fm = 0
    ->  true
    ;   format(user_error,"*** fm=~w~n",[Fm])
    ),
    nb_getval(mf,Mf),
    (   Mf = 0
    ->  true
    ;   format(user_error,"*** mf=~w~n",[Mf])
    ),
    halt(0).

% run eye2 abstract machine
%
% 1/ select rule P -: C
% 2/ prove P and if it fails backtrack to 1/
% 3/ if C = true assert answer(P)
%    else if C = false stop with return code 2
%    else if ~C assert C, retract brake
% 4/ backtrack to 2/ and if it fails go to 5/
% 5/ if brake
%       if not stable start again at 1/
%       else output all answers as P -: true and stop
%    else assert brake and start again at 1/
%
run :-
    (   (Prem -: Conc),     % 1/
        copy_term((Prem -: Conc),Rule,_),
        Prem,               % 2/
        (   Conc = true     % 3/
        ->  (   \+answer(Prem)
            ->  assertz(answer(Prem))
            ;   true
            )
        ;   (   Conc = false
            ->  format("% inference fuse, return code 2~n",[]),
                portray_clause((Prem -: false)),
                halt(2)
            ;   (   term_variables(Conc,[])
                ->  Concl = Conc
                ;   Concl = (true -: Conc)
                ),
                \+Concl,
                astep(Concl),
                assertz(ether(Rule,Prem,Concl)),
                retract(brake)
            )
        ),
        fail                % 4/
    ;   (   brake           % 5/
        ->  (   nb_getval(closure,Closure),
                nb_getval(limit,Limit),
                Closure < Limit,
                NewClosure is Closure+1,
                nb_setval(closure,NewClosure),
                run
            ;   answer(Prem),
                portray_clause((Prem -: true)),
                fail
            ;   (   ether(_,_,_)
                ->  format("~n%~n% Explain the reasoning~n%~n~n",[]),
                    ether(Rule,Prem,Conc),
                    portray_clause(ether(Rule,Prem,Conc)),
                    fail
                ;   true
                )
            ;   true
            )
        ;   assertz(brake),
            run
        )
    ).

% assert new step
astep((B,C)) :-
    astep(B),
    astep(C).
astep(A) :-
    (   \+A
    ->  assertz(A)
    ;   true
    ).

% stable(+Level)
%   fail if the deductive closure at Level is not yet stable
stable(Level) :-
    nb_getval(limit,Limit),
    (   Limit < Level
    ->  nb_setval(limit,Level)
    ;   true
    ),
    nb_getval(closure,Closure),
    Level =< Closure.

% debugging tools
fm(A) :-
    write(user_error,'*** '),
    portray_clause(user_error,A),
    nb_getval(fm,B),
    C is B+1,
    nb_setval(fm,C).

mf(A) :-
    forall(
        catch(A,_,fail),
        (   write(user_error,'*** '),
            portray_clause(user_error,A),
            nb_getval(mf,B),
            C is B+1,
            nb_setval(mf,C)
        )
    ).
