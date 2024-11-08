brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
disp("start");
touch = false;
pnpu = true; % pedestrian not picked up
distance = 0;
brick.ResetMotorAngle('AB');
pause(1);
%motorAngle = brick.GetMotorAngle('B');
%while(motorAngle < 340)
%    if (mod(motorAngle, 170) < 150)
%        pause(0.1);
%        brick.MoveMotor('A', -20);
%        brick.MoveMotor('B', 20);
%    else
%        brick.MoveMotor('A', -10);
%        brick.MoveMotor('B', 10);
%    end
%    pause(0.2);
%    brick.StopAllMotors('Coast');
%    motorAngle = brick.GetMotorAngle('B');
%    pause(0.2);
%end
brick.ResetMotorAngle('AB');
while(pnpu)
    angle = brick.GetMotorAngle('A');
    color = brick.ColorCode(3);
    brick.MoveMotor('AB', -80);
    pause(0.01);
    touch = brick.TouchPressed(1) && brick.TouchPressed(2);
    distance = brick.UltrasonicDist(4);
    if (angle < -1000 && distance > 50)
        brick.MoveMotor('AB', -50);
        pause(0.5)
        brick.StopAllMotors('Coast');
        pause(0.5)
        brick.ResetMotorAngle('AB');
        pause(0.5)
        motorAngle = brick.GetMotorAngle('B');
        while(motorAngle < 170)
            if (motorAngle < 150)
                pause(0.1);
                brick.MoveMotor('A', -20);
                brick.MoveMotor('B', 20);
            else
                brick.MoveMotor('A', -10);
                brick.MoveMotor('B', 10);
            end
            pause(0.2);
            brick.StopAllMotors('Coast');
            motorAngle = brick.GetMotorAngle('B');
            pause(0.2);
        end
        pause(0.5)
        brick.ResetMotorAngle('AB');
        pause(0.5);
    end
    if touch
        brick.StopAllMotors('Coast');
        fprintf('touched\n');
        pause(1);
        brick.MoveMotor('AB',0);
        pause(1);
        brick.MoveMotor('AB', 50);
        pause(1);
        brick.StopAllMotors('Coast');
        pause(1);
        brick.ResetMotorAngle('AB');
        pause(1);
        if (distance > 50)
            motorAngle = brick.GetMotorAngle('B');
            while(motorAngle < 170)
                if (motorAngle < 150)
                    pause(0.1);
                    brick.MoveMotor('A', -20);
                    brick.MoveMotor('B', 20);
                else
                    brick.MoveMotor('A', -10);
                    brick.MoveMotor('B', 10);
                end
                pause(0.2);
                brick.StopAllMotors('Coast');
                motorAngle = brick.GetMotorAngle('B');
                pause(0.2);
            end
        else
            motorAngle = brick.GetMotorAngle('A');
            while(motorAngle < 170)
                if (motorAngle < 150)
                    pause(0.1);
                    brick.MoveMotor('B', -20);
                    brick.MoveMotor('A', 20);
                else
                    brick.MoveMotor('B', -10);
                    brick.MoveMotor('A', 10);
                end
                pause(0.2);
                brick.StopAllMotors('Coast');
                motorAngle = brick.GetMotorAngle('A');
                pause(0.2);
            end
        end
        pause(0.5);
        brick.ResetMotorAngle('AB');
        pause(0.5);
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
        brick.MoveMotor('AB',0);
        pause(1);
        % 180 deg turn
        brick.ResetMotorAngle('B');
        pause(1);
        motorAngle = brick.GetMotorAngle('B');
        while(motorAngle < 340)
            if (mod(motorAngle, 170) < 150)
                pause(0.1);
                brick.MoveMotor('A', -20);
                brick.MoveMotor('B', 20);
            else
                brick.MoveMotor('A', -10);
                brick.MoveMotor('B', 10);
            end
            pause(0.2);
            brick.StopAllMotors('Coast');
            motorAngle = brick.GetMotorAngle('B');
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
brick.MoveMotor('C',100);
pause(3);
brick.StopAllMotors('Coast');
brick.MoveMotor('C',-100);
pause(3);
brick.StopAllMotors('Coast');
brick.ResetMotorAngle('AB');
pause(1);
while (~touch)
    brick.MoveMotor('AB', -80);
    touch = brick.TouchPressed(1);
end
brick.StopAllMotors('Coast');
fprintf('touched\n');
pause(1);
brick.MoveMotor('AB',0);
pause(1);
brick.MoveMotor('AB', 50);
pause(1);
brick.StopAllMotors('Coast');
pause(1);
brick.ResetMotorAngle('AB');
pause(1);
motorAngle = brick.GetMotorAngle('A');
while(motorAngle < 170)
    if (motorAngle < 150)
        pause(0.1);
        brick.MoveMotor('B', -20);
        brick.MoveMotor('A', 20);
    else
        brick.MoveMotor('B', -10);
        brick.MoveMotor('A', 10);
    end
    pause(0.2);
    brick.StopAllMotors('Coast');
    motorAngle = brick.GetMotorAngle('A');
    pause(0.2);
end
pause(0.5);
brick.ResetMotorAngle('AB');
pause(0.5);
while(~(color == 3))
    angle = brick.GetMotorAngle('A');
    color = brick.ColorCode(3);
    brick.MoveMotor('AB', -80);
    pause(0.01);
    distance = brick.UltrasonicDist(4);
    touch = brick.TouchPressed(1);
    if touch
        brick.StopAllMotors('Coast');
        fprintf('touched\n');
        pause(1);
        brick.MoveMotor('AB',0);
        pause(1);
        brick.MoveMotor('AB', 50);
        pause(1);
        brick.StopAllMotors('Coast');
        pause(1);
        brick.ResetMotorAngle('AB');
        pause(1);
        if (distance > 50)
            motorAngle = brick.GetMotorAngle('B');
            while(motorAngle < 170)
                if (motorAngle < 150)
                    pause(0.1);
                    brick.MoveMotor('A', -20);
                    brick.MoveMotor('B', 20);
                else
                    brick.MoveMotor('A', -10);
                    brick.MoveMotor('B', 10);
                end
                pause(0.2);
                brick.StopAllMotors('Coast');
                motorAngle = brick.GetMotorAngle('B');
                pause(0.2);
            end
        else
            motorAngle = brick.GetMotorAngle('A');
            while(motorAngle < 170)
                if (motorAngle < 150)
                    pause(0.1);
                    brick.MoveMotor('B', -20);
                    brick.MoveMotor('A', 20);
                else
                    brick.MoveMotor('B', -10);
                    brick.MoveMotor('A', 10);
                end
                pause(0.2);
                brick.StopAllMotors('Coast');
                motorAngle = brick.GetMotorAngle('A');
                pause(0.2);
            end
        end
        pause(0.5);
        brick.ResetMotorAngle('AB');
        pause(0.5);
    end
    if (angle < -1000 && distance > 50)
        brick.MoveMotor('AB', -50);
        pause(0.5)
        brick.StopAllMotors('Coast');
        pause(0.5)
        brick.ResetMotorAngle('AB');
        pause(0.5)
        motorAngle = brick.GetMotorAngle('B');
        while(motorAngle < 170)
            if (motorAngle < 150)
                pause(0.1);
                brick.MoveMotor('A', -20);
                brick.MoveMotor('B', 20);
            else
                brick.MoveMotor('A', -10);
                brick.MoveMotor('B', 10);
            end
            pause(0.2);
            brick.StopAllMotors('Coast');
            motorAngle = brick.GetMotorAngle('B');
            pause(0.2);
        end
        pause(0.5)
        brick.ResetMotorAngle('AB');
        pause(0.5);
    end
    if (color == 5) 
        disp("STOP");
        brick.StopAllMotors('Coast');
        pause(5);
        brick.MoveMotor('AB',-50);
        pause(0.5);
    end
end
brick.MoveMotor('AB', -50);
pause(2);
brick.StopAllMotors('Coast');