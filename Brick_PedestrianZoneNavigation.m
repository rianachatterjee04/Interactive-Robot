brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
disp("start");
touch = false;
pnpu = true; % pedestrian not picked up
distance = 0;
brick.ResetMotorAngle('AB');
pause(1);
clt = 0; % Consecutive left turns (distance <= 50)
crt = 0; % Consecutive right turns (distance > 50)
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
while(pnpu || ~(color == 3))
    angle = brick.GetMotorAngle('A');
    color = brick.ColorCode(3);
    brick.MoveMotor('AB', -75);
    pause(0.01);
    touch = brick.TouchPressed(1) && brick.TouchPressed(2);
    distance = brick.UltrasonicDist(4);
    if (angle < -950 && distance > 60)
        clt = 0;
        crt = crt + 1;
        brick.MoveMotor('AB', -50);
        pause(0.5)
        brick.StopAllMotors('Coast');
        pause(0.5)
        brick.ResetMotorAngle('AB');
        pause(0.5)
        if (crt >= 7)
            continue
        end
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
        brick.StopAllMotors('Brake');
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
        if (distance > 60)
            clt = 0;
            crt = crt + 1;
            if (crt >= 7)
                continue
            end
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
            clt = clt + 1;
            crt = 0;
            if (clt >= 7)
                continue
            end
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
    if (color == 4 && pnpu)
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
        % pick up (lift) the guy
        brick.MoveMotor('C',100);
        pause(3);
        brick.StopAllMotors('Coast');
        brick.MoveMotor('C',-100);
        pause(3);
        brick.StopAllMotors('Coast');
        brick.ResetMotorAngle('AB');
        pause(1);
    end
    if (crt + clt >= 7)
        clt = 0;
        crt = 0;
        brick.StopAllMotors('Coast');
        pause(1);
        brick.ResetMotorAngle('AB');
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
        brick.ResetMotorAngle('AB');
        pause(1);
    end
end
% ending stuffs
brick.MoveMotor('AB', -50);
pause(2);
brick.StopAllMotors('Coast');
