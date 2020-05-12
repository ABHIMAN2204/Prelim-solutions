
%For plotting unstable and stable steady states toggle switch
syms u z x


A=zeros(1000,1000);
S1=linspace(0.0001,0.0,500);


for i=1:500
    
     S1=S(i);
     
     x0 = [0,0];
     eqn1 = -x + (1.5+5.0*S1)/(1+S1+(z/0.4)^(2.7))==0;               
eqn2 = -1*z + (1)/(1+((x/1.5)^(2.7)))==0;

eqns=[eqn1 eqn2];
   
soln = vpasolve(eqns,[x,z],x0);
display(soln.x)
display(i)
display(S(i))


A(i,2)=S1;
if(soln.x>0)
A(i,1)=soln.x;
end
    end



    
scatter((A(:,2)),A(:,1))


