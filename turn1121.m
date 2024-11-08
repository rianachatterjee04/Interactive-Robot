brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
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
                motorAngle = brick.GetMotorAngle('B')
                pause(0.2);
            end