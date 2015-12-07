function Parametersweep()

    global totalFOMtime;
    totalFOMtime = 0;

    %% Simulation
    function res = testPoint(pinAngle)
        params = parameters();
        params.m3=70;
        params.pinAngle = pinAngle*pi/180;
        [Times, Stocks] = simulate(params);
        fom = figuresOfMerit(Times, Stocks, params);
        res = fom.flightDistance;
    end

    %% Plotting
    fplot(@testPoint, [-100 100], 5e-3);
    xlabel('Pin angle (degrees)');
    ylabel('Flight distance (meters)');
    
    %keyboard
end