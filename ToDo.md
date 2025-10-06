# TODO

This files is a to do file that is for the week by week work

## 4/16/25

Start organizing questions based on the different types of questions - next week

Recall

Modus Pones

Modues Tollens

Look at the logic bench article to categorize questions.

Find 4 from the logic bench article.

2 Parts:

1: logic bench anaylsis
2: Eastern Chatbot

Give one example per type!



## 4/16/25 - Work

### Recall
Context:
oh(dancikg, computer_science, science_257, m, 1500, 1700).
oh(dancikg, computer_science, science_257, r, 1300, 1400).
oh(dancikg, computer_science, science_257, r, 1530, 1630).
oh(dancikg, computer_science, science_257, t, 1300, 1400).

Question: When is Dr. Dancik office hours?
Answer: Dr. Dancik has office hours Monday at 3pm - 5pm, tuesday 1pm - 2pm, and thursday 1pm - 2pm and 3:30pm to - 4:30pm.

Prolog: 
oh(dancikg, computer_science, science_257, D, E, F).

or

oh(dancikg, B, C, D, E, F).


### Modus Pones:

#### Logic Bench:

"context": "If someone is unwell, then they have a cough.",

"question": "If nina is unwell, does this mean that she has a cough?",
"answer": "yes"

#### Eastern Question:

"context": "If a professor has office hours at a given time in a building, then they are in that building at that time."

"question": "Dr. Dancik has office hours on Tuesday at 13:00 in Science_257; is he in the building at that time?"
"answer": "yes"

#### In Prolog:

%Check if Time is within Start and End time
within_time(Time, Start, End) :-
    Time >= Start,
    Time =< End.

% A professor is in the building if they have office hours during that time
in_building_at(Prof, Building, Day, Time) :-
    oh(Prof, _, Building, Day, Start, End),
    within_time(Time, Start, End).
  
in_building_at(danickg, science_257, t, 1300).

### Modus Tollens:

#### Logic Bench:

"context": "If someone is going on a holiday, then they have to book their tickets.",

"question": "If he doesn't have to book his tickets, does this imply that john isn't going on a holiday?",
"answer": "yes"

#### Eastern Question:

"context": "If a professor holds office hours or teaches a course in a building at a given time, then they are in that building at that time."

"question": "Professor Yankov is not in Science_162 on Friday at 11:00. Does that mean he has no office hours or classes in Science_162 at that time?"
"answer": "yes".

#### In Prolog:

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

in_building_at(yankovc, science_162, f, 1100) 

### Disjunctive Syllogism:

#### Logic Bench:

"context": "We know that atleast one of the following is true (1) they can watch a movie and (2) they can play a game. Note that we do not know which ones of (1) and (2) are true. It might be the case that only (1) is true, or only (2) is true or both are true.",

"question": "If jill can't watch a movie, does this entail that She can play a game?"
"answer": "yes"

#### Eastern Question:

"context": "Dancik or Anderson is in the science building at 2pm on tuesday"

"question": "Anderson is not in the science building at 2pm, does this mean Dancik is in the science building at 2pm on tuesday?"
"answer": "yes".

#### In Prolog:
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


### Hypothetical Syllogism:
#### Logic Bench:

"context": "If they do not practice regularly, then they will not improve their skills. If they will not improve their skills, then they will not be successful.",

"question": "If jill does not practice regularly, does this entail that she will not be successful?",
"answer": "yes"

#### Eastern Question:

"context": "If a professor has office hours at a given time, then they are in that building at that time. If a professor is in a building at a given time, then they are available for meetings. Therefore, if a professor has office hours, they are avalaible for meetings."

"question": "Given Dr. Dancik has office hours at 1pm in Science on tuesday, is he available for a meeting at that time?",
"answer": "yes".

#### In Prolog:

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
%?- hypothetical_syllogism(dancikg, science, t, 1300).

## 4/23/2025
Seperate out room and building

Fix disjunctive and hypothetical syllogism eastern question prolog statements. Make them not recall

couple(5-6) of eastern questions for each type mix of yes and no

## 10/6/2025
Create 5 different Eastern based questions given the different webscraped files. Categories include Modus tollens, recall, and count

### Modus Tollens( If P implies Q and Q is not true then P is not true(P->Q, not Q, then not P))
1. Given the following dataset about EasternCT course times, we know if a class is labeled as online then it has no physical room. Look at BIS 205 and determine if the class is online?

2. Given the following dataset about EasternCT faculty office hours, we know that a professor is available to meet if they have office hours. Given it is 8:15am, determine if Dr. Dancik is available to meet?

3. Given the following dataset about EasternCT faculty contact info, we know that if we email a professor at there email they will get back to us. Given the email aaidoo@easternct.edu will Anthony aidoo email us back?

4. Looking at the following dataset below about EasternCT course times, we know if a class is listed to take place on "M" it will take place on monday. Looking at HON 361 sec 1, determine if the class will take place on monday.

5. Looking at the following dataset below about EasternCT faculty office hours, we know that a professor is available to meet if they have office hours. Given it is 9:00pm, determine if Dr. Connolly is avaiable to meet?   

### Recall
1. Given the following dataset about EasternCT course times, what time are all the days and times for all the sections of BIS 205?

2. Given the following dataset about EasternCT faculty office hours, list all computer science professors that have office hours on monday.

3. Given the following dataset about EasternCT faculty contact info, what is the email address of Johnathan atkinson?

4. Looking at the following dataset below about EasternCT course times, what professor teaches HON 375 Sec 1?

5. Looking at the following dataset below about EasternCT faculty office hours, name the computer science professors that have an office on the 200 level of the science building?

### Count
1. Given the following dataset about EasternCT course times, count the number of sections of BIS 205?

2. Given the following dataset about EasternCT faculty office hours, count the number of Biology professors that have office hours on wednesday.

3. Given the following dataset about EasternCT faculty contact info, count the number of lectures in that are in the computer science department.

4. Looking at the following dataset below about EasternCT course times, count the number of professors that teach an HON course.

5. Looking at the following dataset below about EasternCT faculty office hours, count the number of Mathematical Sciences professors that have an office on th 100 level of the science building?