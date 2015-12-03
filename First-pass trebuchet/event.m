function [value,isterminal,direction] = event(~,y,params)
%EVENT Summary of this function goes here
%   Detailed explanation goes here
    isterminal = 1;
    direction = 0;
    value = mod( y(1) - y(2) + pi, 2*pi) - pi - params.pinAngle;
    
end

