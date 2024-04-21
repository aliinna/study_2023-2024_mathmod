using DifferentialEquations
using Plots

N = 1030
n0 = 8

# Первый случай
function ode_fn(du, u, p, t)
    (n) = u
    du[1] = (0.83 + 0.000083*u[1])*(N - u[1])
end

v0 = [n0]
tspan = (0.0, 30.0)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob, dtmax = 0.05)
n = [u[1] for u in sol.u]
T = [t for t in sol.t]

plt = plot(dpi = 600, title = "Эффективность распространения рекламы (1) ", legend = false)
plot!(plt, T, n, color=:pink)
savefig("07_01.png")


# Второй случай
function ode_fn(du, u, p, t)
    (n) = u
    du[1] = (0.000083 + 0.83*u[1])*(N - u[1])
end

v0 = [n0]
tspan = (0.0, 0.1)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob, dtmax = 0.05)
n = [u[1] for u in sol.u]
T = [t for t in sol.t]

max_dn = 0;
max_dn_t = 0;
max_dn_n = 0;
for (i, t) in enumerate(T)
    if sol(t, Val{1})[1] > max_dn
        global max_dn = sol(t, Val{1})[1]
        global max_dn_t = t
        global max_dn_n = n[i]
    end
end

plt = plot(dpi = 600, title = "Эффективность распространения рекламы (2) ", legend = false)
plot!(plt, T, n, color=:pink)
plot!(plt, [max_dn_t], [max_dn_n], seriestype=:scatter, color=:purple)
savefig("07_02.png")

# Третий случай
function ode_fn(du, u, p, t)
    (n) = u
    du[1] = (0.83 + 0.83*u[1])*sin(t)*(N - u[1])
end

v0 = [n0]
tspan = (0.0, 0.1)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob, dtmax = 0.05)
n = [u[1] for u in sol.u]
T = [t for t in sol.t]

plt = plot(dpi = 600, title = "Эффективность распространения рекламы (3) ", legend = false)
plot!(plt, T, n, color=:pink)
savefig("07_03.png")