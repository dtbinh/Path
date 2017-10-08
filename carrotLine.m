function [psidot, d] = carrotLine(Wi, Wii, p, psi, del, va, k, Rmin, vw, psiw, cond)

% % Wi = [0, 0];
% % Wii = [300, 300];
% % p = [100, 0];
% % psi = 0;
% % del = 50;
% % va = 15;
% % k = 0.5;
% % Rmin = 3*va;
% % vw = 0;
% % psiw = 0;

if cond
    cond
end


Ru = pdist([Wi;p]);
theta = atan2d(Wii(2)-Wi(2), Wii(1)-Wi(1));

thetau = atan2d(p(2)-Wi(2), p(1)-Wi(1));

beta = theta - thetau;

R = sqrt(Ru^2-(Ru*sind(beta))^2);

d = Ru*sin(theta - thetau);

xt = (R+del)*cosd(theta);
yt = (R+del)*sind(theta);
s = [xt,yt];

psid = atan2d(yt-p(2), xt-p(1));

psidot = k*(psid-psi);
u = psidot*va;

%accounting for Rmin and umax
vgx = va*cosd(psi) + vw*cosd(psiw);
vgy = va*sind(psi) + vw*sind(psiw);
vg = sqrt(vgx^2 + vgy^2);

%maxu = vg^2/Rmin;
%u = maxlimit(u,maxu);
%psidot = u/vg;
