%Caroline Deluce (101041614)
% MNPA

G1 = 1/1;
G2 = 1/2;
G3 = 1/10;
G4 = 1/0.1;
G0 = 1/1000;

c = 0.25;
a = 100;

G = [-G1 G1 0 0 0; -G1 G1-G2 G3 0 0; 0 0 -G3 0 0; 0 0 0 -G4-(1/a) G4; 0 0 0 G4 G0-G4]; 

C = [-c c 0 0 0; -c c 0 0 0; 0 0 0 0 0; 0 0 0 0 0; 0 0 0 0 0];




%DC case

for i = 1:21

    Vin = i-11;
    F = [Vin; 0; 0; 0; 0];
    V = G\F;
    V3(i) = V(3);
    disp(V3(i));
    V0(i) = V(1);
    disp(V0(1));

    
end

nexttile
plot(V3);
title('Plot of V3');

nexttile
plot(V0);
title('Plot of the Output Voltage');


%AC case 1
for i = 1:21 
    for omega = 1:0.2:2*pi

        Vin = 10;
        F = [Vin; 0; 0; 0; 0];
    
        A = omega*C;
    
        H = G+A;
    
        V = H\F;
        V02(i) = V(5);
    
 
    end
end
nexttile
plot(V02);
title('Plot of the Output Voltage');

B = V02/Vin;
nexttile
plot(B);

