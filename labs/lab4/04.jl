using DifferentialEquations
using Plots

# Вариант №35
u0 = [0.0, -1.4]
tspan = (0.0, 33.0)

# Первый случай
function syst(du, u, p, t)
    a = p
    du[1] = u[2]
    du[2] = -a*u[1]
end

p = (7.4)
prob = ODEProblem(syst, u0, tspan, p)
sol = solve(prob, dtmax = 0.05)

# Решение системы
plot(sol)
savefig("4_1_1.png")
# Фазовый портрет
plot(sol, vars=(2,1))
savefig("4_1_2.png")


# Второй случай
function syst(du, u, p, t)
    a, b = p
    du[1] = u[2]
    du[2] = -b*u[1] - a*du[1]
end

p = (10.1, 0.1)
prob = ODEProblem(syst, u0, tspan, p)
sol = solve(prob, dtmax = 0.05)

# Решение системы
plot(sol)
savefig("4_2_1.png")
# Фазовый портрет
plot(sol, vars=(2,1))
savefig("4_2_2.png")


# Третий случай
function syst(du, u, p, t)
    a, b = p
    du[1] = u[2]
    du[2] = -b*u[1] - a*du[1] + 0.2*sin(3.5*t)
end

p = (3.0, 3.3)
prob = ODEProblem(syst, u0, tspan, p)
sol = solve(prob, dtmax = 0.05)

# Решение системы
plot(sol)
savefig("4_3_1.png")
# Фазовый портрет
plot(sol, vars=(2,1))
savefig("4_3_2.png")