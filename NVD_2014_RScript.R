#NVD_2014_RScript.R

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

nvd2014 <- xmlParse(file = "nvdcve-2.0-2014.xml")
summary(nvd2014)

nvd2014List <- xmlToList(nvd2014)
nvd2014List
dataNVD2014 <- ldply(.data = nvd2014List, data.frame)
