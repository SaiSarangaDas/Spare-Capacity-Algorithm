For some of the networks that have been analysed using our algorithm, the .mtx files from network repository fail to load in MATLAB. To extract network data from these files
please use the following sample code in the appropriate context
Sample Code:
```
 % Open the file for reading in text mode.
fileID = fopen('filename.mtx', 'rt');
% Read the first line of the file.
textLine = fgetl(fileID);
x=[];
i=1;
a=[];
textLine=fgetl(fileID); %keep entering this command till the first row of the edge list is captured in the 'textLine' variable. Typically, the edge list starts with two columns 
while ischar(textLine)
x=str2num(textLine);
a(i,:)=x;
i=i+1;
textLine=fgetl(fileID);
end
Adapted from:https://in.mathworks.com/matlabcentral/answers/491562-writing-code-for-function#answer_401917
```
