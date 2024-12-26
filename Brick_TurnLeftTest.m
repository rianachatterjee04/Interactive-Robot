brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
disp("Turn Left Test")
brick.ResetMotorAngle('AB');
motorAngle = brick.GetMotorAngle('A');
disp(motorAngle)
while (motorAngle < 180)
    if(motorAngle < 175)
        brick.MoveMotor('A', 15);
        brick.MoveMotor('B',-15);
    else
        brick.MoveMotor('A',5);
        brick.MoveMotor('B',-5);
    end
    motorAngle = brick.GetMotorAngle('A');
    fprintf('motorAngle is %d\n', motorAngle)
    pause(0.1);
    brick.StopAllMotors('Brake');
    pause(0.1);
end
brick.StopAllMotors('Coast')
