clc;
clear;
close all;

angNum = 34;
voltage = 18;
collect = zeros(angNum,voltage - 1);
date = '20210319';

filename = ['dataForPython\',date,'\trainTheta.csv'];
fid = fopen(filename,'w');
fprintf(fid,['%s','\n'],'theta');

filename = ['dataForPython\',date,'\trainVoltage.csv'];
fid2 = fopen(filename,'w');
fprintf(fid2,['%s',',','%s',',','%s',',','%s',',','%s',',','%s',',','%s',...
    ',','%s',',','%s',',','%s',',','%s',',','%s',',','%s',',','%s',...
    ',','%s',',','%s',',','%s','\n'],...
    'One','Two','Three','Four','Five','Six','Seven','Eight','Nine','Ten',...
    'Eleven','Twelve','Thirteen','Fourteen','Fifteen','Sixteen','Seventeen');

for n = 1:1:angNum
    for m = 1:1:voltage
        filepath = ['rawdata\20210319P\',num2str(m),'-',num2str(n),'.csv'];
        A = importdata(filepath);
        
        data = A.data;
        index = find(data(:,1) == 9.500000000000000e+09);
        dB(1,m) = data(index, 2);
    end
    
    dBdata = dB - dB(1,18);
    collect(n,:) = dBdata(1,1:17);  % ��ÿһ���Ƕ�Ϊһ�д洢����
    % ��������
    fprintf(fid,['%f','\n'],(n-1)*1.8);
    fprintf(fid2,['%f',',','%f',',','%f',',','%f',',','%f',',','%f',',','%f',...
        ',','%f',',','%f',',','%f',',','%f',',','%f',',','%f',',','%f',...
        ',','%f',',','%f',',','%f','\n'],dBdata(1,1:17));
end

%%�洢��֤���ݼ�
filename = ['dataForPython\',date,'\validTheta.csv'];
fid = fopen(filename,'w');
fprintf(fid,['%s','\n'],'theta');

filename = ['dataForPython\',date,'\validVoltage.csv'];
fid2 = fopen(filename,'w');
fprintf(fid2,['%s',',','%s',',','%s',',','%s',',','%s',',','%s',',','%s',...
    ',','%s',',','%s',',','%s',',','%s',',','%s',',','%s',',','%s',...
    ',','%s',',','%s',',','%s','\n'],...
    'One','Two','Three','Four','Five','Six','Seven','Eight','Nine','Ten',...
    'Eleven','Twelve','Thirteen','Fourteen','Fifteen','Sixteen','Seventeen');
for m = 1:1:17
    fprintf(fid,['%f','\n'],(m-1)*1.8);
    fprintf(fid2,['%f',',','%f',',','%f',',','%f',',','%f',',','%f',',','%f',...
        ',','%f',',','%f',',','%f',',','%f',',','%f',',','%f',',','%f',...
        ',','%f',',','%f',',','%f','\n'],collect(m,:));
end

%%�洢�������ݼ�
filename = ['dataForPython\',date,'\testTheta.csv'];
fid = fopen(filename,'w');
fprintf(fid,['%s','\n'],'theta');

filename = ['dataForPython\',date,'\testVoltage.csv'];
fid2 = fopen(filename,'w');
fprintf(fid2,['%s',',','%s',',','%s',',','%s',',','%s',',','%s',',','%s',...
    ',','%s',',','%s',',','%s',',','%s',',','%s',',','%s',',','%s',...
    ',','%s',',','%s',',','%s','\n'],...
    'One','Two','Three','Four','Five','Six','Seven','Eight','Nine','Ten',...
    'Eleven','Twelve','Thirteen','Fourteen','Fifteen','Sixteen','Seventeen');
for m = 18:1:34
    fprintf(fid,['%f','\n'],(m-1)*1.8);
    fprintf(fid2,['%f',',','%f',',','%f',',','%f',',','%f',',','%f',',','%f',...
        ',','%f',',','%f',',','%f',',','%f',',','%f',',','%f',',','%f',...
        ',','%f',',','%f',',','%f','\n'],collect(m,:));
    
end

%%��ͼ
figure
plot(dB)
grid on
xlabel('Voltage Distribution')
ylabel('dB')
title('Distribution of field intensity at different voltages at the same incident angel')



