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

% Last Modified by GUIDE v2.5 25-Mar-2019 18:13:23

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
handles=reset_cfg(handles);
guidata(hObject, handles);
set(gca,'fontsize',0.01);
%set(handles.figure1,'color',[0.2 0.1 0.1]);
% Update handles structure


% This sets up the initial plot - only do when we are invisible
% so window can get raised using gui_test.
if strcmp(get(hObject,'Visible'),'off')
    draw_vector(handles);  
end

function ret=reset_cfg(handles)
handles.r1=[2  2  2];
handles.Angle1=[0 -120 120 0 0 ];
handles.Name1=char('Ua','Ub','Uc','U0');
handles.step1=10;
handles.r2=[0.5 0.5 0.5];
handles.Angle2=[0 -120 120];
handles.Name2=char('Ia','Ib ','Ic','I0');
handles.step2=10;
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
v1=handles.v1(1)+handles.v1(2)+handles.v1(3);
v2=handles.v2(1)+handles.v2(2)+handles.v2(3);
handles.Angle1(4)=angle(v1)/pi*180;
handles.r1(4)=abs(v1);
handles.Angle2(4)=angle(v2)/pi*180;
handles.r2(4)=abs(v2);
handles.d1=max(handles.r1);
handles.d2=max(handles.r2);
if(handles.d1>handles.d2)
    handles.max=handles.d1;
else
    handles.max=handles.d2;
end;
axis([-handles.max,handles.max,-handles.max,handles.max]);
ret=handles;

% UIWAIT makes gui_test wait for user response (see UIRESUME)
% uiwait(handles.figure1);
function ret=read_cfg(handles)
r1=str2num(get(findobj('tag','rUa'),'String'));
r2=str2num(get(findobj('tag','rUb'),'String'));
r3=str2num(get(findobj('tag','rUc'),'String'));
handles.r1=[r1 r2 r3];
ang1=str2num(get(findobj('tag','ang_Ua'),'String'));
ang2=str2num(get(findobj('tag','ang_Ub'),'String'));
ang3=str2num(get(findobj('tag','ang_Uc'),'String'));
handles.Angle1=[ang1 ang2 ang3];
handles.Name1=char('Ua','Ub','Uc','U0');
step=str2num(get(findobj('tag','edit1'),'String'));
handles.step1=step;

r1=str2num(get(findobj('tag','rIa'),'String'));
r2=str2num(get(findobj('tag','rIb'),'String'));
r3=str2num(get(findobj('tag','rIc'),'String'));
handles.r2=[r1 r2 r3];
ang1=str2num(get(handles.ang_Ia,'String'));
ang2=str2num(get(findobj(0,'tag','ang_Ib'),'String'));
ang3=str2num(get(findobj(0,'tag','ang_Ic'),'String'));
handles.Angle2=[ang1 ang2 ang3];
handles.Name2=char('Ia','Ib','Ic','I0');
step=str2num(get(findobj('tag','edit2'),'String'));
handles.step2=step;
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

v1=handles.v1(1)+handles.v1(2)+handles.v1(3);
v2=handles.v2(1)+handles.v2(2)+handles.v2(3);

ag1=angle(handles.v1(1)-handles.v1(2));%angle of uab
ag2=angle(handles.v2(1));%angle of ia
ag=ag1-ag2-pi/6;%angle of uab-ia

handles.Angle1(4)=angle(v1)/pi*180;
handles.r1(4)=abs(v1);
handles.Angle2(4)=angle(v2)/pi*180;
handles.r2(4)=abs(v2);
handles.Angle1(5)=ag/pi*180;
handles.d1=max(handles.r1);
handles.d2=max(handles.r2);
if(handles.d1>handles.d2)
    handles.max=handles.d1;
else
    handles.max=handles.d2;
end;
axis([-handles.max,handles.max,-handles.max,handles.max]);
ret=handles;



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
        handles=reset_cfg(handles);
        set_vector(handles);
        guidata(hObject,handles);
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
handles.step1=str2num(get(handles.edit1,'String'));
guidata(hObject,handles);
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
set_vector(handles);
guidata(hObject,handles);
handles=read_cfg(handles);
set_vector(handles);
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
set_vector(handles);
guidata(hObject,handles);
handles=read_cfg(handles);
set_vector(handles);
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
set_vector(handles);
guidata(hObject,handles);
handles=read_cfg(handles);
set_vector(handles);
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
set_vector(handles);
guidata(hObject,handles);
handles=read_cfg(handles);
set_vector(handles);
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

function ret=set_vector(handles)
set(findobj('tag','rUa'),'String',[num2str(handles.r1(1)) ]);
set(findobj('tag','rUb'),'String',[num2str(handles.r1(2)) ]);
set(findobj('tag','rUc'),'String',[num2str(handles.r1(3)) ]);
set(findobj('tag','rIa'),'String',[num2str(handles.r2(1)) ]);
set(findobj('tag','rIb'),'String',[num2str(handles.r2(2)) ]);
set(findobj('tag','rIc'),'String',[num2str(handles.r2(3)) ]);
set(findobj('tag','ang_Ua'),'String',[num2str(handles.Angle1(1)) ]);
set(findobj('tag','ang_Ub'),'String',[num2str(handles.Angle1(2)) ]);
set(findobj('tag','ang_Uc'),'String',[num2str(handles.Angle1(3)) ]);
set(findobj('tag','ang_U0'),'String',[num2str(handles.Angle1(4)) ]);
set(findobj('tag','ang_Ia'),'String',[num2str(handles.Angle2(1)) ]);
set(findobj('tag','ang_Ib'),'String',[num2str(handles.Angle2(2)) ]);
set(findobj('tag','ang_Ic'),'String',[num2str(handles.Angle2(3)) ]);
set(findobj('tag','ang_I0'),'String',[num2str(handles.Angle2(4)) ]);
set(findobj('tag','ang_Ia_Ua'),'String',[num2str(mod(handles.Angle2(1)-handles.Angle1(1),360)) 'бу']);
set(findobj('tag','ang_Ib_Ub'),'String',[num2str(mod(handles.Angle2(2)-handles.Angle1(2),360)) 'бу']);
set(findobj('tag','ang_Ic_Uc'),'String',[num2str(mod(handles.Angle2(3)-handles.Angle1(3),360)) 'бу']);
set(findobj('tag','ang_I0_U0'),'String',[num2str(mod(handles.Angle2(4)-handles.Angle1(4),360)) 'бу']);
set(findobj('tag','ang_Ua_Ia'),'String',[num2str(mod(handles.Angle1(1)-handles.Angle2(1),360)) 'бу']);
set(findobj('tag','ang_Ub_Ib'),'String',[num2str(mod(handles.Angle1(2)-handles.Angle2(2),360)) 'бу']);
set(findobj('tag','ang_Uc_Ic'),'String',[num2str(mod(handles.Angle1(3)-handles.Angle2(3),360)) 'бу']);
set(findobj('tag','ang_U0_I0'),'String',[num2str(mod(handles.Angle1(4)-handles.Angle2(4),360)) 'бу']);
set(findobj('tag','ang_Uab_Ia'),'String',[num2str(mod(handles.Angle1(5),360)) 'бу']);
ret=handles;
function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
handles.step2=str2num(get(handles.edit2,'String'));
guidata(hObject,handles);
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





function rUa_Callback(hObject, eventdata, handles)
% hObject    handle to rUa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rUa as text
%        str2double(get(hObject,'String')) returns contents of rUa as a double
handles.r1(1)=str2num(get(handles.rUa,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function rUa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rUa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function rUc_Callback(hObject, eventdata, handles)
% hObject    handle to rUc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rUc as text
%        str2double(get(hObject,'String')) returns contents of rUc as a double
handles.r1(3)=str2num(get(handles.rUc,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function rUc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rUc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function rUb_Callback(hObject, eventdata, handles)
% hObject    handle to rUb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rUb as text
%        str2double(get(hObject,'String')) returns contents of rUb as a double
handles.r1(2)=str2num(get(handles.rUb,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function rUb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rUb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function rIa_Callback(hObject, eventdata, handles)
% hObject    handle to rIa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rIa as text
%        str2double(get(hObject,'String')) returns contents of rIa as a double
handles.r2(1)=str2num(get(handles.rIa,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function rIa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rIa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function rIb_Callback(hObject, eventdata, handles)
% hObject    handle to rIb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rIb as text
%        str2double(get(hObject,'String')) returns contents of rIb as a double
handles.r2(2)=str2num(get(handles.rIb,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function rIb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rIb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function rIc_Callback(hObject, eventdata, handles)
% hObject    handle to rIc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rIc as text
%        str2double(get(hObject,'String')) returns contents of rIc as a double
handles.r2(3)=str2num(get(handles.rIc,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function rIc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rIc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function ang_Ua_Callback(hObject, eventdata, handles)
% hObject    handle to ang_Ua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ang_Ua as text
%        str2double(get(hObject,'String')) returns contents of ang_Ua as a double
handles.Angle1(1)=str2num(get(handles.ang_Ua,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function ang_Ua_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ang_Ua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ang_Uc_Callback(hObject, eventdata, handles)
% hObject    handle to ang_Uc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ang_Uc as text
%        str2double(get(hObject,'String')) returns contents of ang_Uc as a double
handles.Angle1(3)=str2num(get(handles.ang_Uc,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function ang_Uc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ang_Uc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ang_Ub_Callback(hObject, eventdata, handles)
% hObject    handle to ang_Ub (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ang_Ub as text
%        str2double(get(hObject,'String')) returns contents of ang_Ub as a double
handles.Angle1(2)=str2num(get(handles.ang_Ub,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function ang_Ub_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ang_Ub (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ang_Ia_Callback(hObject, eventdata, handles)
% hObject    handle to ang_Ia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ang_Ia as text
%        str2double(get(hObject,'String')) returns contents of ang_Ia as a double
handles.Angle2(1)=str2num(get(handles.ang_Ia,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function ang_Ia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ang_Ia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ang_Ib_Callback(hObject, eventdata, handles)
% hObject    handle to ang_Ib (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ang_Ib as text
%        str2double(get(hObject,'String')) returns contents of ang_Ib as a double
handles.Angle2(2)=str2num(get(handles.ang_Ib,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function ang_Ib_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ang_Ib (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ang_Ic_Callback(hObject, eventdata, handles)
% hObject    handle to ang_Ic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ang_Ic as text
%        str2double(get(hObject,'String')) returns contents of ang_Ic as a double
handles.Angle2(3)=str2num(get(handles.ang_Ic,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function ang_Ic_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ang_Ic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ang_I0_Callback(hObject, eventdata, handles)
% hObject    handle to ang_I0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ang_I0 as text
%        str2double(get(hObject,'String')) returns contents of ang_I0 as a double


% --- Executes during object creation, after setting all properties.
function ang_I0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ang_I0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ang_U0_Callback(hObject, eventdata, handles)
% hObject    handle to ang_U0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ang_U0 as text
%        str2double(get(hObject,'String')) returns contents of ang_U0 as a double


% --- Executes during object creation, after setting all properties.
function ang_U0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ang_U0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



% --- Executes on key press over rUa with no controls selected.
function rUa_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to rUa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


