function varargout = center(varargin)
% CENTER MATLAB code for center.fig
%      CENTER, by itself, creates a new CENTER or raises the existing
%      singleton*.
%
%      H = CENTER returns the handle to a new CENTER or the handle to
%      the existing singleton*.
%
%      CENTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CENTER.M with the given input arguments.
%
%      CENTER('Property','Value',...) creates a new CENTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before center_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to center_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help center

% Last Modified by GUIDE v2.5 01-Nov-2015 15:40:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @center_OpeningFcn, ...
                   'gui_OutputFcn',  @center_OutputFcn, ...
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


% --- Executes just before center is made visible.
function center_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to center (see VARARGIN)

% Choose default command line output for center
movegui(hObject,'center');
handles.output = hObject;
handles.Y = varargin{1};
handles.ctr = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes center wait for user response (see UIRESUME)
uiwait(handles.center_fig);



% --- Outputs from this function are returned to the command line.
function varargout = center_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
% varargout{1} = handles.output;
varargout{1} = handles.ctr;
varargout{2} = handles.Z;
delete(gcf)
% --- Executes on button press in center_btn.
function center_btn_Callback(hObject, eventdata, handles)
% hObject    handle to center_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Y_org = handles.Y;
% size_x = size(Y_org,2);
Z = str2double(get(handles.center_edt,'string'));
handles.Z = Z;
Y_dis = imcrop(Y_org(:,:,Z),[21 21 24 24]);
Y_dis = imresize(Y_dis,4);
Y_dis = mat2gray(Y_dis);
axes(handles.axes1)
imshow(Y_dis);

[pt_x, pt_y] = getpts(handles.axes1);
pt_in = [pt_x(1);pt_y(1)];  %the point inside
pt_out = [pt_x(2);pt_y(2)];%the point outside

[edge_in, edge_out] = edge_pt(Y_dis,pt_in,pt_out);
man_rbtn_val = get(handles.man_rbtn,'Value');
if man_rbtn_val == 1
    edge_out = [pt_x(2:end)' pt_x(2) pt_x(3) pt_x(4);...
        pt_y(2:end)' pt_y(2) pt_y(3) pt_y(4)];
    edge_out = Bspline(edge_out);
end
setappdata(0,'edge',edge_out);
hold on
plot(edge_in(1,:),edge_in(2,:),'g-');
plot(edge_out(1,:),edge_out(2,:),'g-');
sc = [0.000001 0.0000001];
di = rand(2,10);
commandwindow;
ctr = spm_powell(pt_in',di,sc,@optfun,edge_in(1,:),edge_in(2,:));
display('the iteration is over ....');
handles.ctr = 20.5 + ctr./4; %this place 0.5 ????
plot(ctr(1),ctr(2),'ro');
guidata(hObject,handles);

function center_edt_Callback(hObject, eventdata, handles)
% hObject    handle to center_edt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of center_edt as text
%        str2double(get(hObject,'String')) returns contents of center_edt as a double


% --- Executes during object creation, after setting all properties.
function center_edt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to center_edt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in OK_btn.
function OK_btn_Callback(hObject, eventdata, handles)
% hObject    handle to OK_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiresume(handles.center_fig);

function [edge_in, edge_out] = edge_pt(Y_dis,pt_in,pt_out)
%use bezier method to fit the edge.

val = (pt_out(1) - pt_in(1)).^2 + (pt_out(2) - pt_in(2)).^2;
t = 1;
for theta = linspace(0,2*pi,60);   % 60 directions is a proper number.
    l = 1;
    for k = linspace(0,1,100)
        newp = k*((sqrt(val)+1)*(cos(theta) + 1i*sin(theta))) + pt_in(1) + pt_in(2)*1i;
        x_new = real(newp);
        y_new = imag(newp);

        r_new = round(y_new);
        c_new = round(x_new);
        Val(l) = Y_dis(r_new,c_new);
        l = l + 1;
    end
    diff_val = diff(Val);
    [max_v max_i] = max(diff_val);
    [min_v min_i] = min(diff_val);
    if (round(mod(t,2)) == 0)
        newp1(round(t/2)) = (max_i + 4)/100*((sqrt(val)+2)*(cos(theta) + 1i*sin(theta))) + pt_in(1) + pt_in(2)*1i;
    end 
    newp2(t) = (min_i)/100*((sqrt(val)+2)*(cos(theta) + 1i*sin(theta))) + pt_in(1) + pt_in(2)*1i;
    t = t + 1;
end
newp1(:,end + 1) = newp1(:,1);
nnewp1 = newp1(:,3:end-2);
nnewp1(:,end+1) = nnewp1(:,1);

nnewp2 = newp2(:,3:end-2);
nnewp2(:,end+1) = nnewp2(:,1);
roix_in = real(nnewp1);
roiy_in = imag(nnewp1);
roix_out = real(nnewp2);
roiy_out = imag(nnewp2);

edge_in = Bessel([roix_in;roiy_in]);
edge_out = Bessel([roix_out;roiy_out]);


% --- Executes on button press in man_rbtn.
function man_rbtn_Callback(hObject, eventdata, handles)
% hObject    handle to man_rbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of man_rbtn
