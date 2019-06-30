% Geometrical Model 
% 'Exploring the explorers' analysis script
% 
% Future Planet Studies, Major Earth Science, University of Amsterdam
% May, 2019, by Enahu Tahitu
%
%%%%%%%%%%%%% INITIALISATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Cleaning workspace
clear all
close all
clc

%% Loading Data
%  2019
Area_2019 = 661659.219597;                                          %[km^2]

% Timeseries sealevel
Sea_50 = -32;
Sea_52 = -30;
Sea_55 = -43.5;
Sea_57 = -41;
Sea_60 = -30;
Sea_62 = -40;
Sea_65 = -52;
Sea_67 = -48;
Sea_70 = -31;
Sea_72 = -11;
Sea_73 = -12;

Sea_level = [Sea_50, Sea_55, Sea_60, Sea_65, Sea_70, Sea_73];

% Timeseries Surface Area Paleo Landscape
Area_50kyr = 767346.292844;                                         %[km^2]
Area_52_5kyr = 761444.563802;                                       %[km^2]
Area_55kyr = 798825.505651;                                         %[km^2]
Area_57_5kyr = 792462.791555;                                       %[km^2]
Area_60kyr = 761444.563802;                                         %[km^2]
Area_62_5kyr = 789799.644756;                                       %[km^2]
Area_65kyr = 819457.940188;                                         %[km^2]
Area_67_5kyr = 810036.988493;                                       %[km^2]
Area_70kyr = 764366.143144;                                         %[km^2]
Area_72_5kyr = 700400.428581;                                       %[km^2]
Area_73kyr = 703786.717577;                                         %[km^2]

Time = [50; 52.500; 55; 57.500; 60; 62.500; 65; 67.500; 70; 72.500; 73];

Area = [Area_50kyr; Area_52_5kyr; Area_55kyr; Area_57_5kyr; Area_60kyr;...
    Area_62_5kyr; Area_65kyr; Area_67_5kyr; Area_70kyr; Area_72_5kyr; Area_73kyr];

Data = [Time, Area];

% Timeseries relative visibility Paleo Landscape

% Area calculated from the polygons that were indicated as visibile by the
% viewshed tool in ArcGIS

Vis_50kyr_S = 17.695225;                                             %[m^2]
Vis_55kyr_S = 17.69496;                                              %[m^2]
Vis_60kyr_S = 17.6958;                                               %[m^2]
Vis_65kyr_S = 17.694869;                                             %[m^2]
Vis_70kyr_S = 17.695195;                                             %[m^2]
Vis_73kyr_S = 17.69313;                                              %[m^2]  

Vis_50kyr_N_1 = 12.791069;                                           %[m^2]
Vis_55kyr_N_1 = 12.789748;                                           %[m^2]
Vis_60kyr_N_1 = 12.789866;                                           %[m^2]
Vis_65kyr_N_1 = 12.79123;                                            %[m^2]
Vis_70kyr_N_1 = 12.790969;                                           %[m^2]
Vis_73kyr_N_1 = 12.791026;                                           %[m^2]

Vis_50kyr_N_2 = 12.451843;                                           %[m^2]
Vis_55kyr_N_2 = 12.451959;                                           %[m^2]
Vis_60kyr_N_2 = 12.451815;                                           %[m^2]
Vis_65kyr_N_2 = 12.451774;                                           %[m^2]
Vis_70kyr_N_2 = 12.451804;                                           %[m^2]
Vis_73kyr_N_2 = 12.451592;                                           %[m^2]

Vis_50kyr_N_3 = 16.667235;                                           %[m^2]
Vis_55kyr_N_3 = 16.667655;                                           %[m^2]
Vis_60kyr_N_3 = 16.667162;                                           %[m^2]
Vis_65kyr_N_3 = 16.666313;                                           %[m^2]
Vis_70kyr_N_3 = 16.667186;                                           %[m^2]
Vis_73kyr_N_3 = 16.666846;                                           %[m^2]

% Because there were some issues with the visbility tool and not every
% route has the same length the visbility is standardized per route to
% allow for intercomperability

% Calculating 'visbility score' per route

Vis_S = [Vis_50kyr_S, Vis_55kyr_S, Vis_60kyr_S, Vis_65kyr_S, Vis_70kyr_S,...
    Vis_73kyr_S];

Vis_N_1 = [Vis_50kyr_N_1, Vis_55kyr_N_1, Vis_60kyr_N_1, Vis_65kyr_N_1,...
    Vis_70kyr_N_1, Vis_73kyr_N_1];

Vis_N_2 = [Vis_50kyr_N_2, Vis_55kyr_N_2, Vis_60kyr_N_2, Vis_65kyr_N_2,...
    Vis_70kyr_N_2, Vis_73kyr_N_2];

Vis_N_3 = [Vis_50kyr_N_3, Vis_55kyr_N_3, Vis_60kyr_N_3, Vis_65kyr_N_3,...
    Vis_70kyr_N_3, Vis_73kyr_N_3];

Vis_50kyr_S = (Vis_50kyr_S - mean(Vis_S)) / std(Vis_S);                                 
Vis_55kyr_S = (Vis_55kyr_S - mean(Vis_S)) / std(Vis_S);
Vis_60kyr_S = (Vis_60kyr_S - mean(Vis_S)) / std(Vis_S);
Vis_65kyr_S = (Vis_65kyr_S - mean(Vis_S)) / std(Vis_S);
Vis_70kyr_S = (Vis_70kyr_S - mean(Vis_S)) / std(Vis_S);
Vis_73kyr_S = (Vis_73kyr_S - mean(Vis_S)) / std(Vis_S); 

Vis_50kyr_N_1 = (Vis_50kyr_N_1 - mean(Vis_N_1)) / std(Vis_N_1); 
Vis_55kyr_N_1 = (Vis_55kyr_N_1 - mean(Vis_N_1)) / std(Vis_N_1);
Vis_60kyr_N_1 = (Vis_60kyr_N_1 - mean(Vis_N_1)) / std(Vis_N_1);
Vis_65kyr_N_1 = (Vis_65kyr_N_1 - mean(Vis_N_1)) / std(Vis_N_1);
Vis_70kyr_N_1 = (Vis_70kyr_N_1 - mean(Vis_N_1)) / std(Vis_N_1);
Vis_73kyr_N_1 = (Vis_73kyr_N_1 - mean(Vis_N_1)) / std(Vis_N_1);

Vis_50kyr_N_2 = (Vis_50kyr_N_2 - mean(Vis_N_2)) / std(Vis_N_2);
Vis_55kyr_N_2 = (Vis_55kyr_N_2 - mean(Vis_N_2)) / std(Vis_N_2);
Vis_60kyr_N_2 = (Vis_60kyr_N_2 - mean(Vis_N_2)) / std(Vis_N_2);
Vis_65kyr_N_2 = (Vis_65kyr_N_2 - mean(Vis_N_2)) / std(Vis_N_2);
Vis_70kyr_N_2 = (Vis_70kyr_N_2 - mean(Vis_N_2)) / std(Vis_N_2);
Vis_73kyr_N_2 = (Vis_73kyr_N_2 - mean(Vis_N_2)) / std(Vis_N_2);

Vis_50kyr_N_3 = (Vis_50kyr_N_3 - mean(Vis_N_3)) / std(Vis_N_3);
Vis_55kyr_N_3 = (Vis_55kyr_N_3 - mean(Vis_N_3)) / std(Vis_N_3);
Vis_60kyr_N_3 = (Vis_60kyr_N_3 - mean(Vis_N_3)) / std(Vis_N_3);
Vis_65kyr_N_3 = (Vis_65kyr_N_3 - mean(Vis_N_3)) / std(Vis_N_3);
Vis_70kyr_N_3 = (Vis_70kyr_N_3 - mean(Vis_N_3)) / std(Vis_N_3);
Vis_73kyr_N_3 = (Vis_73kyr_N_3 - mean(Vis_N_3)) / std(Vis_N_3);

Vis = [50, 55, 60, 65, 70, 73; Vis_50kyr_S, Vis_55kyr_S, Vis_60kyr_S,...
    Vis_65kyr_S, Vis_70kyr_S,Vis_73kyr_S; Vis_50kyr_N_1, Vis_55kyr_N_1,...
    Vis_60kyr_N_1, Vis_65kyr_N_1,Vis_70kyr_N_1, Vis_73kyr_N_1; Vis_50kyr_N_2,...
    Vis_55kyr_N_2, Vis_60kyr_N_2, Vis_65kyr_N_2, Vis_70kyr_N_2, Vis_73kyr_N_2;...
    Vis_50kyr_N_3, Vis_55kyr_N_3, Vis_60kyr_N_3, Vis_65kyr_N_3, Vis_70kyr_N_3, Vis_73kyr_N_3];

%%%%%%%%%%%%% VISUALIZATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Data = fliplr(Data);

figure(1)
plot(Data(:,2), Data(:,1))
title('Timeseries of the Surface area of Wallacea')
xlabel({'Year','[kyr]'})
ylabel({'Surface area';'[km^2]'})
ax = gca; % current axes
ax.XLim = [50 73];
ax.XTickLabelRotation = -45;
ax.YTickLabelRotation = 45;
ax.YAxis.Exponent=0;  % don't use exponent

figure(2)
y1 = Vis(2,:);
[R1,P1] = corr(Sea_level', y1','type','Kendall');
subplot(2,2,1)
scatter(Sea_level, y1)
title('Sea level and  visibility score of the Southern route')
xlabel({'Sea level','[m]'})
ylabel({'Visbility score'})
str = {{R1}, P1};
text([-15 1],[-15 0.5], str)
y2 = Vis(3,:);
subplot(2,2,2)
scatter(Sea_level, y2)
title('Sea level and  visibility score of the Northern route 1')
xlabel({'Sea level','[m]'})
ylabel({'Visbility score'})
[R2,P2] = corr(Sea_level', y2','type','Kendall');
y3 = Vis(4,:);
subplot(2,2,3)
scatter(Sea_level, y3)
title('Sea level and  visibility score of the Northern route 2')
xlabel({'Sea level','[m]'})
ylabel({'Visbility score'})
[R3,P3] = corr(Sea_level', y3','type','Kendall');
y4 = Vis(5,:);
subplot(2,2,4)
scatter(Sea_level, y4)
title('Sea level and  visibility score of the Northern route 3')
xlabel({'Sea level','[m]'})
ylabel({'Visbility score'})
[R4,P4] = corr(Sea_level', y4','type','Kendall');

%%%%%%%%%%%%% INTERPOLATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y1 = interp1(Vis(1,:), Vis(2,:), Data(:,2));
y2 = interp1(Vis(1,:), Vis(3,:), Data(:,2));
y3 = interp1(Vis(1,:), Vis(4,:), Data(:,2));
y4 = interp1(Vis(1,:), Vis(5,:), Data(:,2));

%%%%%%%%%%%%% VISUALIZATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(3)
subplot(2,2,1)
x = Data(:,2);
yyaxis left
plot(x,y1);
r = Data(:,1);
yyaxis right
plot(x,r);
yyaxis left
title('Timeseries of the visibility score of Wallacea Southern route')
xlabel({'Year','[kyr]'})
ylabel({'Visbility score'})
yyaxis right
ylabel('Surface Area Wallacea')

subplot(2,2,2)
x = Data(:,2);
yyaxis left
plot(x,y2);
r = Data(:,1);
yyaxis right
plot(x,r);
yyaxis left
title('Timeseries of the visibility score of Wallacea Northern route 1')
xlabel({'Year','[kyr]'})
ylabel({'Visbility score'})
yyaxis right
ylabel('Surface Area Wallacea')

subplot(2,2,3)
x = Data(:,2);
yyaxis left
plot(x,y3);
r = Data(:,1);
yyaxis right
plot(x,r);
yyaxis left
title('Timeseries of the visibility score of Wallacea Northern route 2')
xlabel({'Year','[kyr]'})
ylabel({'Visbility score'})
yyaxis right
ylabel('Surface Area Wallacea')

subplot(2,2,4)
x = Data(:,2);
yyaxis left
plot(x,y4);
r = Data(:,1);
yyaxis right
plot(x,r);
yyaxis left
title('Timeseries of the visibility score of Wallacea Northern route 3')
xlabel({'Year','[kyr]'})
ylabel({'Visbility score'})
yyaxis right
ylabel('Surface Area Wallacea')

figure(4)
subplot(2,2,1)
x = Data(:,2);
yyaxis left
plot(Vis(1,:),Vis_S);
r = Data(:,1);
yyaxis right
plot(x,r);
yyaxis left
title('Timeseries of the visibility score of Wallacea Southern route')
xlabel({'Year','[kyr]'})
ylabel({'Visbility score'})
yyaxis right
ylabel('Surface Area Wallacea')
subplot(2,2,2)
x = Data(:,2);
yyaxis left
plot(Vis(1,:),Vis_N_1);
r = Data(:,1);
yyaxis right
plot(x,r);
yyaxis left
title('Timeseries of the visibility score of Wallacea Northern route 1')
xlabel({'Year','[kyr]'})
ylabel({'Visbility score'})
yyaxis right
ylabel('Surface Area Wallacea')
subplot(2,2,3)
x = Data(:,2);
yyaxis left
plot(Vis(1,:),Vis_N_2);
r = Data(:,1);
yyaxis right
plot(x,r);
yyaxis left
title('Timeseries of the visibility score of Wallacea Northern route 2')
xlabel({'Year','[kyr]'})
ylabel({'Visbility score'})
yyaxis right
ylabel('Surface Area Wallacea')
subplot(2,2,4)
x = Data(:,2);
yyaxis left
plot(Vis(1,:),Vis_N_3);
r = Data(:,1);
yyaxis right
plot(x,r);
yyaxis left
title('Timeseries of the visibility score of Wallacea Northern route 3')
xlabel({'Year','[kyr]'})
ylabel({'Visbility score'})
yyaxis right
ylabel('Surface Area Wallacea')

figure(5)
x = Data(:,2);
yyaxis left
plot(x,y1,'b')
hold on
plot(x,y2,'r-')
plot(x,y3,'r--')
plot(x,y4,'r-.')
hold off
yyaxis right
plot(x,r,'k');
yyaxis left
title('Timeseries of the visibility score of Wallacea')
xlabel({'Year','[kyr]'})
ylabel({'Visbility score'})
legend({'Southern route','Northern route 1','Northern route 2','Northern route 3'},'Location','northwest','NumColumns',2)
yyaxis right
ylabel('Surface Area Wallacea')

figure(6)
y1 = Vis(2,:);
scatter(Sea_level, y1)
hold on
y2 = Vis(3,:);
scatter(Sea_level, y2)
y3 = Vis(4,:);
scatter(Sea_level, y3)
y4 = Vis(5,:);
scatter(Sea_level, y4)
title('Timeseries of the visibility score of Wallacea')
xlabel({'Sea level','[m]'})
ylabel({'Visbility score'})
legend({'Southern route','Northern route 1','Northern route 2',...
    'Northern route 3'},'Location','northwest','NumColumns',2)
y = -0.040054*Sea_level + -1.3385;
plot(Sea_level,y,'b')
y = 0.0082686*Sea_level + 0.27631;
plot(Sea_level,y,'r')
y = -0.049361*Sea_level + -1.6495; 
plot(Sea_level,y,'m')
y = 0.010078*Sea_level + 0.33676;
plot(Sea_level,y,'y')
hold off


