% Test out brick.MoveMotorAngleRel
brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
disp("let's hope this works")
brick.MoveMotorAngleRel('A',-40,360,'Coast');
brick.MoveMotorAngleRel('B',40,360,'Coast');
brick.WaitForMotor('A');
brick.WaitForMotor('B');
disp("done")
% Effect: turns the thing 190-200 degrees. MoveMotorAngle sucks because it
% deals with revolutions of the wheel, not the car itself :(