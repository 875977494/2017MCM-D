function [check, v, time, scount, ttime,sscount] = clear_boundary(B,check, v, time)
%
% clear_boundary  remove the people of the exit cell 删除退出单元格的汽车

scount = 0;
ttime = [];
sscount=0;
[a,b] = size(check);  %a是长度 b是宽度
for i=3*B/4+2:b-1
    if check(a,i)>0
        sscount=sscount+1;
    end
end
for i = 2:b-1  %选择有效区域
    if check(a,i) > 0  
        scount = scount + 1;
        ttime(scount) = time(a,i);
        check(a,i) = 0;
        v(a,i) = 0;
        time(a,i) = 0;
    end
end
