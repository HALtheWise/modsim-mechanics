function [Distances] = X_PinAngleSweep(testpoints, paramsIn)
% Gives the distances that the trebuchet will throw with the configuration
% specified by paramsIn, except with pinAngle replaced with each value in
% testpoints.

    global totalFOMtime;
    totalFOMtime = 0;
  
    global params
    %% Simulation
            
    if nargin > 1
        params = paramsIn;
    else
        params = parameters();
    end
    params.pinAngle = max(testpoints);
    [Times, Stocks] = simulate(params);
    Releasepoints = event(Times, Stocks, params);
    Releasepoints = Releasepoints + params.pinAngle*ones(length(Times),1);
    
    isFirstUnique = zeros(length(Releasepoints),1);
    maxyet = Releasepoints(1);
    for i = 2:length(Releasepoints)
        if Releasepoints(i) > maxyet
            maxyet = Releasepoints(i);
            isFirstUnique(i) = 1;
        else
            isFirstUnique(i) = 0;
        end
    end
    
    isFirstUnique = logical(isFirstUnique);
    
    % Maps times to stocks
    ppStocks = cell(1,4);
    for i = 1:size(Stocks, 2)
        ppStocks{i} = spline(Times, Stocks(:,i));
    end
    % Maps release pin angles to times
    ppReleasepoints = spline(Releasepoints(isFirstUnique), Times(isFirstUnique));
    
    %% Simulation interpolation
    function res = testPoint(pinAngle)
        time = ppval(ppReleasepoints, pinAngle);
        stocks = zeros(1,size(Stocks, 2));
        
        for j = 1:size(Stocks, 2)
            stocks(j) = ppval(ppStocks{j}, time);
        end
        params.pinAngle = pinAngle*pi/180;
        fom = figuresOfMerit(time, stocks, params);
        res = fom.flightDistance;
    end

    %% Plotting
    [X, Y] = fplot(@testPoint, [min(testpoints) max(testpoints)], 5e-2);
    
    if nargout == 0
        plot(X*180/pi,Y)
        xlabel('Pin angle (degrees)');
        ylabel('Flight distance (meters)');
    end
    
    pp = spline(X, Y);
    function throwdist = interpolator(pinangle)
        throwdist = ppval(pp, pinangle);
    end

    Distances = arrayfun(@interpolator, testpoints);
    %keyboard
end