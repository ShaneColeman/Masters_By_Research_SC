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

#[4]
nvd2014UpdatedList <- xmlToList(nvd2014Updated)
nvd2014UpdatedList
dataNVD2014Updated <- ldply(.data = nvd2014UpdatedList, data.frame)

#[5]
cveID2014Updated <- dataNVD2014Updated$cve.id
cveID2014Updated
cveID2014UpdatedDataFrame <- ldply(cveID2014Updated, data.frame)
colnames(cveID2014UpdatedDataFrame) <- "CVE_ID"

#[6]
summary2014Updated <- dataNVD2014Updated$summary
summary2014Updated
summary2014UpdatedDataFrame <- ldply(summary2014Updated, data.frame)
colnames(summary2014UpdatedDataFrame) <- "Vulnerability_Summary"
