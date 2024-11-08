brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
disp("start");
pnpu = true; % pedestrian not picked up
numTouches = 0;
%brick.ResetMotorAngle('B');
%pause(1);
motorAngle = brick.GetMotorAngle('B');
%while (motorAngle < 360)
%    brick.MoveMotor('A',-10);
%    motorAngle = brick.GetMotorAngle('B');
%    brick.MoveMotor('B',10);
%    pause(0.2);
%    brick.StopAllMotors('Coast');
%    pause(0.2);
%end

while(pnpu)
    color = brick.ColorCode(3);
    brick.MoveMotor('AB', -50);
    pause(0.1);
    touch = brick.TouchPressed(1) && brick.TouchPressed(2);
    if touch
        brick.StopAllMotors('Coast');
        fprintf('touched\n');
        pause(1);
        brick.MoveMotor('AB', 50);
        pause(1);
        brick.StopAllMotors('Coast');
        pause(1);
        brick.ResetMotorAngle('AB');
        pause(1);
        if (mod(numTouches, 2) == 0)
            motorAngle = brick.GetMotorAngle('B');
            while(motorAngle < 180)
                brick.MoveMotor('A', -10);
                motorAngle = brick.GetMotorAngle('B');
                brick.MoveMotor('B', 10);
                pause(0.2);
                brick.StopAllMotors('Coast');
                pause(0.2);
            end
        else
            motorAngle = brick.GetMotorAngle('A');
            while(motorAngle < 180)
                brick.MoveMotor('B', -10);
                motorAngle = brick.GetMotorAngle('A');
                brick.MoveMotor('A', 10);
                pause(0.2);
                brick.StopAllMotors('Coast');
                pause(0.2);
            end
        end
        numTouches =  numTouches + 1;
    end
    if (color == 5) 
        disp("STOP");
        brick.StopAllMotors('Coast');
        pause(5);
        brick.MoveMotor('AB',-50);
        pause(0.5);
    end
    if (color == 4)
        disp("entered pedestrian zone");
        brick.StopAllMotors('Coast');
        pause(1);
        % 180 deg turn
        brick.ResetMotorAngle('B');
        pause(1);
        motorAngle = brick.GetMotorAngle('B');
        disp(motorAngle);
        while (motorAngle < 360)
            brick.MoveMotor('A',-10);
            motorAngle = brick.GetMotorAngle('B');
            brick.MoveMotor('B',10);
            pause(0.2);
            brick.StopAllMotors('Coast');
            pause(0.2);
        end
        %distance = brick.UltrasonicDist(4);
        brick.StopAllMotors('Coast');
        pause(0.1);
        % this was just for fun
        %while (distance > 24)
            %distance = brick.UltrasonicDist(4);
            %brick.MoveMotor('AB',10);
            %pause(0.1);
            %disp(distance);
        %end
        pnpu = false;
        brick.StopAllMotors('Brake');
    end
end
% pick up (lift) the guy
brick.MoveMotor('AB', 10);
pause(1);
brick.StopAllMotors('Coast');
brick.MoveMotor('C',100);
pause(3);
brick.StopAllMotors('Coast');
brick.MoveMotor('C',-100);
pause(3);
brick.StopAllMotors('Coast');
while(~(color == 3))
    color = brick.ColorCode(3);
    brick.MoveMotor('AB', -40);
    pause(0.1);
    touch = brick.TouchPressed(1);
    if touch
        brick.StopAllMotors('Coast');
        fprintf('touched\n');
        pause(1);
        brick.MoveMotor('AB', 50);
        pause(1);
        brick.StopAllMotors('Coast');
        pause(1);
        brick.ResetMotorAngle('A');
        pause(1);
        if (mod(numTouches, 2) == 0)
            motorAngle = brick.GetMotorAngle('B');
            while(motorAngle < 180)
                brick.MoveMotor('A', -10);
                motorAngle = brick.GetMotorAngle('B');
                brick.MoveMotor('B', 10);
                pause(0.2);
                brick.StopAllMotors('Coast');
                pause(0.2);
            end
        else
            motorAngle = brick.GetMotorAngle('A');
            while(motorAngle < 180)
                brick.MoveMotor('B', -10);
                motorAngle = brick.GetMotorAngle('A');
                brick.MoveMotor('A', 10);
                pause(0.2);
                brick.StopAllMotors('Coast');
                pause(0.2);
            end
        end
        numTouches = numTouches + 1;
    end
    if (color == 5) 
        disp("STOP");
        brick.StopAllMotors('Coast');
        pause(5);
        brick.MoveMotor('AB',-50);
        pause(0.5);
    end
end
pause(3);
brick.StopAllMotors('Coast');