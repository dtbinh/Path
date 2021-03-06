function [psidot, d] = carrotLine(Wi, Wii, p, psi, del, va, k, Rmin, vw, psiw)

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


Ru = pdist([Wi;p]);
theta = atan2d(Wii(2)-Wi(2), Wii(1)-Wi(1));

thetau = atan2d(p(2)-Wi(2), p(1)-Wi(1));

beta = theta - thetau;

R = sqrt(Ru^2-(Ru*sind(beta))^2);

d = Ru*sin(theta - thetau);

xt =  Wi(1)+(R+del)*cosd(theta);
yt =  Wi(2)+(R+del)*sind(theta);
s = [xt,yt];

psid1 = atan2d(yt-p(2), xt-p(1));
psid2 = psid1 + (psid1<0)*360;
psidot1 = k*(psid1-psi);
psidot2 = k*(psid2-psi);

if abs(psidot1)<abs(psidot2)
    psidot = psidot1;
else
    psidot = psidot2;
end

u = psidot*va;

%accounting for Rmin and umax
vgx = va*cosd(psi) + vw*cosd(psiw);
vgy = va*sind(psi) + vw*sind(psiw);
vg = sqrt(vgx^2 + vgy^2);

%maxu = vg^2/Rmin;
%u = maxlimit(u,maxu);
%psidot = u/vg;
