enteredFormula = input("Enter math formula\n","s")

formula = eval(["@(x) " enteredFormula], 'error("Entered formula is invalid")');

[start, endl] = inputLimits;

step = abs(start - endl) / 15.0;

# 15 точек для таблицы 
x_for_table = start:step:endl;
y_for_table = arrayfun(formula, x_for_table);

# интеграл ддя таблицы
int_for_table = arrayfun(@(x) quad(formula, start, x), x_for_table);


printtable(x_for_table, y_for_table, int_for_table)

# шаг для графика
# Строим графики для функции

stepToPlot = abs(start - endl) / 1000

xPlot = start:stepToPlot:endl;
yPlot = arrayfun(formula, xPlot);

[maxXs, maxYs] = findAllInPlots(xPlot, yPlot, @max);
[minXs, minYs] = findAllInPlots(xPlot, yPlot, @min);

figure;
subplot(2, 1, 1);


line = plot(xPlot, yPlot, '-.b', "linewidth", 2.5)
hold on               
dots = plot(x_for_table, y_for_table ,'.g', "markersize", 10)
maxs = plot(maxXs, maxYs, "_r", "markersize", 20)
mins = plot(minXs, minYs, "_", "markersize", 20, "markeredgecolor", "#317833")
hold off
grid on
legend({["y = " enteredFormula], "Точки на графике", "Максимальные точки", "Минимальные точки"})
title("График функции")

subplot(2,1,2)


# Строим графики для интеграла функции

yIntPlot = arrayfun(@(x) quad(formula, start, x), xPlot);

[maxIntXs, maxIntYs] = findAllInPlots(xPlot, yIntPlot, @max);

[minIntXs, minIntYs] = findAllInPlots(xPlot, yIntPlot, @min);

line = plot(xPlot, yIntPlot, '--g', "linewidth", 2.25)
hold on               
dots = plot(x_for_table, int_for_table ,'.g', "markersize", 10)
maxs = plot(maxIntXs, maxIntYs, "_r", "markersize", 20)
mins = plot(minIntXs, minIntYs, "_", "markersize", 20, "markeredgecolor", "#317833")
hold off
grid on

legend({["\\int\\limits " enteredFormula " dx"], "Точки на графике", "Максимальные точки", "Минимальные точки"})
title("График интеграла функции")
