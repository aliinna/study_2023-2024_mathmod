using Plots
using DifferentialEquations

a = 0.29
c = 0.031

b = 0.33
d = 0.024

x0 = 7
y0 = 14

function syst(dx, x, p, t)
    dx[1] = -a*x[1] + c*x[1]*x[2]
    dx[2] = b*x[2] - d*x[1]*x[2]
end

tspan = (0.0, 60.0)

prob = ODEProblem(syst, [x0, y0], tspan)
sol = solve(prob, dtmax = 0.05)
X = [x[1] for x in sol.u]
Y = [x[2] for x in sol.u]
T = [t for t in sol.t]

plot(X, Y, legend = false)
savefig("5_1.png")

p = plot(T, X, label="Численность хищников")
plot!(p, T, Y, label="Численность жертв", color=:pink)
savefig("5_2.png")

x00 = b/d
y00 = a/c

prob = ODEProblem(syst, [x00, y00], tspan)
sol = solve(prob, dtmax = 0.05)
X = [x[1] for x in sol.u]
Y = [x[2] for x in sol.u]
T = [t for t in sol.t]

p = plot(T, X, label="Численность хищников")
plot!(p, T, Y, label="Численность жертв", color=:pink)
savefig("5_3.png")