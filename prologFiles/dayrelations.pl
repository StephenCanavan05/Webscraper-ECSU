% Maps compound day codes to individual days
single_day(mwf, [m, w, f]).
single_day(mw, [m, w]).
single_day(tr, [t, r]).
single_day(mtwrf, [m, t, w, r, f]).
single_day(mwr, [m, w, r]).
single_day(mt, [m, t]).
single_day(twr, [t, w, r]).
single_day(m, [m]).
single_day(t, [t]).
single_day(w, [w]).
single_day(r, [r]).
single_day(f, [f]).

%Office hours day infrences
% If the Day is already a single atom (e.g., m), just return the fact as-is
oh_expanded(Prof, Dept, Building, Day, Start, End) :-
    oh(Prof, Dept, Building, Day, Start, End),
    atom_chars(Day, [SingleChar]),
    member(SingleChar, [m, t, w, r, f]).

% If Day is a compound like mwf, break it up
oh_expanded(Prof, Dept, Building, SingleDay, Start, End) :-
    oh(Prof, Dept, Building, CompoundDay, Start, End),
    single_day(CompoundDay, Days),
    member(SingleDay, Days).

%Course infrences
%% Single-day course entry
course_expanded(Prof, Course, Sec, Day, Start, End, Building) :-
    courses(Prof, Course, Sec, Day, Start, End, Building),
    atom_chars(Day, [SingleChar]),
    member(SingleChar, [m, t, w, r, f]).

% Multi-day course entry
course_expanded(Prof, Course, Sec, SingleDay, Start, End, Building) :-
    courses(Prof, Course, Sec, CompoundDay, Start, End, Building),
    single_day(CompoundDay, Days),
    member(SingleDay, Days).
