function psidot = VFLine(wi, wii, p, psi, k, kappa)

theta = atan2d(wii(2)-wi(2), wii(1)-wi(1));
psi_inf = theta;
thetau = atan2d(p(2)-wi(2), p(1)-wi(1));
Ru = pdist([wi;p]);

y = Ru*sind(theta-thetau);

psid = -psi_inf*(1/90)*atand(k*y);

psidot = kappa*(psid-psi);
