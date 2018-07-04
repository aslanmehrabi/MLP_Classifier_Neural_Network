% Aslan Mehrabi
% Multi Layer Perceptron (MLP) Neural Network as a Classifier by Back Propagation Algorithm of iris data set
% 10 Neurons were used for the hidden layer of the designed neural net.
% Iris Data set was used for the test of the program

data = dlmread('iris.input');


%data(:,1)=data(:,5);
%data(:,2)=data(:,5);
%data(:,3)=data(:,5);
%data(:,4)=data(:,5);


% if(i mod 5 ==0 => test sample , else: training sample)

treshold=0;
etha=0.1;% parameter of learning
numNeur=10; % number of neurons in the hidden layer (only one hidden layer)
[numSample numFeature]=size(data);
numClass = 3; %
neurVal = zeros(1,numNeur);
y=zeros(1,numClass);
d1 = zeros(1,numNeur);
d2 = zeros(1,numClass);



initPar1 = 1/sqrt(numFeature);
initPar2 = 1/sqrt(numNeur);
w1 = (rand(numFeature,numNeur)-0.5)*initPar1*2;  %weight of edges between input and hidden layer
w2 = (rand(numNeur,numClass)-0.5)*initPar2*2;


x=[ ones(length(data),1) data(:,1:4)];  % input with a bias value(1)
label = zeros(numSample,numClass);
for i=1:numSample
   label(i,data(i,numFeature))=1; 
end



w1
w2

numItter=0;
maxItter=2000; % age marahel ziad she, overflow mide(w ha bozorg mishan)
i=1;
while true
    if( mod(i,5)~=0)

        x(i,:);
        neurVal=x(i,:)*w1;
        neurVal=1./(1+exp(-neurVal));
        
        
        y=neurVal * w2;
        
        
        
        for j=1:numClass
            
            if(y(j)>treshold) %
                y(j)=1;
            else
                y(j)=0;
            end
        end
        
        
        d2=label(i,:)-y;
        d2=d2.*(1-y).*y;%#
    
        d1=d2*w2';
        d1=d1.*(1-neurVal).*neurVal;
        
        
        
        w2=w2+neurVal'*d2*etha;
    
        w1=w1+x(i,:)' * d1*etha;

    
    end    
    
    i=mod(i+1,numSample)+1;
    numItter = numItter+1;
    if (numItter == maxItter)
        break;
    end
end


disp('======================================');
%test

numCorr=0;
numFalse=0;
for i=5:1:numSample  %%
     neurVal=x(i,:)*w1;
     y=neurVal * w2;
     
     
     
     for j=1:numClass
        if(y(j)>treshold) %%
            y(j)=1;
        else
            y(j)=0;
        end
     end
     
     
     y;
    d2=label(i,:)-y;
    label(i,:);
    if(d2==zeros(1,numClass))
        numCorr=numCorr+1;
    else
        numFalse=numFalse+1;
    end
end

numCorr
numFalse


