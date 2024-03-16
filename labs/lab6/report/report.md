---
## Front matter
title: "Отчёт по лабораторной работе №6"
subtitle: "Задача об эпидемии"
author: "Гайсина Алина Ринатовна"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Рассмотреть простейшую задачу об эпидемии, научиться решать её.

# Задание
Придумать свой пример задачи об эпидемии, задать начальные условия и коэффициенты пропорциональности. Построить графики изменения числа особей в каждой из трех групп. Рассмотреть, как будет протекать эпидемия в случае, если:
$
а)\ I(0) \le I^*;
\\
б)\ I(0)>I^*.
$

## Вариант №35:
На одном острове вспыхнула эпидемия. Известно, что из всех проживающих на острове _(N=12300)_ в момент начала эпидемии _(t=0)_ число заболевших людей (являющихся распространителями инфекции) _I(0)=140_, а число здоровых людей с иммунитетом к болезни _R(0)=54_. Таким образом, число людей восприимчивых к болезни, но пока здоровых, в начальный момент времени _S(0)=N-I(0)-R(0)_. Постройте графики изменения числа особей в каждой из трех групп. Рассмотрите, как будет протекать эпидемия в случае, если:
$
а)\ I(0) \le I^*;
\\
б)\ I(0)>I^*.
$

# Теоретическое введение
Рассмотрим простейшую модель эпидемии. Предположим, что некая популяция, состоящая из _N_ особей, (считаем, что популяция изолирована) подразделяется на три группы. Первая группа - это восприимчивые к болезни, но пока здоровые особи, обозначим их через _S(t)_. Вторая группа – это число инфицированных особей, которые также при этом являются распространителями инфекции, обозначим их _I(t)_. А третья группа, обозначающаяся через _R(t)_ – это здоровые особи с иммунитетом к болезни. 
До того, как число заболевших не превышает критического значения _I^*_, считаем, что все больные изолированы и не заражают здоровых. Когда _I(0)>I^*_, тогда инфицирование способны заражать восприимчивых к болезни особей.
Таким образом, скорость изменения числа _S(t)_ меняется по следующему закону:
$$
  \begin{cases}
    \frac{dS}{dt} = -aS, I(t)>I^*
    \\
    \frac{dS}{dt} = 0, I(t) \le I^*
  \end{cases}
$$
Поскольку каждая восприимчивая к болезни особь, которая, в конце концов, заболевает, сама становится инфекционной, то скорость изменения числа инфекционных особей представляет разность за единицу времени между заразившимися и теми, кто уже болеет и лечится, т.е.:
$$
  \begin{cases}
    \frac{dI}{dt} = aS - bI, I(t)>I^*
    \\
    \frac{dI}{dt} = -bI, I(t) \le I^*
  \end{cases}
$$
А скорость изменения выздоравливающих особей (при этом приобретающие иммунитет к болезни)
$$ \frac{dR}{dt} = bI $$
Постоянные пропорциональности _a_ и _b_ - это коэффициенты заболеваемости и выздоровления соответственно.

# Выполнение лабораторной работы
## Программный код на Julia.
```
using Plots
using DifferentialEquations

a = 0.4
b = 0.5
N = 12300
I0 = 140
R0 = 54
S0 = N - I0 - R0
x0 = [S0; I0; R0]
tspan = (0.0, 200.0)

#cлучай, когда I(0)<=I*
function syst(dx, x, p, t)
    dx[1] = 0
    dx[2] = -b*x[2]
    dx[3] = b*x[2]
end

prob = ODEProblem(syst, x0, tspan)
sol = solve(prob, dtmax = 0.05)

S = [x[1] for x in sol.u]
I = [x[2] for x in sol.u]
R = [x[3] for x in sol.u]
T = [t for t in sol.t]

p = plot(T, S, label = "S(t)")
plot!(p, T, I, label = "I(t)", color=:purple)
plot!(p, T, R, label = "R(t)", color=:pink)
savefig("6_1.png")

#cлучай, когда I(0)>I*
function syst(dx, x, p, t)
    dx[1] = -a*x[1]
    dx[2] = a*x[1] - b*x[2]
    dx[3] = b*x[2]
end

prob = ODEProblem(syst, x0, tspan)
sol = solve(prob, dtmax = 0.05)

S = [x[1] for x in sol.u]
I = [x[2] for x in sol.u]
R = [x[3] for x in sol.u]
T = [t for t in sol.t]

p = plot(T, S, label = "S(t)")
plot!(p, T, I, label = "I(t)", color=:purple)
plot!(p, T, R, label = "R(t)", color=:pink)
savefig("6_2.png")
```
## Результат выполнения программы
1.  Построила график изменения числа людей в каждой из трёх групп в случае, когда _I(0) \le I^*_ (рис. [-@fig:001]).

![ Динамика изменения числа людей в каждой из трех групп в случае, когда _I(0) \le I^*_, с начальными условиями I(0) = 140, R(0) = 54, S(0) = 12106](6_1.png){#fig:001 width=70%}

2. Построила график изменения числа людей в каждой из трёх групп в случае, когда _I(0) > I^*_ (рис. [-@fig:002]).

![Динамика изменения числа людей в каждой из трех групп в случае, когда _I(0) > I^*_, с начальными условиями I(0) = 140, R(0) = 54, S(0) = 12106](6_2.png){#fig:002 width=70%}

# Выводы
Изучила задачу об эпидемии.