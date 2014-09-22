
#Find the min, max, and shape parameters by minimizing 
fitPertBeta <- function(q_lower = .05, q_upper = .95, val_lower = 0, val_upper=50,mode=25,shape_param=4) {
  #These can be refined later:
  start_min = val_lower - 5
  start_max = val_upper + 5
  #This is the function that we will try to solve. does the invcdf of the provided quartlies = the propsed? 
  func_solv <- function(input,q_u,p_u,q_l,p_l,mode,shape_param)
  {
    min = input[1]
    max = input[2]
    return(c(qpert(q_l,min,mode,max,shape=shape_param)-p_l,
             qpert(q_u,min,mode,max,shape=shape_param)-p_u)) 
  }
  res <- BBsolve(par=c(start_min,start_max),
                 fn=func_solv,
                 q_u = q_upper,
                 p_u = val_upper,
                 q_l = q_lower,
                 p_l = val_lower,
                 mode = mode,
                 shape_param=shape_param)
  return(res)
}