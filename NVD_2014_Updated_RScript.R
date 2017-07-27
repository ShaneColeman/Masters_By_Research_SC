#[1]
#NVD_2014_Updated_RScript.R

#[2]***
#https://support.rstudio.com/hc/en-us/community/posts/115000475648-Memory-limit
memory.limit()
memory.size(15000)

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
nvd2014Updated <- xmlParse(file = "nvdcve-2.0-2014-updated.xml")
summary(nvd2014Updated)
