function varargout = gui_test(varargin)
% GUI_TEST M-file for gui_test.fig
%      GUI_TEST, by itself, creates a new GUI_TEST or raises the existing
%      singleton*.
%
%      H = GUI_TEST returns the handle to a new GUI_TEST or the handle to
%      the existing singleton*.
%
%      GUI_TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TEST.M with the given input arguments.
%
%      GUI_TEST('Property','Value',...) creates a new GUI_TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_test_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help gui_test

% Last Modified by GUIDE v2.5 24-Mar-2019 22:05:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_test_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_test_OutputFcn, ...
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

% --- Executes just before gui_test is made visible.
function gui_test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_test (see VARARGIN)

% Choose default command line output for gui_test
handles.output = hObject;
handles.Angle1=[0 -120 120];
handles.r1=[2 2 2];
handles.Name1=char('Ua','Ub','Uc');
handles.step1=10;
handles.Angle2=[-5 -125 115];
handles.r2=[0.5 0.5 0.5];
handles.Name2=char('Ia','Ib','Ic');
handles.step2=10;
handles.d1=max(handles.r1);
handles.d2=max(handles.r2);
handles.v1=1+j;
handles.v2=1+j;
for i=1:3
	the=handles.Angle1(i);
	r=handles.r1(i);
	v=complex(r*cos(the/180*pi),r*sin(the/180*pi));
	handles.v1(i)=v;
end
for i=1:3
	the=handles.Angle2(i);
	r=handles.r2(i);
	v=complex(r*cos(the/180*pi),r*sin(the/180*pi));
	handles.v2(i)=v;
end
if(handles.d1>handles.d2)
    handles.max=handles.d1;
else
    handles.max=handles.d2;
end;
axis([-handles.max,handles.max,-handles.max,handles.max]);
set(gca,'fontsize',0.01);
% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using gui_test.
if strcmp(get(hObject,'Visible'),'off')
    draw_vector(handles);  
end

% UIWAIT makes gui_test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_test_OutputFcn(hObject, eventdata, handles)
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
axes(handles.axes1);
cla;
popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1
        draw_vector(handles);
    case 2
        plot(sin(1:0.01:25.99));
    case 3
        bar(1:.5:10);
    case 4
        plot(membrane);
    case 5
        surf(peaks);
end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.step1=str2num(get(handles.edit1,'String'));
handles.Angle1(1)=mod(handles.Angle1(1)+handles.step1,360);
handles.Angle1(2)=mod(handles.Angle1(2)+handles.step1,360);
handles.Angle1(3)=mod(handles.Angle1(3)+handles.step1,360);
guidata(hObject,handles);
draw_vector(handles);



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.step1=str2num(get(handles.edit1,'String'));
handles.Angle1(1)=mod(handles.Angle1(1)-handles.step1,360);
handles.Angle1(2)=mod(handles.Angle1(2)-handles.step1,360);
handles.Angle1(3)=mod(handles.Angle1(3)-handles.step1,360);
guidata(hObject,handles);
draw_vector(handles);
% --- Executes on button press in pushbutton4.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.step2=str2num(get(handles.edit2,'String'));
handles.Angle2(1)=mod(handles.Angle2(1)+handles.step2,360);
handles.Angle2(2)=mod(handles.Angle2(2)+handles.step2,360);
handles.Angle2(3)=mod(handles.Angle2(3)+handles.step2,360);
guidata(hObject,handles);
draw_vector(handles);


% --- Executes on button press in pushbutton5.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.step2=str2num(get(handles.edit2,'String'));
handles.Angle2(1)=mod(handles.Angle2(1)-handles.step2,360);
handles.Angle2(2)=mod(handles.Angle2(2)-handles.step2,360);
handles.Angle2(3)=mod(handles.Angle2(3)-handles.step2,360);
guidata(hObject,handles);
draw_vector(handles);

function ret=draw_vector(handles)
if(handles.d1>handles.d2)
    draw_phase(handles.Angle1,handles.r1,handles.Name1);
    hold on;
    draw_phase(handles.Angle2,handles.r2,handles.Name2);
    hold off;
else
    draw_phase(handles.Angle2,handles.r2,handles.Name1);
    hold on;
    draw_phase(handles.Angle1,handles.r1,handles.Name2);
end
set(findobj('tag','Ua'),'String',[num2str(handles.Angle1(1)) 'бу']);
set(findobj('tag','Ub'),'String',[num2str(handles.Angle1(2)) 'бу']);
set(findobj('tag','Uc'),'String',[num2str(handles.Angle1(3)) 'бу']);
set(findobj('tag','Ia'),'String',[num2str(handles.Angle2(1)) 'бу']);
set(findobj('tag','Ib'),'String',[num2str(handles.Angle2(2)) 'бу']);
set(findobj('tag','Ic'),'String',[num2str(handles.Angle2(3)) 'бу']);
set(findobj('tag','Ua_Ia'),'String',[num2str(mod((handles.Angle1(1)-handles.Angle2(1)),360)) 'бу']);
set(findobj('tag','Ub_Ib'),'String',[num2str(mod((handles.Angle1(2)-handles.Angle2(2)),360)) 'бу']);
set(findobj('tag','Uc_Ic'),'String',[num2str(mod((handles.Angle1(3)-handles.Angle2(3)),360)) 'бу']);

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


