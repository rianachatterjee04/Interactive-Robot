brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
disp("start");
distance = 0;
%Move Rocket/initialize color sensor
brick.SetColorMode(3, 2);
brick.MoveMotor('AB', 50);
pause(3);
brick.StopAllMotors('Coast');
pause(1);
% right turn use B
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
brick.StopAllMotors('Coast');
% left turn use A
brick.ResetMotorAngle('A');
pause(1);
motorAngle = brick.GetMotorAngle('A');
disp(motorAngle);
while (motorAngle < 180)
    brick.MoveMotor('A',10);
    motorAngle = brick.GetMotorAngle('A');
    fprintf('motorAngle is %d\n', motorAngle)
    brick.MoveMotor('B',-10);
    pause(0.25);
    brick.StopAllMotors('Coast');
    pause(0.25);
end
brick.StopAllMotors('Coast');