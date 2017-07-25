#[1]
#NVD_2016_Updated_RScript.R

#[2]
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

#[3]
nvd2016Updated <- xmlParse(file = "nvdcve-2.0-2016-updated.xml")
summary(nvd2016Updated)
