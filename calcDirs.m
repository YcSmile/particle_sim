function [dirs] = calcDirs(poses,throd_dis,dirs)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
% 让处于最近距离的点方向相反
% poses_r = repmat(throd_dis,)
%
% 原始数据
%     11    12
%     21    22
%     31    32
%  =============
%    转 kron(xx,[1,1,1]')
%     11    12
%     11    12
%     11    12
%     21    22
%     21    22
%     21    22
%     31    32
%     31    32
%     31    32
% ==========
%    pos_x_1 = kron(pos_x,[1,1,1])
%    reshape(pos_x_1',3,6)
%     11    12    21    22    31    32
%     11    12    21    22    31    32
%     11    12    21    22    31    32

poses_r = kron(poses,ones(size(poses,1),1));

% c
poses_c = repmat(poses,size(poses,1),1);


% 计算距离
poses_err = poses_r - poses_c;
poses_dis = sqrt(poses_err(:,1).^2 + poses_err(:,2).^2 );
poses_dis_mat = reshape(poses_dis,size(poses,1),size(poses,1));


% 计算sort
[poses_sort,poses_sort_index] = sort(poses_dis_mat,1);

% dis_match = poses_sort(2,:) < throd_dis;
% ind_match = poses_sort_index(2,:);
% for d_ = 1:size(poses,1)
%     
%     if dis_match(d_) == 1
%         dirs(d_) = atan2(poses(d_,2) -poses(ind_match(d_),2), poses(d_,1) -poses(ind_match(d_),1));
%     end
%     
% end

indexs = 1:size(poses,1);
indexs_match = indexs(poses_sort(2,:) < throd_dis);
ind_match = poses_sort_index(2,:);
% 进行并行运算
dirs(indexs_match) = atan2(poses(indexs_match,2) -poses(ind_match(indexs_match),2), poses(indexs_match,1) -poses(ind_match(indexs_match),1));

end

