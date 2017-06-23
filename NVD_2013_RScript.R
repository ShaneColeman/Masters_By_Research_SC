#NVD_2013_RScript.R

install.packages("XML")
install.packages("methods")
install.packages("plyr")
install.packages("dplyr")
install.packages("anytime")

library(XML)
library(methods)
library(plyr)
library(dplyr)
library(anytime)

nvd2013 <- xmlParse(file = "nvdcve-2.0-2013.xml")
summary(nvd2013)
