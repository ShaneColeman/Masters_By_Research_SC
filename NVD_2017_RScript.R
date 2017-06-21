#NVD_2017_RScript.R

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

nvd2017 <- xmlParse(file = "nvdcve-2.0-2017.xml")
summary(nvd2017)

