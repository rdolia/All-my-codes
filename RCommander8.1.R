
data(RcmdrTestDrive, package="RcmdrPlugin.IPSUR")


#average salary by gender
numSummary(RcmdrTestDrive[,"salary", drop=FALSE], 
  groups=RcmdrTestDrive$gender, statistics=c("mean", "sd", "IQR", 
  "quantiles"), quantiles=c(0,.25,.5,.75,1))
#average salary by smoking
numSummary(RcmdrTestDrive[,"salary", drop=FALSE], 
  groups=RcmdrTestDrive$smoking, statistics=c("mean", "sd", "IQR", 
  "quantiles"), quantiles=c(0,.25,.5,.75,1))

