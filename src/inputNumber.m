function data = inputNumber()
  iteration = 0
  do
    if (iteration > 0)
      disp("Error! Your input is not valid! Please enter again!")
    endif
    data = input("Please enter number: ")
    iteration++
  until (isa(data, "numeric") & length(data) == 1)
endfunction
