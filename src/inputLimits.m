
function [min, max] = inputLimits()
  iteration = 0
  do
    if (iteration > 0)
      disp("Error! Your input is not valid! Please enter again!")
    endif
    disp("Please enter limits:")
    [min max] = {inputNumber inputNumber}{:}
    iteration++
  until (min < max)
endfunction
