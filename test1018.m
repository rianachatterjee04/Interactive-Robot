brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
disp("start");
distance = 0;
% Used Rocket
    brick.SetColorMode(3, 2)
    brick.MoveMotor('AB', 50);
    pause(3);
    brick.StopAllMotors('Coast');
    pause(1);
    disp("bruh");
% Oops, we tried to make a right turn here
    brick.MoveMotorAngleRel('A',20,-90);
    brick.WaitForMotor('A');
    brick.StopAllMotors('Coast');
    pause(1);
    disp("Turn complete");
% Mistake ends here
    brick.MoveMotor('AB', 50);
    pause(3);
% "Proper" 90 degree right turn
   brick.StopAllMotors('Coast');
    pause(1);
    brick.MoveMotor('A',-25);
    brick.MoveMotor('B',25);
    pause(1);
    brick.StopAllMotors('Coast');
    pause(1);
% 90 degree right turn ends here
while(1)
    % Color sensor shenanigans start here
    colorNum = brick.ColorCode(3);
    brick.MoveMotor('AB', 50);
    pause(0.05);
    disp(colorNum);
    distance = brick.UltrasonicDist(4);
    if (colorNum == 5) 
        disp("STOP");
        brick.StopAllMotors('Coast');
        pause(5);
        brick.MoveMotor('AB',50);
        pause(0.5);
    end
    if (colorNum == 4)
        disp("aaaaaaaaaaaaaa");
        disp(distance);
        brick.StopAllMotors('Coast');
        while (distance > 21)
            distance = brick.UltrasonicDist(4)
            brick.MoveMotor('AB',10);
            pause(0.1);
        end
            brick.StopAllMotors('Brake');
    end
end