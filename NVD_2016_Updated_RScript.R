#[1]
#NVD_2016_Updated_RScript.R

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
nvd2016Updated <- xmlParse(file = "nvdcve-2.0-2016-updated.xml")
summary(nvd2016Updated)

#[4]
nvd2016UpdatedList <- xmlToList(nvd2016Updated)
nvd2016UpdatedList
dataNVD2016Updated <- ldply(.data = nvd2016UpdatedList, data.frame)

#[5]
cveID2016Updated <- dataNVD2016Updated$cve.id
cveID2016Updated
cveID2016UpdatedDataFrame <- ldply(cveID2016Updated, data.frame)
colnames(cveID2016UpdatedDataFrame) <- "CVE_ID"

#[6]
summary2016Updated <- dataNVD2016Updated$summary
summary2016Updated
summary2016UpdatedDataFrame <- ldply(summary2016Updated, data.frame)
colnames(summary2016UpdatedDataFrame) <- "Vulnerability_Summary"
