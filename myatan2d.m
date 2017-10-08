function v=myatan2d(y,x)

if x>0
    v=atand(y/x);
end
if y>=0 & x<0
    v=pi+atand(y/x);
end
if y<0 & x<0
    v=-pi+atand(y/x);
end
if y>0 & x==0
    v=90;
end
if y<0 & x==0
    v=-90;
end
if v<0
    v=v+360;
end
end