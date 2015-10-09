function res = circumference(img)
%calculate the circumference of binary image
img_size = size(img);
accompany = zeros(img_size);
img_dilated = dilate(img);
img_boundary = img_dilated - img;
start_pos = [0,0];
for i = 1:img_size(1)
  for j = 1:img_size(2)
    if (img_boundary(i,j) == 1)
        start_pos = [i,j];
        break;
    end
  end
  if start_pos(1) ~= 0
      break;
  end
end
pre_pos = [0, 0];
cur_pos = start_pos;
res = 0;
while sum(unique(accompany ~= img_boundary))
  %first check the four direct neighbors
  scanned = 0;
  accompany(cur_pos(1),cur_pos(2)) = 1;%mark the pixel
  neighbor_pos = [cur_pos(1)-1,cur_pos(2);cur_pos(1),cur_pos(2)-1;cur_pos(1)+1,cur_pos(2);cur_pos(1),cur_pos(2)+1];
  neighbor_pos((prod(neighbor_pos, 2) == 0),:) = [];
  bfind = 0;
  for i = 1:length(neighbor_pos(:,1))
    if img_boundary(neighbor_pos(i,1),neighbor_pos(i,2)) == 1 && sum(neighbor_pos(i,:) ~= pre_pos) 
        if scanned == 0
            res = res + 1;
            scanned = 1;
        end
        if accompany(neighbor_pos(i,1),neighbor_pos(i,2)) == 0 
          pre_pos = cur_pos;
          cur_pos = neighbor_pos(i,:);
          bfind = 1;
          break;
        end
    end
  end
  if bfind == 1
    continue;
  end
  %then the other four neighbors in diagonal
  diag_pos = [cur_pos(1)-1,cur_pos(2)-1;cur_pos(1)+1,cur_pos(2)-1;cur_pos(1)+1,cur_pos(2)+1;cur_pos(1)-1,cur_pos(2)+1];
  diag_pos((prod(diag_pos, 2) == 0),:) = [];
  for i = 1:length(diag_pos(:,1))
    if img_boundary(diag_pos(i,1),diag_pos(i,2)) == 1 && sum(diag_pos(i,:) ~= pre_pos)
        if scanned == 0
            res = res + sqrt(2);
            scanned = 1;
        end
        if accompany(diag_pos(i,1),diag_pos(i,2)) == 0
            pre_pos = cur_pos;
            cur_pos = diag_pos(i,:);
            bfind = 1;
            break;
        end
    end
  end
  if bfind == 1
    continue;
  end
  %check if there is anyother unscanned pixel
  for i = 1:img_size(1)
      for j = 1:img_size(2)
          if (img_boundary(i,j) == 1 && accompany(i,j) == 0)
              cur_pos = [i,j];
              pre_pos = [0,0];
              bfind = 1;
              break;
          end
      end
      if bfind == 1
        break;
      end
  end
  
end
