function [Distances] = Parametersweep(testpoints, paramsIn)
% Gives the distances that the trebuchet will throw with the configuration
% specified by paramsIn, except with pinAngle replaced with each value in
% testpoints.

    global totalFOMtime;
    totalFOMtime = 0;

    args = nargin;
    
    %% Simulation
    function res = testPoint(pinAngle)        
        if args > 1
            params = paramsIn;
        else
            params = parameters();
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

    Distances = arrayfun(@interpolator, testpoints);
    %keyboard
end