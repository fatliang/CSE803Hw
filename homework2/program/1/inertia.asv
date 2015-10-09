%calculate the max and min inertia and their corresponding axis angle of the object when three moments are
%given
%the angle returned is the angle between the inertia axis and horizontal line in clockwise since in matlab the direction of y axis is reversed
function [inertia_max inertia_min angle_max angle_min] = inertia(rr, rc, cc)
%the inertia of an axis pass through the centroid is I
%differentiating I with respect to sita we have d(I)/d(sita) =
%(cc-rr)*sin(2*sita) - 2*rc*cos(2*sita), which should be a sinusoid
%function 
%Needs to calculate the zero points of the function
if cc-rr == 0
  %then the derivative is -2*rc*cos(2*sita)
  zero_points = [pi/4, 3*pi/4];
elseif rc == 0
  zero_points = [0, pi/2];
  %in fact, in this case the max angle should be pi/2, and the min angle should
  %be 0
else
  zero_points = [atan(2*rc/(cc-rr))/2, atan(2*rc/(cc-rr))/2+pi/2];
end
I = cc*sin(zero_points).^2-rc*sin(2*zero_points)+rr*cos(zero_points).^2;
[inertia_max max_ind] = max(I);
angle_max = zero_points(max_ind);
[inertia_min min_ind] = min(I);
angle_min = zero_points(min_ind);

