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

"context": "Dr. Wilde holds office hours either on Monday at 13:00 or on Tuesday at 11:00."

"question": "Dr. Wilde does not hold office hours on Monday at 13:00. Does that mean she holds office hours on Tuesday at 11:00?"
"answer": "yes".

#### In Prolog:
oh(wildea, _, communications_204, m, 1300, 1330).
oh(wildea, _, communications_204, t, 1100, 1300).

or

oh(wildea, B, C, D, E, F, G).

### Hypothetical Syllogism:
#### Logic Bench:

"context": "If they do not practice regularly, then they will not improve their skills. If they will not improve their skills, then they will not be successful.",

"question": "If jill does not practice regularly, does this entail that she will not be successful?",
"answer": "yes"

#### Eastern Question:

"context": "If a professor teaches a class in a building at a given time, then they are in that building at that time. If a professor is in a building at a given time, then they can be consulted by students at that time."

"question": "Given Prof. Westberry teaches SOC310 in Science_116 on Monday at 19:00, can he be consulted at that time?",
"answer": "yes".

#### In Prolog:

courses(westberryb, soc310, 1, m, 1900, 2145, science_116),
in_building_at(westberryb, science_116, m, 1900).