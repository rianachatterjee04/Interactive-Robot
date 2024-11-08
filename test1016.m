disp("start");
% Used Rocket
    brick.SetColorMode(3, 2)
    brick.MoveMotor('AB', 50);
    pause(3);
% Proper 90 degree right turn
    brick.MoveMotor('AB',0);
    pause(1);
    brick.MoveMotor('A',-25);
    brick.MoveMotor('B',25);
    pause(1);
    brick.MoveMotor('AB',0);
    pause(1);
% 90 degree right turn ends here
    brick.MoveMotor('AB', 50);
    pause(3);
% Proper 90 degree right turn
    brick.MoveMotor('AB',0);
    pause(1);
    brick.MoveMotor('A',-25);
    brick.MoveMotor('B',25);
    pause(1);
    brick.MoveMotor('AB',0);
    pause(1);
% 90 degree right turn ends here
while(1)
    % Color sensor shenanigans start here
    colorNum = brick.ColorCode(3);
    brick.MoveMotor('AB', 50);
    pause(0.25);
    disp(colorNum);
    if (colorNum == 5) 
        disp("STOP");
    end
    if (colorNum == 0)
        disp("aaaaaaaaaaaaaa");
        brick.MoveMotor('AB',-100);
        pause(1);
        brick.MoveMotor('A', 50);
        brick.MoveMotor('B',-50);
        pause(0.5);
        brick.MoveMotor('AB',0);
    end
end