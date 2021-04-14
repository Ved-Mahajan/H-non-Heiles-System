using Plots

V(x,y) = (1/2)*(x^2 + y^2 + 2*x^2*y - (2/3)*y^3)
x = y = range(-1,stop = 1, length = 1000)
V(x,y) = (1/2)*(x^2 + y^2 + 2*x^2*y - (2/3)*y^3)
x = y = range(-1,stop = 1, length = 1000)
contourf(x,y,V)
contour!(x,y,V,levels=0:1/6:1,title = "Henon-Heiles potential: Intensity map",linecolor = :white)
# savefig("potential_intensity.png")

plot(x,y,V,title = "Henon-Heiles potential: Surface map")
# savefig("potential_surface.png")