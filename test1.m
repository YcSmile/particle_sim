% 模拟粒子碰撞

% 点
part = [3,1;1,3];
% 方向
d = 2 * pi * rand(2,1);

figure(2)
clf
hold on


% 方向
scatter(part(:,1),part(:,2),'r','filled')
line([3 2],[1  3]);
line([1 3],[3  2]);
axis([0 4 0 4]);


% 计算法线 
part_1 = part(2,:) - part(1,:);

xit =  atan2(part_1(1,2),part_1(1,2));
xit
% 绘制方向
ss = (part(1,:) + part(2,:))/2;
aas = ss + [cos(xit) sin(xit)];

% 连线方向

% 碰撞模型
% 在连线方向速度互换
% 法线方向 速度不变
% https://www.cnblogs.com/mumuxinfei/p/4414281.html

scatter(ss(1),ss(2));
line([ss(1,1) aas(1)],[ss(1,2) aas(2)]);


grid on