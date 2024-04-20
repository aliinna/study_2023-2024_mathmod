using DifferentialEquations
using Plots

# Вариант №35
people = Float64[31050, 20002]

# Первый случай
a = [0.0, 1.0]
function syst(du, u, p, t)
    du[1] = -0.25*u[1] - 0.74*u[2] + sin(t+5)
    du[2] = -0.64*u[1] - 0.55*u[2] + cos(t+6)    
end

prob = ODEProblem(syst, people, a)
sol = solve(prob, dtmax=0.1)
A1 = [u[1] for u in sol.u]
A2 = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt = plot(title=:"Модель боевых действий - первый случай")
plot!(plt, T, A1, label=:"Численность армии X")
plot!(plt, T, A2, label=:"Численность армии Y", color=:pink)
savefig("3_1.png")

# Второй случай
a = [0.0, 0.009]
function syst(du, u, p, t)
    du[1] = -0.32*u[1] - 0.89*u[2] + 2*sin(10*t)
    du[2] = -0.51*u[1]*u[2] - 0.62*u[2] + 2*cos(10*t)    
end

prob = ODEProblem(syst, people, a)
sol = solve(prob, dtmax=0.1)
A1 = [u[1] for u in sol.u]
A2 = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt = plot(title=:"Модель боевых действий - второй случай")
plot!(plt, T, A1, label=:"Численность армии X")
plot!(plt, T, A2, label=:"Численность армии Y", color=:pink)
savefig("3_2.png")