function [check, v, time] =  switch_lanes(check, v, time)
%
%  


[L, W] = size(check); %�ҵ�check�ĳ��ȺͿ��
found = find(check==1); %�ҵ�check��Ϊ1�ĵ�
if ~isempty(found)
    found = found(randperm(length(found)));
end
for k=found'
    if (check(k+1)~=0 | check(k-1)==1) & rem(k,L)~=floor(L/2)
        if (rand < .5 )
            if check(k+L) == 0 & check(k+L+1) == 0
                check(k+L) = 1;
                check(k) = 0;
                v(k+L) = v(k);
                v(k) = 0;
                time(k+L) = time(k);
                time(k) = 0;
            elseif check(k-L) == 0 & check(k-L+1) == 0
                check(k-L) = 1;
                check(k) = 0;
                v(k-L) = v(k);
                v(k) = 0;
                time(k-L) = time(k);
                time(k) = 0;
            end
        else
            if check(k-L) == 0 & check(k-L+1) == 0
                check(k-L) = 1;
                check(k) = 0;
                v(k-L) = v(k);
                v(k) = 0;
                time(k-L) = time(k);
                time(k) = 0;
            elseif check(k+L) == 0 & check(k+L+1) == 0
                check(k+L) = 1;
                check(k) = 0;
                v(k+L) = v(k);
                v(k) = 0;
                time(k+L) = time(k);
                time(k) = 0;
            end
        end
    end
end
