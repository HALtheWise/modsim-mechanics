function [ distance ] = baseball_simulation( P0, V0, params )
%BASEBALL_SIMULATION Summary of this function goes here
%   Detailed explanation goes here
    
    Y0 = [P0; V0];
    
    if P0(2) <= 0
       distance = 0;
       return
    end
    
    function [res] = bflows(~, Y)
        P = Y(1:2);
        V = Y(3:4);
        gravity = params.g * [0; -1];
        
        res = [0;0;0;0];
        res(1:2) = V;
        res(3:4) = gravity;
    end
    
    function [value,isterminal,direction] = bevent(~, y)
        value = y(2);
        isterminal = 1;
        direction = -1;
    end

    options = odeset('Events', @bevent);
    [Times, Stocks] = ode45(@bflows, [0 1e10], Y0, options);
    
    distance = Stocks(end, 1);

end

