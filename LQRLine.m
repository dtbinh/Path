function psidot = LQRLine(Wi, Wii, p, tau, q22, va, psi, vw, psiw)

% Wi = [0 0];
% Wii = [300 300];
% p = [100,0];
% tau = 2;
% q22 = 1;
% va = 15;
% psi = 0;
% vw = 0;
% psiw = 0;

thetau = atan2d(p(2)-Wi(2), p(1)-Wi(1));
theta = atan2d(Wii(2)-Wi(2), Wii(1)-Wi(1));
Ru = pdist([Wi;p]);
d = Ru*sind(theta - thetau);
vd = va*sind(psi - theta);

q11 = abs(tau/(tau-d));
u = -(d*sqrt(q11) + vd*sqrt(2*sqrt(q11)+q22));

psidot = u/va;