testMasses = 32;
testPinangles = [   -82.12, -39.79;
                    -70.34, -70.34;
                    -82.14, -51.93;
                    -78.37, -26.76;
                    -26.05, -26.05]*pi/180;
colors = {[1 0 0], [.8 0 0], [.6 0 0], [.4 0 0]};
% These points were pulled from the outer annulus of the graph (4m long landings)

clf
hold on
for i = 1:length(testMasses)
    mass = testMasses(i);
    for j = 1:2
        pinAngle = testPinangles(i, j);
        params = parameters();
        params.m3 = mass;
        params.pinAngle = pinAngle;
        [Times, Stocks] = simulate(params);
        fom = figuresOfMerit(Times, Stocks, params);
        if isempty(fom.baseballStocks)
            continue
        end
        results{i,j} = plot(fom.baseballStocks(:,1), fom.baseballStocks(:,2) + params.pivotHeight, 'LineWidth', 5);
        %pause
    end
    if isempty(fom.baseballStocks)
        continue
    end
end

legend({'Early release','Late release'});
xlabel('Downrange distance (m)', 'FontSize', 20)
ylabel('Altitude (m)', 'FontSize', 20)
ylim([0 160])
title('Flight path options', 'FontSize', 20)

text(10, 8, 'Rider mass: 32kg', 'FontSize', 17);