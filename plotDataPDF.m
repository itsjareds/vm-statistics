function plotDataPDF(plotFlag)
%
%  plotPDF: This program plots the distribution associated with a data set contained in an input file.
%   params:
%       plotFlag:  set to 0 to plot the CDF
%                         1 to plot the PDF
%
%  invocation:    plotDataPDF()
%
%
%  Last updated: 1/20/2016
%

if nargin < 1
  plotFlag = 1;
end



%load hw1B2.dat;
%dataSet1 = hw1B2;
load hw1.dat;
dataSet1 = hw1;


%Convert from seconds to microseconds
dataSet=1000000*dataSet1(:,[1]);

maxValue=max(dataSet);
minValue=min(dataSet);
maxX = maxValue;
minX = minValue;
numberEntries=size(dataSet);
sampleSize=numberEntries(1);

%If NOT 0, all values greater than
%  this is placed in a single bin
MAX_ALLOWED_VALUE=1000;

fprintf(1,'plotDataPDF (nargin:%d):  sampleSize:%d, maxValue:%f,  MAX_ALLOWED_VALUE:%f \n', nargin,sampleSize,maxValue,MAX_ALLOWED_VALUE);

%if we did want to specifically look for  0 values...
zeroCount=0;
for i = 1 : sampleSize
  if (dataSet(i) == 0)
    zeroCount=zeroCount+1;
  end
end

meanStat = mean(dataSet);
medianStat = median(dataSet);
stdStat = std(dataSet);
maxStat= max(dataSet);
minStat= min(dataSet);
y=prctile(dataSet,[2.5 25 50 75 97.5]);

%if we want to place all values great than a max
% in a single bin
%MAX_ALLOWED_VALUE=1000;
%Set to 97.5%
MAX_ALLOWED_VALUE=y(5);
maxCount=0;
if (MAX_ALLOWED_VALUE > 0)
  for i = 1 : sampleSize
  if (dataSet(i) > MAX_ALLOWED_VALUE)
    dataSet(i) = MAX_ALLOWED_VALUE;
    maxCount=maxCount+1;
  end
end
end

%Might need to tune these...
maxY = 0.50;
if (MAX_ALLOWED_VALUE > 0)
  maxX =  MAX_ALLOWED_VALUE;
else
  maxX =  4000;
end



fprintf(1,'#samples:%d Mean:%6.0f microseconds,  median: %6.0f,  std: %6.0f, max:%6.0f, min:%6.0f, maxCount:%d zeroCnt:%d\n',sampleSize,meanStat,medianStat,stdStat,maxStat,minStat,maxCount,zeroCount);
fprintf(1,'percentiles (2.5 25 50 75 97.5): :%6.0f %6.0f %6.0f %6.0f %6.0f\n', y(1),y(2),y(3),y(4),y(5));

numberBins = 100;


[N,X] = hist(dataSet,numberBins);
N=N/sampleSize;
S=0;
for i = 1:numberBins
%disp(N(i));
   S = S + N(i);
   CDF(i) =S;
end

if (plotFlag == 0)
  bar(X,CDF);
  hold on
  grid
  ylabel('Cumulative Distribution')
  xlabel('Delay (microseconds)')
  title('CDF Delay Samples')
  maxY = 1.0;
  axis([0 maxX 0 maxY]);
  grid
end

if (plotFlag == 1)
  bar(X,N);
  hold on
  grid
  ylabel('Probability density')
  xlabel('Delay (microseconds)')
  title('PDF Delay Samples')
  axis([0 maxX 0 maxY]);
end


