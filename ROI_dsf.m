function varargout = ROI_dsf(varargin)
% ROI_DSF M-file for ROI_dsf.fig
%      ROI_DSF, by itself, creates a new ROI_DSF or raises the existing
%      singleton*.
%
%      H = ROI_DSF returns the handle to a new ROI_DSF or the handle to
%      the existing singleton*.
%
%      ROI_DSF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROI_DSF.M with the given input arguments.
%
%      ROI_DSF('Property','Value',...) creates a new ROI_DSF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ROI_dsf_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ROI_dsf_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ROI_dsf

% Last Modified by GUIDE v2.5 23-Mar-2012 17:07:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ROI_dsf_OpeningFcn, ...
                   'gui_OutputFcn',  @ROI_dsf_OutputFcn, ...
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


% --- Executes just before ROI_dsf is made visible.
function ROI_dsf_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ROI_dsf (see VARARGIN)

% Choose default command line output for ROI_dsf
movegui(hObject,'center');
handles.output = hObject;
Y = varargin{1};
axes(handles.axes1)
imshow(Y);
BW = roipoly(Y);
setappdata(0,'BW',BW);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ROI_dsf wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ROI_dsf_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
h = getappdata(0,'BW');
varargout{1} = h;
delete(gcf);
