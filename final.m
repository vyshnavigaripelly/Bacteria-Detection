blood = imread('images.jpg');

figure;imshow(blood)

d=im2bw(blood);
figure;imshow(d)

[r c p]=size(blood);

for i=1:r
    for j=1:c
        if(d(i,j)==0)
            blood(i,j,1)=255;
            blood(i,j,2)=0;
            blood(i,j,3)=0;
        end
    end
end

figure;imshow(blood)
            
       

B=rgb2gray(blood);

C=double(B);


A=B;
I=zeros(size(A));
I2=zeros(size(A));

%Filter Masks
F1=[0 1 0;1 -4 1; 0 1 0];
F2=[1 1 1;1 -8 1; 1 1 1];

%Padarray with zeros
A=padarray(A,[1,1]);
A=double(A);

%Implementation of the equation in Fig.D
for i=1:size(A,1)-2
    for j=1:size(A,2)-2
       
        I(i,j)=sum(sum(F1.*A(i:i+2,j:j+2)));
       
    end
end

I=uint8(I);
figure,imshow(I);title('Filtered Image');




for i=1:size(C,1)-2
    for j=1:size(C,2)-2
        %Sobel mask for x-direction:
        Gx=((2*C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(2*C(i,j+1)+C(i,j)+C(i,j+2)));
        %Sobel mask for y-direction:
        Gy=((2*C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(2*C(i+1,j)+C(i,j)+C(i+2,j)));
      
        %The gradient of the image
        %B(i,j)=abs(Gx)+abs(Gy);
        B(i,j)=sqrt(Gx.^2+Gy.^2);
      
    end
end
figure,imshow(B); title('Sobel gradient');


BW1=edge(rgb2gray(blood),'sobel', 0.11);
figure;imshow(BW1)

SE = strel('square', 3);

dd=imdilate(BW1,SE);
figure;imshow(dd)

BW5 = imfill(dd,'holes');
figure;imshow(BW5)