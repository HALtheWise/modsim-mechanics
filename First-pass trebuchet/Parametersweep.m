function Parametersweep()

    %% Simulation
    function res = testPoint(pinAngle)
        params = parameters();
        params.pinAngle = pinAngle*pi/180;
        [Times, Stocks] = simulate(params);
        fom = figuresOfMerit(Times, Stocks, params);
        res = fom.releaseSpeed;
    end

    %% Plotting
    fplot(@testPoint, [-120 120], 5e-3);
    
    keyboard
end