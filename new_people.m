function [check, v, number_people] = new_people(Arrival, dt, check, v, vmax)

% Find the empty lanes of the entrance where a new car can be add.

unoccupied = find(check(1,:) == 0);  %�ҵ����õ����е�
n = length(unoccupied); % number of available lanes  %����ͨ��������
number_people =min( poissrnd(Arrival*dt,1), n);  %�ÿͳ��ָ����ǲ��ɷֲ�
if number_people > 0 
    x = randperm(n);  %�������ظ����� 
    for i = 1:number_people
         check(1, unoccupied(x(i))) = 1;
         v(1, unoccupied(x(i))) = vmax;
    end
end
