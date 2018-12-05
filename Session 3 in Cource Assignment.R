  Charvector = c("Apple","Banana","Grapes","Mango","Melon")
  Numvector  = c(1.1,2.2,3.3,4.4,5.5)
  Intvector  = c(1L,4L,5L,8L,9.L)   
  Cmplxvector= c(1+41,3+3i,7+2i)  
  Logivector = c(TRUE, FALSE, FALSE, TRUE, TRUE)

  # logical ops on vectors
  
  Notchar = !Charvector
  a = !Numvector
  b = !Intvector
  c = !Cmplxvector
  d = !Logivector  
  
  Nummax = max(Numvector)
  Nummin = min(Numvector)  
  
  Charsort = sort(Charvector)
  class(Charvector)  
  class(Numvector)  
  class(Cmplxvector)

  length(Numvector)  
  length(c)
  