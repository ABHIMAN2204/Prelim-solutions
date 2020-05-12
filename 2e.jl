using DifferentialEquations
using Plots
gr(size=(500,500), show = true)  #use the gr backend for plotting

#Function for the lorenz equation
#u[1] = x; u[2] = y; u[3] = z
function lorenz!(du,u,p,t)
    dy = 1.05
    dz = 1.04
    ax = 0.0039
    ay=0.0043
    bx =6.1
    by=5.7
    zx = 1.3e-5
    yz=11e-3
    nzx =2.32
    xz = 12e-2
    xy=7.9e-4
    nxz=2
    nxy=2
    nyz=2
    S=100

 du[1] = -u[1] + (ax+bx*S)/(1+S+(u[3]/zx)^(nzx))               #dx/dt
 du[2] = -dy*u[2] + (ay+by*S)/(1+S+(u[1]/xy)^(nxy))       #dy/dt
 du[3] = -dz*u[3] + (1)/(1+((u[1]/xz)^(nxz))+((u[2]/yz)^(nyz)))        #dz/dt
end

u0 = [5.5;0.01;0.00049]                      #intial conditions
u1 = [4.125;0.075;0.0003675]
u2 = [6.875;1.25;0.000612]
tspan = (0.0,100.0)                     #start and end time
prob = ODEProblem(lorenz!,u0,tspan)     #Create an ODE problem for the Lorenz fxn
prob1 = ODEProblem(lorenz!,u1,tspan)
prob2 = ODEProblem(lorenz!,u2,tspan)
sol = solve(prob)                      #Solve the system
sol1 = solve(prob1)
sol2 = solve(prob2)

#Plot the results; the vars=(0,1) argument specifies to plot X (column 1 of sol)
#vs t (column 0 of sol)
plt1 = plot(sol,vars=(0,1), xaxis="t", yaxis = "X",label="cell 1" )
 plot!(sol1,vars=(0,1), xaxis="t", yaxis = "X", label="cell 2")
 plot!(sol2,vars=(0,1), xaxis="t", yaxis = "X", label="cell 3")
display(plt1)


#Plot the results; the vars=(0,1) argument specifies to plot Y (column 1 of sol)
#vs t (column 0 of sol)
plt2 = plot(sol,vars=(0,2), xaxis="t", yaxis = "Y",label="cell 1" )
plot!(sol1,vars=(0,2), xaxis="t", yaxis = "Y", label="cell 2")
plot!(sol2,vars=(0,2), xaxis="t", yaxis = "Y", label="cell 3")
display(plt2)


#Plot the results; the vars=(0,3) argument specifies to plot Z (column 3 of sol)
#vs t
plt3 = plot(sol,vars=(0,3), xaxis="t", yaxis = "Z",label="cell 1")
plot!(sol1,vars=(0,3), xaxis="t", yaxis = "Z", label="cell 2")
plot!(sol2,vars=(0,3), xaxis="t", yaxis = "Z", label="cell 3")
display(plt3)

#Plot the results; the vars=(1,2,3) argument specifies to plot X vs Y vs Z
plt3 = plot(sol,vars=(1,2,3), xaxis="X", yaxis="Y", zaxis="Z",label="cell 1")
plot!(sol1,vars=(1,2,3), xaxis="t", yaxis = "X", label="cell 2")
plot!(sol2,vars=(1,2,3), xaxis="t", yaxis = "X", label="cell 3")
display(plt3)

#Plot the results; the vars=(1,2,3) argument specifies to plot X vs Y vs Z
plt4 = plot(sol,vars=(1,2), xaxis="X", yaxis="Y",label="cell 1")
plot!(sol1,vars=(1,2), xaxis="t", yaxis = "X", label="cell 2")
plot!(sol2,vars=(1,2), xaxis="t", yaxis = "X", label="cell 3")
display(plt4)
