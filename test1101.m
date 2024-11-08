brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
disp("start");

brick.ResetMotorAngle('B');
pause(1);
motorAngle = brick.GetMotorAngle('B');
while (motorAngle < 360)
    brick.MoveMotor('A',-10);
    motorAngle = brick.GetMotorAngle('B');
    brick.MoveMotor('B',10);
    pause(0.25);
    brick.StopAllMotors('Coast');
    pause(0.25);
end

while(1)
    touch = brick.TouchPressed(1);
    color = brick.ColorCode(3);
    if touch
        brick.StopAllMotors('Coast');
        fprintf('touched\n');
        pause(1);
        brick.MoveMotor('AB', 50);
        pause(1);
        brick.StopAllMotors('Coast');
        pause(1);
        brick.ResetMotorAngle('B');
        pause(1);
        motorAngle = brick.GetMotorAngle('B');
        while(motorAngle < 180)
            brick.MoveMotor('A', -10);
            motorAngle = brick.GetMotorAngle('B');
            brick.MoveMotor('B', 10);
            pause(0.25);
            brick.StopAllMotors('Coast');
            pause(0.25);
        end
    end
    if (color == 5) 
        disp("STOP");
        brick.StopAllMotors('Coast');
        pause(5);
        brick.MoveMotor('AB',50);
        pause(0.5);
    end
    if (color == 4)
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
    
    brick.MoveMotor('AB', -50);
    pause(0.5);

end