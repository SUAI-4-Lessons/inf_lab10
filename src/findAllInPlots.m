# 

function [x, y] = findAllInPlots(xValues, yValues, fun)
				# TODO: add validation
  findedValue = fun(yValues);

  [_, indexes] = find(abs(yValues - findedValue) < 0.0001); # я очень сильно люблю сравнение вещ. чисел

  x = xValues(indexes);
  y = ones(1, length(x)) * findedValue;
endfunction
