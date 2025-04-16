%What time does this prof have OH?
hasoh(A, D, E, F) :- oh(A, _, _, D, E, F).
%or
%oh(profx, B, C, D, E, F).

%What are is this prof’s email, phone, office location, etc.?
%oh(profx, B, C, D, E, F, G)

%What profs are in this building? Is prof x in this building at y time? Is dancik in goddard at 12? Dancik is not in goddard 12, so false.
inbld(A, C) :- oh(A, _, C, _, _, _).
%inbld(A,insertblding) returns true or false

%Check if Time is within Start and End time
within_time(Time, Start, End) :-
    Time >= Start,
    Time =< End.

% A professor is in the building if they have office hours during that time
in_building_at(Prof, Building, Day, Time) :-
    oh(Prof, _, Building, Day, Start, End),
    within_time(Time, Start, End).

% A professor is in the building if they teach a course there during that time
in_building_at(Prof, Building, Day, Time) :-
    courses(Prof, _, _, Day, Start, End, Building),
    within_time(Time, Start, End).

% How many profs are in this department?
count_contacts(Count, X) :-

    findall(_, contact(_, _, _, X, _, _), Results),

    length(Results, Count).

% count_contacts(Count,computer_science).

