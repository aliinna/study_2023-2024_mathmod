using Plots
using DifferentialEquations

kr = 35
t1 = 18
p1 =  7.7
t2 = 13
p2 = 8.3
N = 30
q = 1

a1 = kr/(t1*t1*p1*p1*N*q)
a2 = kr/(t2*t2*p2*p2*N*q)
b = kr/(t1*t1*t2*t2*p1*p1*p2*p2*N*q)
c1 = (kr-p1)/(t1*p1)
c2 = (kr-p2)/(t2*p2)

# Первый случай
function ode_fn(du, u, p, t)
    M1, M2 = u
    du[1] = u[1] - b/c1*u[1]*u[2] - a1/c1*u[1]*u[1]
    du[2] = c2/c1*u[2] - b/c1*u[1]*u[2] - a2/c1*u[2]*u[2]
end

v0 = [5.4, 4.1]
tspan = (0.0, 30.0)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob, dtmax = 0.05)
M1 = [u[1] for u in sol.u]
M2 = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt = plot(dpi = 600, legend=:outerbottom)
plot!(plt, T, M1, label = "Оборотные средства фирмы #1", color=:pink)
plot!(plt, T, M2, label = "Оборотные средства фирмы #2", color=:purple)
savefig(plt, "08_01.png")

# Второй случай
function ode_fn(du, u, p, t)
    M1, M2 = u
    du[1] = u[1] - b/c1*u[1]*u[2] - a1/c1*u[1]*u[1]
    du[2] = c2/c1*u[2] - (b/c1+0.00053)*u[1]*u[2] - a2/c1*u[2]*u[2]
end

v0 = [5.4, 4.1]
tspan = (0.0, 30.0)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob, dtmax = 0.05)
M1 = [u[1] for u in sol.u]
M2 = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt = plot(dpi = 600, legend=:outerbottom)
plot!(plt, T, M1, label = "Оборотные средства фирмы #1", color=:pink)
plot!(plt, T, M2, label = "Оборотные средства фирмы #2", color=:purple)
savefig(plt, "08_02.png")