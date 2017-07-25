#[1]
#NVD_2017_Updated_RScript.R

#[2]
#install.packages("XML")
#install.packages("methods")
#install.packages("plyr")
#install.packages("dplyr")
#install.packages("anytime")

library(XML)
library(methods)
library(plyr)
library(dplyr)
library(anytime)

#[3]
nvd2017Updated <- xmlParse(file = "nvdcve-2.0-2017-updated.xml")
summary(nvd2017Updated)

#[4]
nvd2017UpdatedList <- xmlToList(nvd2017Updated)
nvd2017UpdatedList
dataNVD2017Updated <- ldply(.data = nvd2017UpdatedList, data.frame)
