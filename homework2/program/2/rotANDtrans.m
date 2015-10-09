function [sita u0 v0] = rotANDtrans(r0,c0,r1,c1,r0_m,c0_m,r1_m,c1_m)
%%compute the rotation and translation that maps (r0,c0), (r1,c1) to
%%(r0_m,c0_m), (r1_m,c1_m)
if c1 == c0
  if r1 > r0
    sita_1 = pi/2;
  else
    sita_1 = -pi/2;
  end
else    
  sita_1 = atan((r1-r0)/(c1-c0));
  if c1-c0 < 0 
     sita_1 = sita_1 + pi;
  end
end
if c1_m == c0_m
  if r1_m > r0_m
    sita_2 = pi/2;
  else
    sita_2 = -pi/2;
  end
else
  sita_2 = atan((r1_m-r0_m)/(c1_m-c0_m));
  if c1_m-c0_m < 0
    sita_2 = sita_2 + pi;
  end
end
sita = sita_2 - sita_1;
v0 = c0_m - (cos(sita)*c0 - sin(sita)*r0);
u0 = r0_m - (sin(sita)*c0 + cos(sita)*r0);
v1 = c1_m - (cos(sita)*c1 - sin(sita)*r1);
v2 = 0;