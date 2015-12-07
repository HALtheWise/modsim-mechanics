%% Run animation

params = parameters()
[Times, Stocks] = simulate(params);

%% Unpack constants from params into the local workspace for Mathematica
% Code taken from https://www.mathworks.com/matlabcentral/newsreader/view_thread/276419
fields = fieldnames(params);
for f = 1 : length(fieldnames(params));
    thisField = fields{f};
    commandLine = sprintf('%s = params.%s;', thisField, thisField);

    %Potential performance improvement target
    eval(commandLine); % EVAL is evil. Let's use it anyway.
end
clear('fields')

%% Unpack state variables   
theta1 = Stocks(:,1);
theta2 = Stocks(:,2);
theta1dot = Stocks(:,3);
theta2dot = Stocks(:,4);

%% Calculate energies

KE = (1/2).*(m1.*(l1.^2.*theta1dot.^2.*cos(theta1).^2+l1.^2.* ...
  theta1dot.^2.*sin(theta1).^2)+m2.*(l2.^2.*theta1dot.^2.*cos( ...
  theta1).^2+l2.^2.*theta1dot.^2.*sin(theta1).^2)+m3.*((l2.* ...
  theta1dot.*cos(theta1)+l3.*theta2dot.*cos(theta2)).^2+((-1).*l2.* ...
  theta1dot.*sin(theta1)+(-1).*l3.*theta2dot.*sin(theta2)).^2));

PE = (-1).*g.*l1.*m1.*sin(theta1)+g.*l2.*m2.*sin(theta1)+g.*m3.*(l2.* ...
  sin(theta1)+l3.*sin(theta2));
clf
hold on;
plot(Times, KE);
plot(Times, PE);
plot(Times, KE+PE);

xlabel('time (s)')
ylabel('Energy (J)')
legend('KE', 'PE', 'Total Energy')