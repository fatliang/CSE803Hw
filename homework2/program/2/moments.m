%calculate the centroid and moments of binary image
function [r c rr rc cc] = moments(img)
%img should binary
img = logical(img);
area = sum(sum(img == 1));
img_size = size(img);
r = sum([1:img_size(1)]*img)/area;
c = sum(img*[1:img_size(2)]')/area;
rr = sum(([1:img_size(1)]-r).^2*img)/area;
rc = sum(sum(([1:img_size(1)]'-r)*([1:img_size(2)]-c).*img))/area;
cc = sum(img*([1:img_size(2)]'-c).^2)/area;
