function psidot = VFLineTest(wi, wii, p, psi, k, kappa, psi_inf)

slope = (wii(2)-wi(2))/(wii(1)-wi(1));
incp = wii(2) - slope*(wii(1));
e = p(2) - slope*(p(1))+incp;

psid = -psi_inf*(1/90)*atand(kappa*e)+ atand(slope);

psidot = k*(psid-psi);