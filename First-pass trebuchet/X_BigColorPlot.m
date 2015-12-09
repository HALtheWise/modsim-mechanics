%% Calculating
Masses = linspace(1,100,20);
Angles = linspace(-100,0,500)*pi/180;
SparseResults = zeros(length(Masses), length(Angles));

for mass = 1:length(Masses)
    params = parameters();
    params.m3 = Masses(mass);
    Throwdists = X_PinAngleSweep(Angles, params);
    SparseResults(mass, :) = Throwdists;
end

%% Densify results
DenseMasses = linspace(min(Masses), max(Masses), 500);
DenseResults = interp2(Angles, Masses, SparseResults, Angles, DenseMasses', 'cubic');
Angles = Angles .* 180/pi;

%% Plotting
clf
hold on

params = parameters();
[C1, h1] = contour(Angles, DenseMasses, DenseResults, ...
    [params.distanceToPool - params.poolradius,params.distanceToPool - params.poolradius], 'k');
[C2, h2] = contour(Angles, DenseMasses, DenseResults, ...
    [params.distanceToPool + params.poolradius, params.distanceToPool + params.poolradius], 'k');

h1.LineWidth = 0;
h2.LineWidth = 0;

fill(C1(1,2:end), C1(2,2:end), 'green')
fill(C2(1,2:end), C2(2,2:end), [255,99,71] ./ 255)
set(gca, 'Color', [255,165,0]./255)

%mycmap = [0 0 0;0 1 0;0 0 0];
%colormap(mycmap);
%caxis([params.distanceToPool-10 params.distanceToPool+10 ])
xlabel('Trebuchet pin angle (degrees)', 'FontSize', 20)
ylabel('Rider mass (kg)', 'FontSize', 20)
title('Operating regimes', 'FontSize', 22)

str=sprintf('m1=%.0fkg; m2=%.0fkg; l1=%.0fm; l2=%.0fm; l3=%.0fm\nTarget distance: %.0fm;   Error margin: +-%.0fm',...
    params.m1, params.m2, params.l1, params.l2, params.l3, params.distanceToPool, params.poolradius);
text(median(Angles), min(Masses)+8, str, 'FontSize', 17, 'HorizontalAlignment', 'center');