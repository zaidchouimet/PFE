

%######################################################
% Example 0: TP 1
%######################################################
FoD_size = 2;
m1='a(0.5) b(0.5)';
m2='a(0.5) ab(0.5)';
 

m1= StringToMassVector(m1,FoD_size);
m2= StringToMassVector(m2,FoD_size);

JD_V1 = JousselmeDistance(m1,m2, 1)
JD_V2 = JousselmeDistance(m1,m2, 2)
FD = FuyuanDistance(m1,m2, 2)
%######################################################
% Example 1: TP 1
%######################################################
FoD_size = 3;
m1='a(0.5) b(0.2) ab(0.3)';
m2='a(0.5) b(0.2) ab(0.3)';
 

m1= StringToMassVector(m1,FoD_size);
m2= StringToMassVector(m2,FoD_size);

MasseIn = [m1, m2];
Conjunctive = get_Conjunctive_Masses(MasseIn) 
conflict = 1 - sum(Conjunctive)


JD_V1 = JousselmeDistance(m1, m2, 1)
JD_V2 = JousselmeDistance(m1, m2, 2)
FD = FuyuanDistance(m1, m2, 1)

%----------------------------------------
FoD_size = 4;
m1='a(1)';
m2='abcd(1)';
m3='ab(1)';
m4='bcd(1)';


m1= StringToMassVector(m1,FoD_size);
m2= StringToMassVector(m2,FoD_size);
m3= StringToMassVector(m3,FoD_size);
m4= StringToMassVector(m4,FoD_size);

JD_m1_m2 = JousselmeDistance(m1,m2, 1)
JD_m3_m4 = JousselmeDistance(m3,m4, 1)
FD_m1_m2 = FuyuanDistance(m1,m2, 2)
FD_m3_m4 = FuyuanDistance(m3,m4, 1)
