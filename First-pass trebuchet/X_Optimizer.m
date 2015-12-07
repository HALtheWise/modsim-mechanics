function X_Optimizer()

    global totalFOMtime;
    totalFOMtime = 0;

    %% Simulation
    function [res, params] = testPoint(controls)
        params = parameters();
        
        params.pinAngle = controls(1);
        params.l3 = controls(2);
        
        [Times, Stocks] = simulate(params);
        fom = figuresOfMerit(Times, Stocks, params);
        res = -fom.flightDistance;
    end

    %% Guess
    params = parameters();
    guess = [params.pinAngle, params.l3];

    %% Optimize
    optimal = fminsearch(@testPoint, guess)
    
    global optimalparams;

    [~, optimalparams] = testPoint(optimal);
    
    %keyboard
end