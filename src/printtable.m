#{
 usage: printtable([1 2 3], [2.001 3.2 4.00005], [3 4 5])

 `printtable` -- this is function for print two row-vectors in the table

 Author: Pankov Vasya <pank-su>
#}


function [] = printtable(argument, result, integral)
  # parameters validation
  validateattributes(argument, {"numeric"}, {"row", "size", [1 length(result)], "size" [1 length(integral)]}, "printtable", "x")
  validateattributes(result, {"numeric"}, {"row"})

  printf("/-----------------------------------\\ \n\
|  Argument |  Function |  Integral | \n\
|-----------------------------------| \n")
  for i = 1:length(argument)
    printf("|%11.4f|%11.4f|%11.4f|\n", argument(i), result(i), integral(i))
  endfor
  printf("\\-----------------------------------/ \n")
endfunction
