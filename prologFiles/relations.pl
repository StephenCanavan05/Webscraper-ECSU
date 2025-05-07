%What time does this prof have OH?
hasoh(A, D, E, F) :- oh(A, _, _, _, D, E, F).
%or
%oh(profx, B, C, D, E, F).

%What are is this prof’s email, phone, office location, etc.?
%oh(profx, B, C, D, E, F, G)

%What profs are in this building? Is prof x in this building at y time? Is dancik in goddard at 12? Dancik is not in goddard 12, so false.
inbld(A, C) :- oh(A, _, C, _,  _, _, _).
%inbld(A,insertblding) returns true or false

%Check if Time is within Start and End time
within_time(Time, Start, End) :-
    Time >= Start,
    Time =< End.

% A professor is in the building if they have office hours during that time
in_building_at(Prof, Building, Day, Time) :-
    oh(Prof, _, Building, _, Day, Start, End),
    within_time(Time, Start, End).

% A professor is in the building if they teach a course there during that time
in_building_at(Prof, Building, Day, Time) :-
    courses(Prof, _, _, Day, Start, End, Building, _),
    within_time(Time, Start, End).

% How many profs are in this department?
count_contacts(Count, X) :-

    findall(_, contact(_, _, _, X, _, _), Results),

    length(Results, Count).

% count_contacts(Count,computer_science).

% Either one of the two professors is in the building at the given time
either_in_building(Prof1, Prof2, Building, Day, Time) :-
    in_building_at(Prof1, Building, Day, Time);
    in_building_at(Prof2, Building, Day, Time).

% Disjunctive syllogism: If either P1 or P2 is in building and P1 is not, then P2 is.
disjunctive_syllogism(P1, P2, Bldg, Day, Time) :-
    either_in_building(P1, P2, Bldg, Day, Time),
    \+ in_building_at(P1, Bldg, Day, Time),
    in_building_at(P2, Bldg, Day, Time).
%Test Query
%disjunctive_syllogism(andersond, dancikg, science, t, 1400)

available(Prof, Day, Time) :-
    oh(Prof, _, _, _, Day, Start, End),
    within_time(Time, Start, End).


can_meet(Prof, Day, Time) :-
    available(Prof, Day, Time).

% If a professor is in the building at that time, they are available
implies_in_building_then_available(Prof, Building, Day, Time) :-
    in_building_at(Prof, Building, Day, Time) ->
    available(Prof, Day, Time).

% If a professor is available at a given time, you can meet them
implies_available_then_meetable(Prof, Day, Time) :-
    available(Prof, Day, Time) ->
    can_meet(Prof, Day, Time).

% Therefore, if a professor is in the building at that time, you can meet them
hypothetical_syllogism(Prof, Building, Day, Time) :-
    in_building_at(Prof, Building, Day, Time),
    implies_in_building_then_available(Prof, Building, Day, Time),
    implies_available_then_meetable(Prof, Day, Time),
    can_meet(Prof, Day, Time).
%Test query
%?- hypothetical_syllogism(dancikg, science, t, 1400).


p2_must_be_true(Prof1, Prof2, Building, Day, Time) :- 
    either_in_building(Prof1, Prof2, Building, Day, Time),
    \+ in_building_at(Prof1, Building, Day, Time).
%test case p2_must_be_true(andersond, dancikg, science, t, 1400): result true
%test case p2_must_be_true(tasneems, dancikg, science, t, 1400): result false
