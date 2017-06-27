#NVD_Recent_RScript.R

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

nvdRecent <- xmlParse(file = "nvdcve-2.0-recent.xml")
summary(nvdRecent)

nvdRecentList <- xmlToList(nvdRecent)
nvdRecentList
dataNVDRecent <- ldply(.data = nvdRecentList, data.frame)
