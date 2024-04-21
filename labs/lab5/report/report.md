<<<<<<< HEAD
---
## Front matter
title: "Шаблон отчёта по лабораторной работе"
subtitle: "Простейший вариант"
author: "Дмитрий Сергеевич Кулябов"

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

Здесь приводится формулировка цели лабораторной работы. Формулировки
цели для каждой лабораторной работы приведены в методических
указаниях.

Цель данного шаблона --- максимально упростить подготовку отчётов по
лабораторным работам.  Модифицируя данный шаблон, студенты смогут без
труда подготовить отчёт по лабораторным работам, а также познакомиться
с основными возможностями разметки Markdown.

# Задание

Здесь приводится описание задания в соответствии с рекомендациями
методического пособия и выданным вариантом.

# Теоретическое введение

Здесь описываются теоретические аспекты, связанные с выполнением работы.

Например, в табл. [-@tbl:std-dir] приведено краткое описание стандартных каталогов Unix.

: Описание некоторых каталогов файловой системы GNU Linux {#tbl:std-dir}

| Имя каталога | Описание каталога                                                                                                          |
|--------------|----------------------------------------------------------------------------------------------------------------------------|
| `/`          | Корневая директория, содержащая всю файловую                                                                               |
| `/bin `      | Основные системные утилиты, необходимые как в однопользовательском режиме, так и при обычной работе всем пользователям     |
| `/etc`       | Общесистемные конфигурационные файлы и файлы конфигурации установленных программ                                           |
| `/home`      | Содержит домашние директории пользователей, которые, в свою очередь, содержат персональные настройки и данные пользователя |
| `/media`     | Точки монтирования для сменных носителей                                                                                   |
| `/root`      | Домашняя директория пользователя  `root`                                                                                   |
| `/tmp`       | Временные файлы                                                                                                            |
| `/usr`       | Вторичная иерархия для данных пользователя                                                                                 |

Более подробно про Unix см. в [@tanenbaum_book_modern-os_ru; @robbins_book_bash_en; @zarrelli_book_mastering-bash_en; @newham_book_learning-bash_en].

# Выполнение лабораторной работы

Описываются проведённые действия, в качестве иллюстрации даётся ссылка на иллюстрацию (рис. [-@fig:001]).

![Название рисунка](image/placeimg_800_600_tech.jpg){#fig:001 width=70%}

# Выводы

Здесь кратко описываются итоги проделанной работы. t~0~

# Список литературы{.unnumbered}

::: {#refs}
:::
=======
---
## Front matter
title: "Отчёт по лабораторной работе №5"
subtitle: "Модель хищник-жертва"
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

Изучение модели хищник-жертва.

# Задание
В лесу проживают _х_ число волков, питающихся зайцами, число которых в этом же лесу_ у_. Пока число зайцев достаточно велико, для прокормки всех волков, численность волков растет до тех пор, пока не наступит момент, что корма перестанет хватать на всех. Тогда волки начнут умирать, и их численность будет уменьшаться. В этом случае в какой-то момент времени численность зайцев снова начнет увеличиваться, что повлечет за собой новый рост популяции волков. Такой цикл будет повторяться, пока обе  популяции будут существовать. Помимо этого, на численность стаи влияют болезни и старение. Данная модель описывается следующим уравнением:
 $$
        \begin{cases}
	        \frac{dx}{dt} = -ax(t)+bx(t)y(t)
	        \\   
	        \frac{dy}{dt} = cy(t)-dx(t)y(t)
        \end{cases},
        $$
где _a, d_ - коэффициенты смертности, _b, c_ - коэффициенты прироста популяции.

1. Построить график зависимости _x_ от _y_;
2. Построить графики функций _x(t)_ и _y(t)_;
3. Найти стационарное состояние системы.

Вариант №35:
$$
 \begin{cases}
	\frac{dx}{dt} = -0.29x(t)+0.031x(t)y(t)
	\\   
	\frac{dy}{dt} = 0.33y(t)-0.024x(t)y(t)
 \end{cases}
$$

# Теоретическое введение

Простейшая модель взаимодействия двух видов типа «хищник — жертва» - модель Лотки-Вольтерры. Данная двувидовая модель основывается на следующих предположениях:
   1. Численность популяции жертв x и хищников y зависят только от времени (модель не учитывает пространственное распределение популяции на занимаемой территории);
   2. В отсутствии взаимодействия численность видов изменяется по модели Мальтуса, при этом число жертв увеличивается, а число хищников падает;
   3. Естественная смертность жертвы и естественная рождаемость хищника считаются несущественными;
   4. Эффект насыщения численности обеих популяций не учитывается;
   5. Скорость роста численности жертв уменьшается пропорционально численности хищников.
        $$
        \begin{cases}
	        \frac{dx}{dt} = ax(t)-bx(t)y(t)
	        \\   
	        \frac{dy}{dt} = -cy(t)+dx(t)y(t)
        \end{cases}.
        $$
В этой модели _x_ – число жертв, _y_ - число хищников. Коэффициент _a_ описывает скорость естественного прироста числа жертв в отсутствие хищников, _с_ - естественное вымирание хищников, лишенных пищи в виде жертв. Вероятность взаимодействия жертвы и хищника считается пропорциональной как количеству жертв, так и числу самих хищников _(xy)_. Каждый акт взаимодействия уменьшает популяцию жертв, но способствует увеличению популяции хищников. 

# Выполнение лабораторной работы
## Программный код на Julia.
```
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
```
## Результат выполнения программы
1.  Построила график зависимости _x_ от _y_ (рис. [-@fig:001]).

![График зависимости _x_ от _y_](5_1.png){#fig:001 width=70%}

2. Построила графики функций _x(t)_ и _y(t)_ (рис. [-@fig:002]).

![Графики функций _x(t)_ и _y(t)_](5_2.png){#fig:002 width=70%}

3. Нашла стационарное состояние системы (рис. [-@fig:003]).
   
![Стационарное состояние системы](5_3.png){#fig:003 width=70%}

# Выводы

Изучила жесткую модель хищник-жертва.
>>>>>>> fcf77de3714b6a63fda6ab0277b5d641afdf54cd
