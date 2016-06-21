function varargout = RMC(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RMC_OpeningFcn, ...
                   'gui_OutputFcn',  @RMC_OutputFcn, ...
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


% --- Executes just before RMC is made visible.
function RMC_OpeningFcn(hObject, eventdata, handles, varargin)

movegui(hObject,'center');
handles.V = [];
guidata(hObject, handles);

uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = RMC_OutputFcn(hObject, eventdata, handles) 

try
    I = get(handles.pushbutton2,'UserData');
    varargout{1} = I;
end
delete(gcf);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

filename = spm_select(1,'image');
filename = cellstr(filename);
V = spm_vol(filename{1});
handles.V = V;
Y_org = spm_read_vols(V);
[ctr, n] = center(Y_org);
axes(handles.axes1)
imshow(mat2gray(Y_org(:,:,n)));
hold on
plot(ctr(1),ctr(2),'ro');
set(hObject,'userdata',ctr);
guidata(hObject,handles);

function edit2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

V = handles.V;
ctr = get(handles.pushbutton1,'userdata');
n0 = str2num(get(handles.edit2,'string'));
n1 = str2num(get(handles.edit3,'string'));

if isempty(n0)
    errordlg('You should input the frames !!');
    return;
end
edge_out = getappdata(0,'edge');
mask_temp = poly2mask(edge_out(1,:),edge_out(2,:),96,96);
mask_temp = imresize(mask_temp,0.25);
mask = double(0);
mask = repmat(mask,[64,64]);
mask(21:44,21:44) = mask_temp;
[Y_ext, Y_cnt] = rmc_aux(V,n0,n1,mask);  %Y_ext used to display while Y_cnt used to count radiological count.
value = get(handles.chs_rbtn,'Value');
if value == 1
    Extract_M1(Y_ext);
end
% axes(handles.axes1)
% dis_Y = spm_read_vols(V);
% imshow(mat2gray(dis_Y(:,:,n1 - 1)));
% hold on
% 
% Y = tfcexinjitiqu(V,'hehe');
% [Y_add center] = xuanzexinji(Y,n0,n1);
% 
% plot(center(1),center(2),'ro');
I = count_Callback(handles,Y_cnt,ctr);
set(handles.pushbutton2,'UserData',I);
set(handles.LAD_edit,'string',num2str(I(1,1)));
set(handles.LCX_edit,'string',num2str(I(2,1)));
set(handles.RCA_edit,'string',num2str(I(3,1)));



function RCA_edit_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function RCA_edit_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)

uiresume(handles.figure1);



function LCX_edit_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function LCX_edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LAD_edit_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function LAD_edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function I = count_Callback(handles,Y,center)

axes(handles.axes1);
I_1 = [];
I_2 = [];
I_3 = [];
x0 = center(1);
y0 = center(2);
%---------------------------------------------------------------------%
N = 64;
M = 64;
for i = 1:N
    for j = 1:M
        t = i - x0;
        p = j - y0;
        [theta,rho] = cart2pol(t,p);
        Theta(i,j) = theta;
        Rho(i,j) = rho; 
    end
end
%---------------------------------------------------------------------%

I1 = 0;
I2 = 0;
I3 = 0;
Y_org = Y;
Y1 = Y_org;
lad_N = 1;
lcx_N = 1;
rca_N = 1;
for k = 1:N
     for l = 1:M
%              if((Theta(k,l) > (-3.1416)) & (Theta(k,l) < (-1.2)) & (Rho(k,l) < r_out))
           if((((Theta(k,l) > (-1.57)) & (Theta(k,l) <= 0)) | ...
             ((Theta(k,l) < 0.52) & (Theta(k,l) > 0))))
             [x,y] = pol2cart(Theta(k,l),Rho(k,l));
             x = round(x + x0);
             y = round(y + y0);
             if(Y1(y,x) ~= 0)
                 plot(x,y,'g*')
                 I1(lad_N) =  sum(sum(Y1(y,x)));
                 lad_N = lad_N + 1;
             end

%              if((((Theta(k,l) > (-0.78)) & (Theta(k,l) <= 0)) | ...
%                  ((Theta(k,l) < 0.78) & (Theta(k,l) > 0))) & (Rho(k,l) < r_out))
            elseif(((Theta(k,l) > (0.8)) & (Theta(k,l) <= 2.6)))
             [x,y] = pol2cart(Theta(k,l),Rho(k,l));
             x = round(x + x0);
             y = round(y + y0);
             if(Y1(y,x) ~= 0)
                 plot(x,y,'b*')
                 I2(lcx_N) =  sum(sum(Y1(y,x)));
                 lcx_N = lcx_N + 1;
             end

%               if((Theta(k,l) > (1.4)) & ...
%                       (Theta(k,l) < 2.6) & (Rho(k,l) < r_out))
           elseif((((Theta(k,l) > (2.8)) & (Theta(k,l) <= 3.15)) | ...
             ((Theta(k,l) < -2) & (Theta(k,l) > -3.14))))
             [x,y] = pol2cart(Theta(k,l),Rho(k,l));
             x = round(x + x0);
             y = round(y + y0);
             if(Y1(y,x) ~= 0)
                 plot(x,y,'r*')
                 I3(rca_N) =  sum(sum(Y1(y,x)));
                 rca_N = rca_N + 1;
             end
         end
     end
end 
I_1 = [I_1,I1];
I_2 = [I_2,I2];
I_3 = [I_3,I3];

sizeI1 = size(I_1);
sizeI2 = size(I_2);
sizeI3 = size(I_3);
I = [sum(I_1) sizeI1(2);sum(I_2) sizeI2(2);sum(I_3) sizeI3(2)];


% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in RMC_checkbox.
function RMC_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to RMC_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RMC_checkbox


% --- Executes on button press in chs_rbtn.
function chs_rbtn_Callback(hObject, eventdata, handles)
% hObject    handle to chs_rbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chs_rbtn
