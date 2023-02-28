clc,clear all , close all
res = imread('indir.jpg');
res = double(res);
%%lbp uygula
for i = 1:size(res,1)-2
    for j=1:size(res,2)-2
        m=res(i:i+2,j:j+2); 
        sayac = 1;
        merkez = m(2,2); 
        for ii=1:3
            for jj=1:3
                if ii~= 2 || jj~= 2 
                    bit(sayac) =m(ii,jj)>=merkez; 
                    sayac = sayac+1; 
                end
            end
        end
        %%desimale çevirme
        desimal(i,j) = 0;
        for ii=1:8
            desimal(i,j)=desimal(i,j)+double(bit(ii))*2^(ii-1);
        end
    end
end
%% histogram çıkart
histo = zeros(1,2^8);
for i = 1 : size(desimal,1)
    for j = i : size(desimal,2)
        histo(desimal(i,j)+1) = histo(desimal(i+j)+1)+1;
    end
end
plot(histo);
