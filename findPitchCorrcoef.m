%inx:       �����������������
%Pos:       ����Pos�㴦�Ļ�������
%minpth:  ����������Сֵ��Ӧ�Ĳ�������
%maxpth:  �����������ֵ��Ӧ�Ĳ�������
%plotfig:   Ϊ1ʱ�����������ͼ
%
%out:       �Բ�ͬ��������Ϊ�������ڵ�����ϵ���������ֵ��Ͷ�Ӧ��������
function [out] = findPitchCorrcoef(inx,Pos,minpth,maxpth,plotfig)
[line,row] = size(inx);
out = 0;
if(line<Pos+ceil(maxpth))
    return;
end
if(Pos<ceil(maxpth))
    return;
end
out=zeros(ceil(maxpth),1);
for i=floor(minpth):ceil(maxpth)
    xa = inx(Pos-i:Pos);           %��iΪ֡����Pos��Ϊ�ֽ磬ȡ��ǰ����֡����
    xb = inx(Pos+1:Pos+1+i);
    if(max(abs(xa))<0.005)       %Ϊ��С������������С��0.04ʱ��Ϊ����������������
        continue;
    end
    if(max(abs(xb))<0.005)
        continue;
    end
    corrcoefxab = corrcoef(xa,xb);
    out(i)=corrcoefxab(2,1);
end
if(plotfig == 1)
    figure;
    subplot(2,1,1);
    plot(inx,'.-');
    grid on;
    subplot(2,1,2);
    plot(out,'*-');
    grid on;    
end


