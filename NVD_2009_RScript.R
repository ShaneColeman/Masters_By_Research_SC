#NVD_2009_RScript.R (Test)

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

nvd2009 <- xmlParse(file = "nvdcve-2.0-2009.xml")
summary(nvd2009)

nvd2009List <- xmlToList(nvd2009)
nvd2009List
dataNVD2009 <- ldply(.data = nvd2009List, data.frame)

