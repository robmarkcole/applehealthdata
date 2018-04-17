%{
 
Apple Health Step and Distance Extractor 
v 1.0.3 | April 16 2018
(c) Joseph M. Mahoney, Ph.D., Penn State Berks 
https://sites.psu.edu/mahoneygroup/

Please cite using DOI: 10.13140/RG.2.2.18601.70247 
and the author information 
 
This program extracts daily step and distance data from the exported zip file
from the Apple Health App. Instructions to retrieve the raw data from the
app are in the included pdf file.
  
Apple Health writes the data in epochs of various lengths of time. Data in 
epochs that pass through midnight local time are counted all in the second day.
 
To use the program, run it in Matlab. You will be asked to select
the zip file from Apple Health containing the raw data that you want to 
extract from. 
Do not modify the files inside the zip. Do not have any xml files in the
directory of this m file. 
The program will unzip the file and open the xml data. It then parses 
through the xml file to extract the desired data: steps and distance. 
The outputs of the program are vectors "distlist" and "steplist". 
The first column of each is the date in YYYYMMDD format. 
The second column is the distance in miles and number of steps, respectively. 
-----
As of this version, the program works with an iPhone 6 using iOS 11.3. No
guarantee is made about functionality with future versions of iOS or iPhones. 
 
%}

%% Initialize 
clc; close all; clear;
warning('off','MATLAB:RMDIR:RemovedFromPath'); % turn off path error warning
%% Open Zip File from Apple Health 

[subzip, subpath] = uigetfile('*.zip','Select zip file exported from Apple Health');
unzip([subpath subzip]); % unzips file exported from apple health 
addpath('apple_health_export'); % adds new directory to current path
fileID = fopen('export.xml'); % targets exported xml file
C = textscan(fileID,'%s'); % imports xml as string structure
fclose('all'); % close the open file
pause(2); % ensure file is closed before attempting to delete
rmdir('apple_health_export','s'); % remove the extracted files
pause(1); % ensure folder deleted 

%% Gather Step Data
list = 1; % initialize count
data = [0 0]; % initialize data structure
for KK = 1:length(C{1}) % scan line by line for data
    if strcmp( C{1}{KK}, 'type="HKQuantityTypeIdentifierStepCount"')
        flag = 1;
    end
    if flag
        tag = C{1}{KK};
        if length(tag) > 12
            if strcmp( C{1}{KK}(1:9), 'startDate' )
                dat = C{1}{KK}; % write date
                dat = dat(end-9:end);
                dat = dat([1:4,6:7,9:10]);
                data(list,1) = str2double(dat); 
            end
        end
        if length(tag) > 5
            if strcmp( C{1}{KK}(1:5), 'value' )
                dat = C{1}{KK}; % write steps
                dat = dat(8:end-3);
                data(list,2) = str2double(dat);
                list = list+1;
                flag = 0;
            end
        end
    end
end
clear list fileID KK dat  % clean up

%% Gather Distance Data in Miles
list = 1;
data2 = [0 0]; % initialize data structure
for KK = 1:length(C{1})
    if strcmp( C{1}{KK}, 'type="HKQuantityTypeIdentifierDistanceWalkingRunning"')
        flag=1;
    end
    if flag
        tag = C{1}{KK};
        if length(tag) > 12
            if strcmp( C{1}{KK}(1:9), 'startDate' )
                dat = C{1}{KK}; % write date
                dat = dat(end-9:end);
                dat = dat([1:4,6:7,9:10]);
                data2(list,1) = str2double(dat); 
            end
        end
        if length(tag) > 5
            if strcmp( C{1}{KK}(1:5), 'value' )
                dat = C{1}{KK}; % write steps
                dat = dat(8:end-3);
                data2(list,2) = str2double(dat);
                list = list+1;
                flag = 0;
            end
        end
    end
end
clear list C fileID KK dat tag subzip flag ans subpath % clean up 

%% reduce to *daily* total (steps)
steplist = [0 0]; % initialize data
dats = unique(data(:,1)); % find unique dates that data was recorded
for KK = 1:length(dats) % sum all measurements occuring on same date
    steplist(KK,1) = dats(KK);
    steplist(KK,2) = sum (data(data(:,1)==dats(KK),2));
end
clear data KK dats % clean up

%% reduce to *daily* total (distance in miles)
distlist = [0 0]; % initialize data
dats = unique(data2(:,1));  % find unique dates that data was recorded
for KK = 1:length(dats)     % sum all measurements occuring on same date
    distlist(KK,1) = dats(KK);
    distlist(KK,2) = sum (data2(data2(:,1)==dats(KK),2));
end
clear data2 KK dats  % clean up


%% Histogram Plotting
close all; clc;
subplot(2,1,1);
histogram(steplist(:,2)/1e3,'Normalization','pdf','BinMethod','scott');
grid on;
xlabel('Steps [1000]','fontsize',14);
ylabel('Frequency','fontsize',14);
set(gca,'fontsize',12);
subplot(2,1,2);
histogram(distlist(:,2),'Normalization','pdf','BinMethod','scott');
xlabel('Distance [miles]','fontsize',14);
ylabel('Frequency','fontsize',14);
grid on;
set(gca,'fontsize',12);