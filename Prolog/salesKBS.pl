unqualified:- \+ computer('IBM'), write('Prospect must have an IBM computer'), nl.
unqualified:- revenues(X), X < 30,
write('Prospect is unlikely to buy IDMS with revenues
under Ksh30 million'), nl.

%%Benefits predicates
obf('IDMS/R', development, 'IDMS/R separates programs from data, simplifying development.').
obf('IDMS/R', information, 'IDMS/R maintains corporate information for shared access.').
obf('IDMS/R', production, 'IDMS/R allows finely tuned data access for optimal performance.').
obf('ADS', development, 'ADS automates many programming twrites thus increasing productivity.').
obf('ADS', production, 'ADS generates high performance compiled code.').
obf('OLQ', development, 'OLQ allows easy validation of the database during development.').
obf('OLQ', information, 'OLQ lets end users access corporate data easily.').
obf('OLE', information, 'OLE lets users get information with English language queries.').

%%Situational analysis
unsuitable('OLE'):- operating_system(dos).
unsuitable('OLE'):- machine_size(small).

%%Competitive analysis
prod_dif('IDMS/R', 'ADR', 'IDMS/R allows specification of linked lists for high performance.').
prod_dif('IDMS/R', 'IBM', 'IDMS/R allows specification of indexed lists for easy access.').
prod_dif('ADS', 'ADR', 'ADS generates high performance code.').
prod_dif('ADS', 'IBM', 'ADS is very easy to use.').

%%Miscellaneous Advice
advice:- \+ objective(production), tp_monitor('CICS'), online_applications(many),
nl, write('Since there are many existing online applications and'), nl,
write('performance isn\'t an issue suggest UCF instead of DC'), nl.
advice:- industry(government), government(state), nl,
		write('If it\'s the state government, make sure you work'), nl,
		write(' with our state government office on the account'), nl.
advice:-competition('ADR'), revenues(X), X < 100, friendly_account(no), nl,
write(' Market database technical issues'), nl, write(' Show simple solutions in
shirt sleeve sessions' ), nl.

%%User Queries
competition(X):- write('Who is the competition? [ADR, IBM, other]'),read(X).
computer(X):- write('What type of computer are they using? [IBM, other]'),read(X).
friendly_account(X):- write('Has the account been friendly? [yes, no]'),read(X).
government(X):- write('What type of government account is it? [state, state, local]'),read(X).
industry(X):- write('What industry segment? [manufacturing, government, other]'),read(X).
machine_size(X):- write('What size machine are they using? [small, medium, large]'),read(X).
objective(X):- write('What is the main objective for looking at DBMS? [development, information, production]'), read(X).
online_applications(X):- write('Are there many existing online applications? [many, few]'),read(X).
operating_system(X):- write('What operation system are they using? [OS, DOS]'),read(X).
revenues(X):- write('What are their revenues (in millions)?'),read(X).
tp_monitor(X):- write('What is their current TP monitor? [CICS, other]'),read(X).

%%Inference Engine
recommend:- qualify, objective_products, product_differentiation, other_advice, !.
recommend.
qualify:- unqualified, !, fail.
qualify.

objective_products:- objective(X), write('The following products meet objective'),
write(X), nl, nl, obf(Product, X, Benefit), \+ unsuitable(Product), write(Product:Benefit),nl,
fail.
objective_products.

%%The product differentiation table is similarly used.
product_differentiation:- competition(X), prod_dif(_,X,_), write('Since the competition is '),
write(X), write(', stress:'), nl, nl, product_diff(X), !.
product_differentiation.
product_diff(X):- prod_dif(Product, X, Advice), tab(5), write(Advice), nl, fail.
product_diff(_).

%%Other advice rules are all tried.
other_advice:- advice, fail.
other_advice.
