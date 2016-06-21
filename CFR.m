function varargout = CFR(varargin)
% CFR M-file for CFR.fig
%      CFR, by itself, creates a new CFR or raises the existing
%      singleton*.
%
%      H = CFR returns the handle to a new CFR or the handle to
%      the existing singleton*.
%
%      CFR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CFR.M with the given input arguments.
%
%      CFR('Property','Value',...) creates a new CFR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CFR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CFR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CFR

% Last Modified by GUIDE v2.5 28-Mar-2013 15:22:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CFR_OpeningFcn, ...
                   'gui_OutputFcn',  @CFR_OutputFcn, ...
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


% --- Executes just before CFR is made visible.
function CFR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CFR (see VARARGIN)

% Choose default command line output for CFR
movegui(hObject,'center');
handles.output = hObject;
Y = imread('sign.jpg');
axes(handles.sign_axes);
imshow(Y);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CFR wait for user response (see UIRESUME)
uiwait(handles.figure1);
delete(gcf);


% --- Outputs from this function are returned to the command line.
function varargout = CFR_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%varargout{1} = handles.output;


% --- Executes on button press in pacr_pushbutton.
function pacr_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to pacr_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PAC;
pr=getappdata(0,'PACr');
% PACr_edit_Callback(handles.PACr_edit, eventdata, handles);
set(handles.pacr_edit,'string',num2str(pr));
set(handles.pacr_pushbutton,'userdata',pr);

% --- Executes on button press in rmcr_pushbutton.
function rmcr_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to rmcr_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rr = RMC;
set(handles.rmcr1_edit,'String',num2str(rr(1,1)));
set(handles.rmcr2_edit,'String',num2str(rr(2,1)));
set(handles.rmcr3_edit,'String',num2str(rr(3,1)));
set(handles.rmcr_pushbutton,'userdata',rr);

% --- Executes on button press in pacs_pushbutton.
function pacs_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to pacs_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PAC;
ps=getappdata(0,'PACr');
set(handles.pacs_edit,'string',num2str(ps));
set(handles.pacs_pushbutton,'userdata',ps);

% --- Executes on button press in rmcs_pushbutton.
function rmcs_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to rmcs_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rs = RMC;
set(handles.rmcs1_edit,'string',num2str(rs(1,1)));
set(handles.rmcs2_edit,'string',num2str(rs(2,1)));
set(handles.rmcs3_edit,'string',num2str(rs(3,1)));
set(handles.rmcs_pushbutton,'userdata',rs);


function pacr_edit_Callback(hObject, eventdata, handles)
% hObject    handle to pacr_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pacr_edit as text
%        str2double(get(hObject,'String')) returns contents of pacr_edit as a double


% --- Executes during object creation, after setting all properties.
function pacr_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pacr_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rmcr1_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rmcr1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rmcr1_edit as text
%        str2double(get(hObject,'String')) returns contents of rmcr1_edit as a double


% --- Executes during object creation, after setting all properties.
function rmcr1_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rmcr1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pacs_edit_Callback(hObject, eventdata, handles)
% hObject    handle to pacs_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pacs_edit as text
%        str2double(get(hObject,'String')) returns contents of pacs_edit as a double


% --- Executes during object creation, after setting all properties.
function pacs_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pacs_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rmcs1_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rmcs1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rmcs1_edit as text
%        str2double(get(hObject,'String')) returns contents of rmcs1_edit as a double


% --- Executes during object creation, after setting all properties.
function rmcs1_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rmcs1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cfr_pushbutton.
function cfr_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to cfr_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rs=get(handles.rmcs_pushbutton,'userdata');
rr=get(handles.rmcr_pushbutton,'userdata');
ps=get(handles.pacs_pushbutton,'userdata');
pr=get(handles.pacr_pushbutton,'userdata');
rs1 = rs(:,1)';
rr1 = rr(:,1)';
rs2 = rs(:,1)'./rs(:,2)';
rr2 = rr(:,1)'./rr(:,2)';
cfr1 = (rs1.*pr)./(rr1.*ps);
cfr2 = (rs2.*pr)./(rr2.*ps);
cfr = [cfr1;cfr2];
set(hObject,'userdata',cfr);
set(handles.cfr1_edit,'string',num2str(cfr(1,1)));
set(handles.cfr2_edit,'string',num2str(cfr(1,2)));
set(handles.cfr3_edit,'string',num2str(cfr(1,3)));
aver_cfr(cfr2,rr2,rs2);

function cfr1_edit_Callback(hObject, eventdata, handles)
% hObject    handle to cfr1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cfr1_edit as text
%        str2double(get(hObject,'String')) returns contents of cfr1_edit as a double


% --- Executes during object creation, after setting all properties.
function cfr1_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cfr1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rmcr2_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rmcr2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rmcr2_edit as text
%        str2double(get(hObject,'String')) returns contents of rmcr2_edit as a double


% --- Executes during object creation, after setting all properties.
function rmcr2_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rmcr2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rmcr3_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rmcr3_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rmcr3_edit as text
%        str2double(get(hObject,'String')) returns contents of rmcr3_edit as a double


% --- Executes during object creation, after setting all properties.
function rmcr3_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rmcr3_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rmcs2_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rmcs2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rmcs2_edit as text
%        str2double(get(hObject,'String')) returns contents of rmcs2_edit as a double


% --- Executes during object creation, after setting all properties.
function rmcs2_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rmcs2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rmcs3_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rmcs3_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rmcs3_edit as text
%        str2double(get(hObject,'String')) returns contents of rmcs3_edit as a double


% --- Executes during object creation, after setting all properties.
function rmcs3_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rmcs3_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cfr2_edit_Callback(hObject, eventdata, handles)
% hObject    handle to cfr2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cfr2_edit as text
%        str2double(get(hObject,'String')) returns contents of cfr2_edit as a double


% --- Executes during object creation, after setting all properties.
function cfr2_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cfr2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cfr3_edit_Callback(hObject, eventdata, handles)
% hObject    handle to cfr3_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cfr3_edit as text
%        str2double(get(hObject,'String')) returns contents of cfr3_edit as a double


% --- Executes during object creation, after setting all properties.
function cfr3_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cfr3_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function outputmenu_Callback(hObject, eventdata, handles)
% hObject    handle to outputmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
out_str = uigetdir('Select a directory ...');
rs = get(handles.rmcs_pushbutton,'userdata');
rr = get(handles.rmcr_pushbutton,'userdata');
ps = get(handles.pacs_pushbutton,'userdata');
pr = get(handles.pacr_pushbutton,'userdata');
cfr = get(handles.cfr_pushbutton,'userdata');
rs(:,2) = rs(:,1)./rs(:,2);
rr(:,2) = rr(:,1)./rr(:,2);
name = get(handles.nameedit,'string');
name_txt = strcat(name,'.txt');
name_txt = strcat(out_str,'/',name_txt);
fid = fopen(name_txt,'w+');
fwrite(fid,name);
fprintf(fid,'\n pr = %6.4f ps = %6.4f  \n',pr,ps);
fprintf(fid,'rr = %12.4f  %12.4f %12.4f  \n',rr);
fprintf(fid,'rs = %12.4f  %12.4f %12.4f \n',rs);
fprintf(fid,'cfr = %12.4f  %12.4f  %12.4f \n',cfr(1,:));
fprintf(fid,'cfr = %12.4f  %12.4f  %12.4f \n',cfr(2,:));
fclose(fid);
msgbox('Output Over','��ʾ','modal');

% --------------------------------------------------------------------
function exitmenu_Callback(hObject, eventdata, handles)
% hObject    handle to exitmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiresume(handles.figure1);



function nameedit_Callback(hObject, eventdata, handles)
% hObject    handle to nameedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nameedit as text
%        str2double(get(hObject,'String')) returns contents of nameedit as a double


% --- Executes during object creation, after setting all properties.
function nameedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nameedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function labelmenu_Callback(hObject, eventdata, handles)
% hObject    handle to labelmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.nameedit,'string','');
set(handles.pacr_edit,'string','');
set(handles.pacs_edit,'string','');
set(handles.rmcs1_edit,'string','');
set(handles.rmcs2_edit,'string','');
set(handles.rmcs3_edit,'string','');
set(handles.rmcr1_edit,'string','');
set(handles.rmcr2_edit,'string','');
set(handles.rmcr3_edit,'string','');
set(handles.cfr1_edit,'string','');
set(handles.cfr2_edit,'string','');
set(handles.cfr3_edit,'string','');
aver_cfr('close');
