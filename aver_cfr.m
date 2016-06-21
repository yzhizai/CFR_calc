function varargout = aver_cfr(varargin)
% AVER_CFR M-file for aver_cfr.fig
%      AVER_CFR, by itself, creates a new AVER_CFR or raises the existing
%      singleton*.
%
%      H = AVER_CFR returns the handle to a new AVER_CFR or the handle to
%      the existing singleton*.
%
%      AVER_CFR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AVER_CFR.M with the given input arguments.
%
%      AVER_CFR('Property','Value',...) creates a new AVER_CFR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before aver_cfr_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to aver_cfr_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help aver_cfr

% Last Modified by GUIDE v2.5 11-Dec-2013 16:05:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @aver_cfr_OpeningFcn, ...
                   'gui_OutputFcn',  @aver_cfr_OutputFcn, ...
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


% --- Executes just before aver_cfr is made visible.
function aver_cfr_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to aver_cfr (see VARARGIN)

% Choose default command line output for aver_cfr
handles.output = hObject;
if (numel(varargin) == 1)
    delete(handles.figure2);
    return;
end
    cfr2 = varargin{1};
    rr2 = varargin{2};
    rs2 = varargin{3};
    set(handles.rr_lad_edit,'string',num2str(rr2(1)));
    set(handles.rr_lcx_edit,'string',num2str(rr2(2)));
    set(handles.rr_rca_edit,'string',num2str(rr2(3)));

    set(handles.rs_lad_edit,'string',num2str(rs2(1)));
    set(handles.rs_lcx_edit,'string',num2str(rs2(2)));
    set(handles.rs_rca_edit,'string',num2str(rs2(3)));

    set(handles.lad_edit,'string',num2str(cfr2(1)));
    set(handles.lcx_edit,'string',num2str(cfr2(2)));
    set(handles.rca_edit,'string',num2str(cfr2(3)));
    % Update handles structure
    guidata(hObject, handles);

% UIWAIT makes aver_cfr wait for user response (see UIRESUME)
% uiwait(handles.figure2);


% --- Outputs from this function are returned to the command line.
function varargout = aver_cfr_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
% varargout{1} = handles.output;



function lad_edit_Callback(hObject, eventdata, handles)
% hObject    handle to lad_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lad_edit as text
%        str2double(get(hObject,'String')) returns contents of lad_edit as a double


% --- Executes during object creation, after setting all properties.
function lad_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lad_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lcx_edit_Callback(hObject, eventdata, handles)
% hObject    handle to lcx_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lcx_edit as text
%        str2double(get(hObject,'String')) returns contents of lcx_edit as a double


% --- Executes during object creation, after setting all properties.
function lcx_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lcx_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rca_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rca_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rca_edit as text
%        str2double(get(hObject,'String')) returns contents of rca_edit as a double


% --- Executes during object creation, after setting all properties.
function rca_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rca_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rr_lad_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rr_lad_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rr_lad_edit as text
%        str2double(get(hObject,'String')) returns contents of rr_lad_edit as a double


% --- Executes during object creation, after setting all properties.
function rr_lad_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rr_lad_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rr_lcx_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rr_lcx_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rr_lcx_edit as text
%        str2double(get(hObject,'String')) returns contents of rr_lcx_edit as a double


% --- Executes during object creation, after setting all properties.
function rr_lcx_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rr_lcx_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rr_rca_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rr_rca_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rr_rca_edit as text
%        str2double(get(hObject,'String')) returns contents of rr_rca_edit as a double


% --- Executes during object creation, after setting all properties.
function rr_rca_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rr_rca_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rs_lad_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rs_lad_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rs_lad_edit as text
%        str2double(get(hObject,'String')) returns contents of rs_lad_edit as a double


% --- Executes during object creation, after setting all properties.
function rs_lad_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rs_lad_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rs_lcx_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rs_lcx_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rs_lcx_edit as text
%        str2double(get(hObject,'String')) returns contents of rs_lcx_edit as a double


% --- Executes during object creation, after setting all properties.
function rs_lcx_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rs_lcx_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rs_rca_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rs_rca_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rs_rca_edit as text
%        str2double(get(hObject,'String')) returns contents of rs_rca_edit as a double


% --- Executes during object creation, after setting all properties.
function rs_rca_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rs_rca_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
