function psidot = LQRCircle(O, r, p, psi, va, q22, tau)

% Wi = [0 0];
% Wii = [300 300];
% p = [100,0];
% tau = 2;
% q22 = 1;
% va = 15;
% psi = 0;
% vw = 0;
% psiw = 0;

%thetau = atan2d(p(2)-Wi(2), p(1)-Wi(1));
theta = atan2d(p(2)-O(2), p(1)-O(1));
d = pdist([p;O]) - r;
vd = va*sind(psi - theta);

q11 = sqrt(abs(tau/(tau-d)));
u = -(d*q11 + vd*sqrt(2*q11+q22));

psidot = u/va;