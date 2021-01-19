%	Examples for group 1
% writing class joint task problem solving
% predicate: works_with(ClassMember1, ClassMember2)
% read and store the data on class members who work with each other.


readData :- getDetails(ClassMember1, ClassMember2), \+ ClassMember1 = quit,
            saveDetails(ClassMember1, ClassMember2), readData.

getDetails(ClassMember1, ClassMember2):-
		nl,write('Enter the first member of the class: '),
		read(ClassMember1),
		nl,write('Enter the second member of the class: '),
        read(ClassMember2).
saveDetails(ClassMember1, ClassMember2):-
    assertz(works_with(ClassMember1, ClassMember2)).

