function [r_m c_m] = map_rot_trans(sita, r, c, r0, c0)
%%compute the mapping results
c_m = c0 + cos(sita)*c - sin(sita)*r;
r_m = r0 + sin(sita)*c + cos(sita)*r;