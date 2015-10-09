function res = circularity(img)
%return the circularity of binary image
img = logical(img);
img_size = size(img);
%first get the boundary
img_boundary = dilate(img) - img;
[r c rr rc cc] = moments(img);
pos_array = [];
for i = 1:img_size(1)
    for j = 1:img_size(2)
      if (img_boundary(i,j) == 1)
        pos_array = [pos_array;i,j];
      end
    end
end
K = length(pos_array(:,1));%the number of boundary pixels
dist_array = pos_array - ones(K,1)*[r,c];
mu = sum(sqrt(sum(dist_array.^2,2)))/K;
sigma = sum((sqrt(sum(dist_array.^2,2))-mu).^2)/K;
res = mu/sqrt(sigma);