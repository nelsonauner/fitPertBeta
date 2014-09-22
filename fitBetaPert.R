#set working directory:
setwd("C:/Users/n_auner/tech/PERT-shiny")
xvals = seq(from=0,to=50,by=.1)
plot(x=xvals,y=dpert(xvals,min=0,max=50,mode=30,shape=15),type="l",
     xlab="Value",ylab="Density",main="Shifted Beta density by defining mode=30, min=0, and max=50")
for (i_shape in c(1,2.5,4,7)) {lines(x=xvals,y=dpert(xvals,min=0,max=50,mode=30,shape=i_shape),type="l")}

source('fitPertBeta.R')

  

#Now test out the functions with its defaults.
fit_res <- fitPertBeta()
f_min = fit_res$par[1]
f_max = fit_res$par[2]
ppert(0,min=f_min,mode=25,max=f_max)
#This concludes the test.
