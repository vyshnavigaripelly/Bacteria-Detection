function varargout = main(varargin)
% MAIN M-file for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
 
% Edit the above text to modify the response to help main
 
% Last Modified by GUIDE v2.5 05-Dec-2012 17:36:24
 
% Begin initialization code - DO NOT EDIT
 
 
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
 
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
 
 
% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)
 
% Choose default command line output for main
handles.output = hObject;
 
% Update handles structure
guidata(hObject, handles);
 
% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 
 
% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Get default command line output from handles structure
varargout{1} = handles.output;
 
 
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.jpg');
    if ~isequal(file, 0)
       k=imread(file);
       handles.YY = k;
z=k;
guidata(hObject,handles);
%guidata(hObject,handles);
       subplot(2,2,1),imshow(k);title('Original image');
       
    end
 
 
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
k=handles.YY;
j=rgb2gray(k);
handles.XX=j;
subplot(2,2,2),imshow(j);title('gray Image');
 
 
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ei=25;
st=35;
%k=10
k=ei*st;
I=handles.YY;
%I = imread('5.jpg');
%h=filter matrx
h = ones(ei,st) / k;
I1 = imfilter(I,h,'symmetric');
subplot(2,2,2), imshow(I1), title('Filtered Image');
 
 
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ei=25;
st=35;
%k=10
k=ei*st;
I=handles.YY;
%I = imread('5.jpg');
%h=filter matrx
h = ones(ei,st) / k;
I1 = imfilter(I,h,'symmetric');
IG=rgb2gray(I1);
%Converting to BW
I11 = imadjust(IG,stretchlim(IG),[]);
level = graythresh(I11);
BWJ = im2bw(I11,level);
dim = size(BWJ)
IN=ones(dim(1),dim(2));
BW=xor(BWJ,IN);  %inverting
subplot(2,2,2), imshow(BW), title('OutPut');
 
 
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ei=2;
st=3;
%k=10
k=ei+st;
I=handles.YY;
%I = imread('5.jpg');
%h=filter matrx
h = ones(ei,st) / k;
I1 = imfilter(I,h,'symmetric');
subplot(2,2,2), imshow(I1), title('Linear contrast');
 
 
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ei=2;
st=5;
%k=10
k=ei+st;
I=handles.YY;
%I = imread('5.jpg');
%h=filter matrx
h = ones(ei,st) / k;
I1 = imfilter(I,h,'symmetric');
subplot(2,2,2), imshow(I1), title('Ritrive Linear ');
msgBox('cancer detacted');
 
 
 
 
% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hint: get(hObject,'Value') returns toggle state of checkbox2
merged=handles.merged;
axes(handles.axes4)
iptsetpref('ImshowAxesVisible', 'on')
imagesc(uint8(merged))
 
 
% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
clear all
i=imread('5.jpg');
id=i;
id=im2double(id);
[h,s,v]=rgb2hsv(id);
v=im2double(v);
m=mean(mean(v));
while (abs(m-0.5)>0.1)
    if m<0.5
        v=(v).^(1-m);
    else
        v=v.^(1/(1-m));
    end
    m=mean(mean(v));
end
ID(:,:,1)=h;ID(:,:,2)=s;ID(:,:,3)=v;
idhsv=hsv2rgb(ID);
 
id1=im2double(imread('5.jpg'));
 
clear i;
i=uint8(idhsv*455);
id_cool=idhsv;
idr=idhsv(:,:,1);idg=idhsv(:,:,2);idb=idhsv(:,:,3);
m=mean(mean(idr));
  
while (abs(m-0.5)>0.1)
    if m<0.5
        idb=(idb).^(1-m);
    else
        idb=idb.^(1/(1-m));
    end
    m=mean(mean(idb));
end
 
 
idr_cool=id_cool(:,:,1);idg_cool=id_cool(:,:,2);idb_cool=id_cool(:,:,3);
cnt1=1;mm=mean(mean(idr_cool));
  
mm=mean(mean(idb_cool));
while (abs(mm-0.5)>0.00009)
    idb_cool=idb_cool.^(log(0.5)/log(mm));
    mm=mean(mean(idb_cool));
end
 
ieqr=im2double(histeq(i(:,:,1)));ieqg=im2double(histeq(i(:,:,2)));
ieqb=im2double(histeq(i(:,:,3)));
id(:,:,1)=idr;id(:,:,2)=idg;id(:,:,3)=idb;
id_cool(:,:,1)=idr_cool;id_cool(:,:,2)=idg_cool;id_cool(:,:,3)=idb_cool;
ieq(:,:,1)=ieqr;ieq(:,:,2)=ieqg;ieq(:,:,3)=ieqb;
  
  
subplot(2,2,2);imshow(uint8(ieq*255));;xlabel('HSI')
 
 
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)clc;
clc
clear all
i=imread('5.jpg');
id=i;
id=im2double(id);
[h,s,v]=rgb2hsv(id);
v=im2double(v);
m=mean(mean(v));
while (abs(m-0.5)>0.1)
    if m<0.5
        v=(v).^(1-m);
    else
        v=v.^(1/(1-m));
    end
    m=mean(mean(v));
end
ID(:,:,1)=h;ID(:,:,2)=s;ID(:,:,3)=v;
idhsv=hsv2rgb(ID);
 
id1=im2double(imread('5.jpg'));
 
clear i;
i=uint8(idhsv*790);
id_cool=idhsv;
idr=idhsv(:,:,1);idg=idhsv(:,:,2);idb=idhsv(:,:,3);
m=mean(mean(idr));
  
while (abs(m-0.5)>0.1)
    if m<0.5
        idb=(idb).^(1-m);
    else
        idb=idb.^(1/(1-m));
    end
    m=mean(mean(idb));
end
 
 
idr_cool=id_cool(:,:,1);idg_cool=id_cool(:,:,2);idb_cool=id_cool(:,:,3);
cnt1=1;mm=mean(mean(idr_cool));
  
mm=mean(mean(idb_cool));
while (abs(mm-0.5)>0.00009)
    idb_cool=idb_cool.^(log(0.5)/log(mm));
    mm=mean(mean(idb_cool));
end
 
ieqr=im2double(histeq(i(:,:,1)));ieqg=im2double(histeq(i(:,:,2)));
ieqb=im2double(histeq(i(:,:,3)));
id(:,:,1)=idr;id(:,:,2)=idg;id(:,:,3)=idb;
id_cool(:,:,1)=idr_cool;id_cool(:,:,2)=idg_cool;id_cool(:,:,3)=idb_cool;
ieq(:,:,1)=ieqr;ieq(:,:,2)=ieqg;ieq(:,:,3)=ieqb;
 
  
  
subplot(2,2,2);imshow(uint8(ieq*255));;xlabel('K-means')
 
 
% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.jpg');
    if ~isequal(file, 0)
       k=imread(file);
       handles.YY = k;
z=k;
guidata(hObject,handles);
%guidata(hObject,handles);
       subplot(2,2,4),imshow(k);title('Original image');
       
    end
 
 
  
 
 
% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ei=2;
st=1;
%k=10
k=ei+st;
I=handles.YY;
%I = imread('5.jpg');
%h=filter matrx
h = ones(ei,st) / k;
I1 = imfilter(I,h,'symmetric');
subplot(2,2,4), imshow(I1), title('Partical Contrast');
 
 
% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
clear all
i=imread('5.jpg');
id=i;
id=im2double(id);
[h,s,v]=rgb2hsv(id);
v=im2double(v);
m=mean(mean(v));
while (abs(m-0.5)>0.1)
    if m<0.5
        v=(v).^(1-m);
    else
        v=v.^(1/(1-m));
    end
    m=mean(mean(v));
end
ID(:,:,1)=h;ID(:,:,2)=s;ID(:,:,3)=v;
idhsv=hsv2rgb(ID);
 
id1=im2double(imread('5.jpg'));
 
clear i;
i=uint8(idhsv*524);
id_cool=idhsv;
idr=idhsv(:,:,1);idg=idhsv(:,:,2);idb=idhsv(:,:,3);
m=mean(mean(idr));
  
while (abs(m-0.8)>0.1)
    if m<0.8
        idb=(idb).^(1-m);
    else
        idb=idb.^(1/(1-m));
    end
    m=mean(mean(idb));
end
 
 
idr_cool=id_cool(:,:,1);idg_cool=id_cool(:,:,2);idb_cool=id_cool(:,:,3);
cnt1=1;mm=mean(mean(idr_cool));
  
mm=mean(mean(idb_cool));
while (abs(mm-0.5)>0.00100)
    idb_cool=idb_cool.^(log(0.5)/log(mm));
    mm=mean(mean(idb_cool));
end
 
ieqr=im2double(histeq(i(:,:,1)));ieqg=im2double(histeq(i(:,:,2)));
ieqb=im2double(histeq(i(:,:,3)));
id(:,:,1)=idr;id(:,:,2)=idg;id(:,:,3)=idb;
id_cool(:,:,1)=idr_cool;id_cool(:,:,2)=idg_cool;id_cool(:,:,3)=idb_cool;
ieq(:,:,1)=ieqr;ieq(:,:,2)=ieqg;ieq(:,:,3)=ieqb;
  
  
subplot(2,2,4);imshow(uint8(ieq*255));xlabel('HSI')
 
 
 
% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
clear all
i=imread('5.jpg');
id=i;
id=im2double(id);
[h,s,v]=rgb2hsv(id);
v=im2double(v);
m=mean(mean(v));
while (abs(m-0.5)>0.1)
    if m<0.5
        v=(v).^(1-m);
    else
        v=v.^(1/(1-m));
    end
    m=mean(mean(v));
end
ID(:,:,1)=h;ID(:,:,2)=s;ID(:,:,3)=v;
idhsv=hsv2rgb(ID);
 
id1=im2double(imread('5.jpg'));
 
clear i;
i=uint8(idhsv*700);
id_cool=idhsv;
idr=idhsv(:,:,1);idg=idhsv(:,:,2);idb=idhsv(:,:,3);
m=mean(mean(idr));
  
while (abs(m-0.5)>0.1)
    if m<0.5
        idb=(idb).^(1-m);
    else
        idb=idb.^(1/(1-m));
    end
    m=mean(mean(idb));
end
 
 
idr_cool=id_cool(:,:,1);idg_cool=id_cool(:,:,2);idb_cool=id_cool(:,:,3);
cnt1=1;mm=mean(mean(idr_cool));
  
mm=mean(mean(idb_cool));
while (abs(mm-0.5)>0.00100)
    idb_cool=idb_cool.^(log(0.5)/log(mm));
    mm=mean(mean(idb_cool));
end
 
ieqr=im2double(histeq(i(:,:,1)));ieqg=im2double(histeq(i(:,:,2)));
ieqb=im2double(histeq(i(:,:,3)));
id(:,:,1)=idr;id(:,:,2)=idg;id(:,:,3)=idb;
id_cool(:,:,1)=idr_cool;id_cool(:,:,2)=idg_cool;id_cool(:,:,3)=idb_cool;
ieq(:,:,1)=ieqr;ieq(:,:,2)=ieqg;ieq(:,:,3)=ieqb;
  
  
subplot(2,2,4);imshow(uint8(ieq*255));xlabel('Thresholding')
 
 
% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
 
% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ei=20;
st=20;
%k=10
k=ei*st;
I=handles.YY;
%I = imread('5.jpg');
%h=filter matrx
h = ones(ei,st) / k;
I1 = imfilter(I,h,'symmetric');
subplot(2,2,4), imshow(I1), title('Filtered Image');
 
 
% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ei=15;
st=15;
%k=10
k=ei*st;
I=handles.YY;
%I = imread('5.jpg');
%h=filter matrx
h = ones(ei,st) / k;
I1 = imfilter(I,h,'symmetric');
IG=rgb2gray(I1);
%Converting to BW
I11 = imadjust(IG,stretchlim(IG),[]);
level = graythresh(I11);
BWJ = im2bw(I11,level);
dim = size(BWJ)
IN=ones(dim(1),dim(2));
BW=xor(BWJ,IN);  %inverting
subplot(2,2,4), imshow(BW), title('OutPut');
 
 
 
% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ei=3;
st=3;
%k=10
k=ei+st;
I=handles.YY;
%I = imread('5.jpg');
%h=filter matrx
h = ones(ei,st) / k;
I1 = imfilter(I,h,'symmetric');
subplot(2,2,4), imshow(I1), title('Ritrive Linear ');
msgBox(' cancer detacted ');
 
 
 
% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Now we create a menu for the figure itself.
robo = java.awt.Robot;
t = java.awt.Toolkit.getDefaultToolkit();
rectangle = java.awt.Rectangle(t.getScreenSize());
image = robo.createScreenCapture(rectangle);
filehandle = java.io.File('save.jpg');
javax.imageio.ImageIO.write(image,'jpg',filehandle);
