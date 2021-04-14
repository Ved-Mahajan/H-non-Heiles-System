using DifferentialEquations, Plots, LaTeXStrings

##
function Hénon_Heiles(du,u,p,t)
    x  = u[1]
    y  = u[2]
    dx = u[3]
    dy = u[4]
    du[1] = dx
    du[2] = dy
    du[3] = -x - 2x*y
    du[4] = y^2 - y -x^2
end

##
initial1 = [1/6,0.0,-0.2,0.0]
initial2 = [1/6,0.0 + 0.01,-0.2+0.01,0.0]

##
e,x,y,ydot = initial1
xdot = sqrt(2*e - ydot^2 - y^2 + (2//3)*y^3)
ini = [x,y,xdot,ydot]
tspan = (0,150.)
prob = ODEProblem(Hénon_Heiles, ini, tspan)
sol = solve(prob, Vern9(), abs_tol=1e-16, rel_tol=1e-16,saveat = 0.1);
plot(sol, vars=(1,2), title = "The orbit of the Hénon-Heiles system", xaxis = "x", yaxis = "y", label = false,linecolor = :blue)
scatter!([x],[y],label = false,markercolor = :blue)

##
e2,x2,y2,ydot2 = initial2
xdot2 = sqrt(2*e2 - ydot2^2 - y2^2 + (2//3)*y2^3)
ini2 = [x2,y2,xdot2,ydot2]
prob2 = ODEProblem(Hénon_Heiles, ini2, tspan)
sol2 = solve(prob2, Vern9(), abs_tol=1e-16, rel_tol=1e-16,saveat = 0.1);
plot!(sol2, vars=(1,2), label = false,linecolor = :red)
scatter!([x2],[y2],label = false,markercolor = :red)
