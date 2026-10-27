FoD_size = 7;

m1 = 'a(0.30)       abcdefg(0.70)';
m2 = 'ab(0.45)      abcdefg(0.55)';
m3 = 'abcd(0.60)    abcdefg(0.40)';
m4 = 'abce(0.55)    abcdefg(0.45)';
m5 = 'df(0.25)      abcdefg(0.75)';
m6 = 'abce(0.50)    df(0.20)    abcdefg(0.30)';   % nouveau rapport

m1 = StringToMassVector(m1, FoD_size);
m2 = StringToMassVector(m2, FoD_size);
m3 = StringToMassVector(m3, FoD_size);
m4 = StringToMassVector(m4, FoD_size);
m5 = StringToMassVector(m5, FoD_size);
m6 = StringToMassVector(m6, FoD_size);

MasseIn = [m1 m2 m3 m4 m5 m6];   % 128 x 6

M_DS = DST(MasseIn, 2);
M_DS = M_DS(:);

critere = 4;
[class_fusion] = decisionDST(M_DS, critere);

labels = {'DZ','TN','EG','SY','SN','CN','DE'};
fprintf('Nationalité retenue (mise à jour) : %s\n', labels{class_fusion});