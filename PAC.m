function varargout = PAC(varargin)
% PAC M-file for PAC.fig
%      PAC, by itself, creates a new PAC or raises the existing
%      singleton*.
%
%      H = PAC returns the handle to a new PAC or the handle to
%      the existing singleton*.
%
%      PAC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAC.M with the given input arguments.
%
%      PAC('Property','Value',...) creates a new PAC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PAC_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PAC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PAC
global ROI_nbb;
% Last Modified by GUIDE v2.5 22-Mar-2012 19:15:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PAC_OpeningFcn, ...
                   'gui_OutputFcn',  @PAC_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before PAC is made visible.
function PAC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PAC (see VARARGIN)

% Choose default command line output for PAC
% set(gcf,'windowbuttonmotionfcn',PAC_figure_WindowButtonMotionFcn);
handles.output = hObject;
movegui(hObject,'center');
% Update handles structure
guidata(hObject, handles);
uiwait(gcf);

 delete(handles.PAC_figure);

% UIWAIT makes PAC wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = PAC_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
% varargout{1} = handles.output;


% --- Executes on button press in file_pushbutton.
function file_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to file_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename filepath]=uigetfile('*.*',' ');
str=[filepath,filename];
set(handles.file_pushbutton,'userdata',str);
set(handles.text5,'string',filename);


% --- Executes during object creation, after setting all properties.
function frame_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frame_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function frame_edit_Callback(hObject, eventdata, handles)
% hObject    handle to frame_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frame_edit as text
%        str2double(get(hObject,'String')) returns contents of frame_edit as a double


% --- Executes during object creation, after setting all properties.
function time_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function time_edit_Callback(hObject, eventdata, handles)
% hObject    handle to time_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time_edit as text
%        str2double(get(hObject,'String')) returns contents of time_edit as a double
t=str2num(get(handles.time_edit,'String'));
set(handles.time_edit,'UserData',t);


% --- Executes during object creation, after setting all properties.
function popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in popupmenu.
function popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu
rect=get(handles.frame_edit,'UserData');
% t=get(handles.time_edit,'userdata');

str=get(handles.file_pushbutton,'userdata');
Y = dicomread(str);
n = size(Y,4);
t = 1:n;
cla
% uicontrol('style','text','units','normalized','fontunits','normalized','string',' ','position',[0.200,0.804,0.202,0.057]);
M=zeros(1,length(t));
for i=1:(length(t)-1)
    X=dicomread(str,'Frames',i);
    I=imcrop(X,rect);
%     M(1,(i+1))=sum(sum(I))/6;   %����ȥ��6�����ص㡣ȡƽ��
M(1,(i+1))=sum(sum(I));           %ѡ1�����ص�����
end
values=get(handles.popupmenu,'value');
t1=linspace(min(t),max(t),1200);
switch values
    case 1
       set(handles.axes1,'xlim',[0,max(t)]);
       set(handles.axes1,'ylim',[0,max(M)]);
       plot(t,M);
       xlabel('t', 'FontSize', 20);
       ylabel('counts', 'FontSize', 20);
%        legend('ԭ��ݵõ�������?);
       area=trapz(t,M);
       set(handles.popupmenu,'userdata',area);
     case 2
       M1=interp1(t,M,t1,'spline');
       set(handles.axes1,'xlim',[0,max(t1)]);
       set(handles.axes1,'ylim',[0,max(M1)]);
       plot(t1,M1);
       xlabel('t', 'FontSize', 20);
       ylabel('counts', 'FontSize', 20);
       area=trapz(t1,M1);
       set(handles.popupmenu,'userdata',area);
%        legend('������������ֵ����');
     case 3
       p=polyfit(t,M,5);
       M2=polyval(p,t1);
       xlabel('t', 'FontSize', 20);
       ylabel('counts', 'FontSize', 20);
       set(handles.axes1,'xlim',[0,max(t1)]);
       set(handles.axes1,'ylim',[0,max(M2)]);
       plot(t1,M2);
       area=trapz(t1,M2);
       set(handles.popupmenu,'userdata',area);
%        legend('����ʽ�������?);
%    otherwise
%        bresk;
end
        

% --- Executes on button press in result_pushbutton.
function result_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to result_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
result_edit_Callback(handles.result_edit, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function result_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function result_edit_Callback(hObject, eventdata, handles)
area=get(handles.popupmenu,'userdata');
set(handles.result_edit,'string',num2str(area));
 setappdata(0,'PACr',area);
% hObject    handle to result_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result_edit as text
%        str2double(get(hObject,'String')) returns contents of result_edit as a double

% function PAC_figure_WindowButtonMotionFcn(hObject, eventdata, handles)
% p=get(gcf,'CurrentPoint') ;%��þ��
% 
% msgstr = sprintf('x = %3.3f; y = %3.3f',p(1),p(2)); %���λ��?
% 
% xianshi= uicontrol('style','text','position',[0.084 0.012 0.05 0.05],'string',msgstr,'fontunits','normalized');


% --- Executes on button press in exit_pushbutton.
function exit_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to exit_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiresume(handles.PAC_figure);



% --- Executes during object creation, after setting all properties.
function frame_edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frame_edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function frame_edit2_Callback(hObject, eventdata, handles)
% hObject    handle to frame_edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frame_edit2 as text
%        str2double(get(hObject,'String')) returns contents of frame_edit2 as a double


% --- Executes on button press in Hebing_nbb.
function Hebing_nbb_Callback(hObject, eventdata, handles)  %ͼ��ϲ�����?
% hObject    handle to Hebing_nbb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ROI_nbb;
str=get(handles.file_pushbutton,'userdata');
n=str2num(get(handles.frame_edit,'string'));
n2=str2num(get(handles.frame_edit2,'string'));
cla;
% uicontrol('style','text','units','normalized','fontunits','normalized','string','ѡ��֡��ͼ����ʾ','position',[0.200,0.804,0.202,0.057]);

if (n2-n) >= 0
    for i_nbb = n:n2
        if i_nbb == n
            Y = dicomread(str,'Frames',n);
            Y = double(Y);
        else
            temp = dicomread(str,'Frames',i_nbb);
            temp = double(temp);
            Y = Y + temp;
        end
    end
    scale_nbb = 255/max(max(Y));
    Y_temp_nbb = Y;
    Y = Y_temp_nbb .* scale_nbb;

    ROI_nbb.image = uint8(Y);
    hImgAxis = imshow(ROI_nbb.image);
    set(hObject,'userdata',ROI_nbb.image);
    impixelinfo;
    %-----------------��-----------------------------------%
%     handles.hImgAxis = hImgAxis;
%     set(handles.hImgAxis,'ButtonDownFcn',{@ImgAxisButtonDown,handles})
%-----------------------����-----------------------------------%
else
    errordlg('���С����������ֹ֡���');
end

% Y=dicomread(str,'Frames',n);
% Y = double(Y);
% scale_nbb = 255/max(max(Y));
% Y_temp_nbb = Y;
% % temp_nbb = find(Y_temp_nbb<5);
% % Y_temp_nbb(temp_nbb) = 0;
% Y = Y_temp_nbb .* scale_nbb;

% [Y1,rect]=imcrop(uint8(Y));
% set(handles.frame_edit,'userdata',rect);
% setappdata(0,'PACr1',rect);


% --- Executes on button press in select_ROI.
function select_ROI_Callback(hObject, eventdata, handles)
% hObject    handle to select_ROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
Y = get(handles.Hebing_nbb,'userdata');
Y_temp = Y;
ROI_dsf1 = ROI_dsf(Y);
L1 = find(ROI_dsf1 == 0);
Y_temp(L1) = 0; 
[col,row] = find(Y_temp == max(max(Y_temp)),1,'first');
ROI_nbb.rect = [(row-1) (col-2) 2 3];            %�˴�ѡȡ��3*2�����ص�
%---------------------------------------------����-----------------------%    
%     [Y1,rect]=imcrop(uint8(Y));
    set(handles.frame_edit,'userdata',ROI_nbb.rect);
  
% end


% --- Executes on mouse motion over figure - except title and menu.
function PAC_figure_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to PAC_figure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%--------------------����ط��������Ҹĵ�?----------------------------%
% global ROI_nbb;
% if ROI_nbb.flag_ROI ==1
%     position_axis = get(handles.axes1,'Position');
%     cursor_point = get(handles.PAC_figure,'CurrentPoint');
%     if (cursor_point(1)>=position_axis(1)) && (cursor_point(1)<=(position_axis(1)+position_axis(3))) && (cursor_point(2)>=position_axis(2)) && (cursor_point(2)<=(position_axis(2)+position_axis(4)))
%         set(handles.PAC_figure,'Pointer','cross');       
%     else
%         set(handles.PAC_figure,'Pointer','arrow');
%     end
% else
%     set(handles.PAC_figure,'Pointer','arrow');
% end
%---------------------һֱ����--------------------------------------%


% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
