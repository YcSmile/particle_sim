% 创建点
points_num = 50;
points_dis = 50;
points_move = 5;
points = points_dis * rand(points_num,2);
points_dir = pi * 2 * rand(points_num,1);

figure(1)
hold on

grid on
count = 0;
while count < 200
    % 控制运动方向
    points_dir = calcDirs(points,50,points_dir);
    clf
    
    % 进行运动
%     points(:,1) = points(:,1) + points_move * cos(points_dir);
%     points(:,2) = points(:,2) + points_move * sin(points_dir);
    points = points + points_move * [cos(points_dir) sin(points_dir)];
    points_netx = points + points_move * 3 * [cos(points_dir) sin(points_dir)];
    scatter(points(:,1),points(:,2),'r','filled');
    
%     for id = 1:size(points,1)
%         text(points(id,1) + 5,points(id,2) + 5,num2str(id));
%     end
    ids = (1:size(points,1))';
    text(points(:,1) + 5,points(:,2) + 5,num2str(ids));
    % 标记方向
    line([points(:,1),points_netx(:,1)]',[points(:,2),points_netx(:,2)]','color','g')
    axis([-500,500,-500,500]);
    grid on
    pause(0.1)
    count = count +  1;
    
end