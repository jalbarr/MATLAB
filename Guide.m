
function varargout = Sorting_GUI(varargin)
% SORTING_GUI MATLAB code for Sorting_GUI.fig
%      SORTING_GUI, by itself, creates a new SORTING_GUI or raises the existing
%      singleton*.
%
%      H = SORTING_GUI returns the handle to a new SORTING_GUI or the handle to
%      the existing singleton*.
%
%      SORTING_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SORTING_GUI.M with the given input arguments.
%
%      SORTING_GUI('Property','Value',...) creates a new SORTING_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sorting_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sorting_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sorting_GUI

% Last Modified by GUIDE v2.5 01-Feb-2019 12:32:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sorting_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Sorting_GUI_OutputFcn, ...
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


% --- Executes just before Sorting_GUI is made visible.
function Sorting_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sorting_GUI (see VARARGIN)

% Choose default command line output for Sorting_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Sorting_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Sorting_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
function [data] = getData(handles)
dataString = get(handles.popupmenu1, 'String');
dataValue = dataString{get(handles.popupmenu1,'Value')};
data = str2num(dataValue);



% --- Executes on button press in Quick_Sort.
function Quick_Sort_Callback(hObject, eventdata, handles)
% hObject    handle to Quick_Sort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = getData(handles);
fprintf("Unsorted Data:")
fprintf("%4d",data)
fprintf("\n")
fprintf("\n")

lenD = size(data,2);
ind = cast(floor(lenD/2),'uint8');
j = 1;
k = 1;
L = [];
R = [];
if(lenD<2)
  dataOut = data;
else
  pivot = data(ind);
  for i=1:lenD
    if(i~=ind)
      if(data(i)<pivot)
        L(j) = data(i);
        j = j+1;
      else
        R(k) = data(i);
        k = k+1;
      end
    end
  end
  L = quickSort(L);
  R = quickSort(R);
  dataOut = [L pivot R];
end

fprintf("Sorted data:")
fprintf("%4d",data)
a = num2str(data);
set(handles.text10,'String', a);


% --- Executes on button press in Bubble_Sort.
function Bubble_Sort_Callback(hObject, eventdata, handles)
% hObject    handle to Bubble_Sort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = getData(handles);
fprintf("Unsorted Data:")
fprintf("%4d",data)
fprintf("\n")
fprintf("\n")

n=length(data);
% making (n-1) passes
for j=1:1:n-1
    % comparing each number with the next and swapping
    for i=1:1:n-1
        if data(i)>data(i+1)
        % temp is a variable where the numbers are kept
        % temporarily for the switch
            temp=data(i);
            data(i)=data(i+1);
            data(i+1)=temp;
        end
    end
end
fprintf("Sorted data:")
fprintf("%4d",data)
a = num2str(data);
set(handles.text10,'String', a);





% --- Executes on button press in Insertion_Sort.
function Insertion_Sort_Callback(hObject, eventdata, handles)
% hObject    handle to Insertion_Sort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = getData(handles);
fprintf("Unsorted Data:")
fprintf("%4d",data)
fprintf("\n")
fprintf("\n")

if(size(data,1)>1)
    error('Input must be a 1xN vector');
end
if(isempty(data))
    error('Input should not be empty');
end

n = length(data);
for i = 2:n
    d = i;    
    while((d > 1) && (data(d) < data(d-1)))
        temp = data(d);
        data(d) = data(d-1);
        data(d-1) = temp;
        d = d-1;
    end
end

fprintf("Sorted data:")
fprintf("%4d", data)
a = num2str(data);
set(handles.text10,'String', a);


% --- Executes on button press in Selection_Sort.
function Selection_Sort_Callback(hObject, eventdata, handles)
% hObject    handle to Selection_Sort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = getData(handles);
fprintf("Unsorted Data:")
fprintf("%4d",data)
fprintf("\n")
fprintf("\n")

n = length(data);
for i = 1:n-1
[x, index] = min(data(i:n)); 
minIndex = index + i-1; 
temp = data(i);
data(i) = data(minIndex);
data(minIndex) = temp;
end

fprintf("Sorted data:")
fprintf("%4d", data)
a = num2str(data);
set(handles.text10,'String', a);


function list = mergeSort(list)

    if numel(list) <= 1
        return
    else
        middle = ceil(numel(list) / 2);
        left = list(1:middle);
        right = list(middle+1:end);

        left = mergeSort(left);
        right = mergeSort(right);

        if left(end) <= right(1)
            list = [left right];
            return
        end

        %merge(left,right)
        counter = 1;
        while (numel(left) > 0) && (numel(right) > 0)
            if(left(1) <= right(1))
                list(counter) = left(1);
                left(1) = [];
            else
                list(counter) = right(1);
                right(1) = [];
            end           
            counter = counter + 1;   
        end

        if numel(left) > 0
            list(counter:end) = left;
        elseif numel(right) > 0
            list(counter:end) = right;
        end
        %end merge        
    end %if

% --- Executes on button press in Merge_Sort.
function Merge_Sort_Callback(hObject, eventdata, handles)
% hObject    handle to Merge_Sort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = getData(handles);
fprintf("Unsorted Data:")
fprintf("%4d",data)
fprintf("\n")
fprintf("\n")

name = mergeSort(data);
fprintf("Sorted data:")
fprintf("%4d", name)
a = num2str(data);
set(handles.text10,'String', a);




% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Radix_Sort.
function Radix_Sort_Callback(hObject, eventdata, handles)
% hObject    handle to Radix_Sort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object creation, after setting all properties.
function text10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
