%######################################################
% Identification de nationalité - Règle DST + décision BetP
%######################################################
FoD_size = 7;   % Ω = {a=DZ, b=TN, c=EG, d=SY, e=SN, f=CN, g=DE}

m1 = 'a(0.30)       abcdefg(0.70)';   % Expert 1 : Algérien
m2 = 'ab(0.45)      abcdefg(0.55)';   % Expert 2 : Maghrébin
m3 = 'abcd(0.60)    abcdefg(0.40)';   % Expert 3 : Arabe
m4 = 'abce(0.55)    abcdefg(0.45)';   % Expert 4 : Africain
m5 = 'df(0.25)      abcdefg(0.75)';   % Expert 5 : Asiatique

m1 = StringToMassVector(m1, FoD_size);
m2 = StringToMassVector(m2, FoD_size);
m3 = StringToMassVector(m3, FoD_size);
m4 = StringToMassVector(m4, FoD_size);
m5 = StringToMassVector(m5, FoD_size);

MasseIn = [m1 m2 m3 m4 m5];   % 128 lignes x 5 colonnes (une masse par expert)

% --- Combinaison (règle de Dempster normalisée) ---
      % vecteur colonne 128x1 (masse combinée finale)
M_DS = DST(MasseIn, 2);
M_DS = M_DS(:);          % force la forme colonne 128x1

critere = 4;
[class_fusion] = decisionDST(M_DS, critere);

labels = {'DZ','TN','EG','SY','SN','CN','DE'};
fprintf('Nationalité retenue : %s\n', labels{class_fusion});
% Table de correspondance indice -> nationalité (ordre a,b,c,d,e,f,g)



