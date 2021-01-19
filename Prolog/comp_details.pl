computerDetails :- readDetails(Model, Speed, Ram),
                    \+ Model = exit,
                     saveDetails(Model, Speed, Ram),
                     computerDetails.

readDetails(Model, Speed, Ram) :-
    nl,write('Enter the Computer Model: '), read(Model),
    nl,write('Enter the Computer speed in HZ: '), read(Speed),
    nl,write('Enter the RAM size in GB: '), read(Ram).

saveDetails(Model, Speed, Ram):-
    assertz(computerDetails(Model, Speed, Ram)).



