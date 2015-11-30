function animate(T,Stocks)
    % animate the positions of the planets, assuming that the
    % columns of M are x1, y1, x2, y2.
    %positions calculated from angle
    
    X1 = zeros(213,1);
    Y1 = zeros(213,1);
    X2 = cos(Stocks(:,1));
    Y2 = sin(Stocks(:,1));

    minmax = [min([X1;X2]), max([X1;X2]), min([Y1;Y2]), max([Y1;Y2])];

    for i=1:length(T)
        clf;
        axis(minmax);
        hold on;
        draw(X1(i), Y1(i), X2(i), Y2(i));
        drawnow;
    end
end