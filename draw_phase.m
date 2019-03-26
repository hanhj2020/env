function ret=draw_phase(angle,r,Name) %draw three phase in polar
%draw_phase(angleA,angleB,angleC,rA,rB,rC)
if length(angle)<3
	disp('error:angle must be 3');
	return;
else
	l1=length(angle);
end
if length(r)<3
	disp('error:r must be 3');
	return;
else
	l2=length(r);
end
save_axis=axis;

[m,n]=size(Name);
if m<3
	disp('error:Nmae must be 3');
	return;
else
	l3=m;
end

v(1).angle=angle(1);
v(1).r=r(1);
v(2).angle=angle(2);
v(2).r=r(2);
v(3).angle=angle(3);
v(3).r=r(3);
if(l1>=4&&l2>=4&&l3>=4)
	v(4).angle=angle(4);
	v(4).r=r(4);
else
	v(4).angle=0;
	v(4).r=0;
end


for i=1:4
    v(i).angle=v(i).angle/180*pi;
end
[xx,yy]=pol2cart(v(1).angle,v(1).r);%将极坐标转换成笛卡尔坐标
x(1)=xx;y(1)=yy;
[xx,yy]=pol2cart(v(2).angle,v(2).r);
x(2)=xx;y(2)=yy;
[xx,yy]=pol2cart(v(3).angle,v(3).r);
x(3)=xx;y(3)=yy;
[xx,yy]=pol2cart(v(4).angle,v(4).r);
x(4)=xx;y(4)=yy;
v_r=[v(1).r v(2).r v(3).r v(4).r];
max_v_r=max(v_r);
index=find(v_r==max_v_r);
polar(v(index(1)).angle,v(index(1)).r);
hold on;
drawvec([x(1),y(1)]','y');
text(x(1),y(1),Name(1,:),'fontweight','bold');
hold on;
drawvec([x(2),y(2)]','g');
text(x(2),y(2),Name(2,:),'fontweight','bold');
hold on;
drawvec([x(3),y(3)]','r');
text(x(3),y(3),Name(3,:),'fontweight','bold');
hold on;
drawvec([x(4),y(4)]','k');
text(x(4),y(4),Name(4,:),'fontweight','bold');
axis equal;

axis(save_axis);
hold off;
