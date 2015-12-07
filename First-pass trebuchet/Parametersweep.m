function [res_fun, X, Y] = Parametersweep(ridermass)

    global totalFOMtime;
    totalFOMtime = 0;

    args = nargin;
    
    %% Simulation
    function res = testPoint(pinAngle)
        params = parameters();
        
        if args > 0
            params.m3=ridermass;
        end
        params.pinAngle = pinAngle*pi/180;
        [Times, Stocks] = simulate(params);
        fom = figuresOfMerit(Times, Stocks, params);
        res = fom.flightDistance;
    end

    %% Plotting
    [X, Y] = fplot(@testPoint, [-100 100], 5e-2);
    xlabel('Pin angle (degrees)');
    ylabel('Flight distance (meters)');
    
    if nargout == 0
        plot(X,Y)
    end
    
    pp = spline(X, Y);    
    function throwdist = interpolator(pinangle)
        throwdist = ppval(pp, pinangle);
    end

    res_fun = @interpolator;
    %keyboard
end