brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
disp("start");
% initialize color sensor
brick.SetColorMode(3, 2);
brick.MoveMotor('AB', 50);
pause(1);
brick.StopAllMotors('Coast');
pause(1);
brick.ResetMotorAngle('B');
pause(1);
motorAngle = brick.GetMotorAngle('B');
disp(motorAngle);
while (motorAngle < 180)
    brick.MoveMotor('A',-10);
    motorAngle = brick.GetMotorAngle('B');
    fprintf('motorAngle is %d\n', motorAngle)
    brick.MoveMotor('B',10);
    pause(0.25);
    brick.StopAllMotors('Coast');
    pause(0.25);
end
brick.MoveMotor('AB', 50);
pause(1);
brick.StopAllMotors('Coast');
pause(1);
brick.ResetMotorAngle('B');
pause(1);
motorAngle = brick.GetMotorAngle('B');
disp(motorAngle);
while (motorAngle < 180)
    brick.MoveMotor('A',-10);
    motorAngle = brick.GetMotorAngle('B');
    fprintf('motorAngle is %d\n', motorAngle)
    brick.MoveMotor('B',10);
    pause(0.25);
    brick.StopAllMotors('Coast');
    pause(0.25);
end
while(1)
    colorNum = brick.ColorCode(3);
    brick.MoveMotor('AB', 50);
    pause(0.5);
    disp(colorNum);
    if(colorNum == 5)
        disp("STOP");
        brick.StopAllMotors('Coast');
        pause(3);
    end
end
