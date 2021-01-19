% Create a World Object, with our world inside
world = vrworld('metrocityc.wrl');

% Open and View the World
open(world);

% to view it internally and not from the browser
fig = view(world, '-internal');
vrdrawnow;

get(world)

%getting the nodes of the world
nodes(world)
boy = vrnode(world, 'boy');
girl = vrnode(world, 'girl');
man = vrnode(world, 'dad');

%getting the fields for rotation and translation
fields(man);
fields(boy);

%values for walking the boy to the boy car
boy_z1 = 3.6:6.2;
boy_x1 = -1.6 + zeros(size(boy_z1));
boy_y1 = 0.8 + zeros(size(boy_z1));

%values for walking the boy to the girl car
girl_z1 = 4.2:6.2;
girl_x1 = -1.2 + zeros(size(girl_z1));
girl_y1 = 1 + zeros(size(girl_z1));

%values for walking the boy to the man car
man_z1 = 4.2:6.8;
man_x1 = -1.6 + zeros(size(man_z1));
man_y1 = 0.8 + zeros(size(man_z1));

%walking to the car
for i=1:length(boy_z1)  
    boy.translation = [boy_x1(i) boy_y1(i) boy_z1(i)];
    man.translation = [man_x1(i) man_y1(i) man_z1(i)];
    girl.translation = [girl_x1(i) girl_y1(i) girl_z1(i)];
    disp(i);
    vrdrawnow;
    pause(0.1);
end
boy_x2 = -1.6:0.4;
boy_y2 = 0.8 + zeros(size(boy_x2));
boy_z2 = 6.2 + zeros(size(boy_x2));

girl_x2 = -1.6:0.4;
girl_y2 = 0.8 + zeros(size(girl_x2));
girl_z2 = 6.2 + zeros(size(girl_x2));

man_x2 = -1.6:0.4;
man_y2 = 0.8 + zeros(size(man_x2));
man_z2 = 6.8 + zeros(size(man_x2));

%getting into the car
for i=1:length(boy_x2)  
    boy.translation = [boy_x2(i) boy_y2(i) boy_z2(i)];
    girl.translation = [girl_x2(i) girl_y2(i) girl_z2(i)];
    man.translation = [man_x2(i) man_y2(i) man_z2(i)];
    disp(i);
    vrdrawnow;
    pause(0.1);
end

boy.translation = [0.4 -1 6.2];
girl.translation = [0.4 -2 6.2];
man.translation = [0.4 -1 6.8];

car = vrnode(world, 'mustang');

%getting the fields of the car for making rotations and translations
fields(car)

z = 6.4:11.0;
x = 0.6 + zeros(size(z));
y = 0.9 + zeros(size(z));

%moving the car from the house to the driveway
for i=1:length(z)  
    car.translation = [x(i) y(i) z(i)];
    disp(i);
    vrdrawnow;
    pause(0.1);
end

% making a right turn
car.rotation = [0, -1, 0, 1.5708];
vrdrawnow;

x2 = 0.6:-1:-30;
y2 = 0.9 + zeros(size(x2));
z2 = 11.0 + zeros(size(x2));

% moving from home to school
for i=1:length(x2)  
    car.translation = [x2(i) y2(i) z2(i)];
    disp(i);
    vrdrawnow;
    pause(0.15);
end

%walking to school
boy2 = vrnode(world, 'boy2');
girl2 = vrnode(world, 'girl2');

fields(boy2)
fields(girl2)

boy2.translation = [-28.5 0.8 10];
girl2.translation = [-29.5 0.8 10];
vrdrawnow;

boy2_z = 10:-1:-7;
boy2_x = -28.5 + zeros(size(boy2_z));
boy2_y = 0.8 + zeros(size(boy2_z));

girl2_x = -29.5 + zeros(size(boy2_z));

for i=1:length(boy2_z)  
    boy2.translation = [boy2_x(i) boy2_y(i) boy2_z(i)];
    girl2.translation = [girl2_x(i) boy2_y(i) boy2_z(i)];
    disp(i);
    vrdrawnow;
    pause(0.2);
end

x3 = -30:-1:-40;
y3 = 0.9 + zeros(size(x3));
z3 = 11.0 + zeros(size(x3));

%driving to work
for i=1:length(x3)  
    car.translation = [x3(i) y3(i) z3(i)];
    disp(i);
    vrdrawnow;
    pause(0.15);
end

%resetting the world
reload(world);
vrdrawnow;










