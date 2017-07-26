#[1]
#NVD_2015_Updated_RScript.R

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
nvd2015Updated <- xmlParse(file = "nvdcve-2.0-2015-updated.xml")
summary(nvd2015Updated)

#[4]
nvd2015UpdatedList <- xmlToList(nvd2015Updated)
nvd2015UpdatedList
dataNVD2015Updated <- ldply(.data = nvd2015UpdatedList, data.frame)

#[5]
cveID2015Updated <- dataNVD2015Updated$cve.id
cveID2015Updated
cveID2015UpdatedDataFrame <- ldply(cveID2015Updated, data.frame)
colnames(cveID2015UpdatedDataFrame) <- "CVE_ID"

#[6]
summary2015Updated <- dataNVD2015Updated$summary
summary2015Updated
summary2015UpdatedDataFrame <- ldply(summary2015Updated, data.frame)
colnames(summary2015UpdatedDataFrame) <- "Vulnerability_Summary"

#[7]
publishedDateTime2015Updated <- dataNVD2015Updated$published.datetime
publishedDateTime2015Updated
#----------Vulnerability_Published_Date----------#
publishedDate2015Updated <- anydate(publishedDateTime2015Updated) #Published Date 2015
publishedDate2015Updated
publishedDate2015UpdatedDataFrame <- ldply(publishedDate2015Updated, data.frame)
colnames(publishedDate2015UpdatedDataFrame) <- "Vulnerability_Published_Date"

#[8]
#----------Vulnerability_Published_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
publishedTime2015Updated <- iso8601(anytime(publishedDateTime2015Updated, tz = "UTC"))
publishedTime2015Updated
#http://rfunction.com/archives/1499
publishedTimeSplit2015Updated <- strsplit(publishedTime2015Updated, " ") 
publishedTimeSplit2015Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
publishedTimeSplitSecondElement2015Updated <- sapply(publishedTimeSplit2015Updated, "[", 2)
publishedTimeSplitSecondElement2015Updated
publishedTime2015UpdatedDataFrame <- ldply(publishedTimeSplitSecondElement2015Updated, data.frame)
colnames(publishedTime2015UpdatedDataFrame) <- "Vulnerability_Published_Time"

#[9]
lastModifiedDateTime2015Updated <- dataNVD2015Updated$last.modified.datetime
lastModifiedDateTime2015Updated
#----------Vulnerability_Last_Modified_Date----------#
lastModifiedDate2015Updated <- anydate(lastModifiedDateTime2015Updated)
lastModifiedDate2015Updated
lastModifiedDate2015UpdatedDataFrame <- ldply(lastModifiedDate2015Updated, data.frame)
colnames(lastModifiedDate2015UpdatedDataFrame) <- "Vulnerability_Last_Modified_Date"

#[10]
#----------Vulnerability_Last_Modified_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
lastModifiedTime2015Updated <- iso8601(anytime(lastModifiedDateTime2015Updated, tz = "UTC"))
lastModifiedTime2015Updated
#http://rfunction.com/archives/1499
lastModifiedTimeSplit2015Updated <- strsplit(lastModifiedTime2015Updated, " ") 
lastModifiedTimeSplit2015Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
lastModifiedTimeSplitSecondElement2015Updated <- sapply(lastModifiedTimeSplit2015Updated, "[", 2)
lastModifiedTimeSplitSecondElement2015Updated
lastModifiedTime2015UpdatedDataFrame <- ldply(lastModifiedTimeSplitSecondElement2015Updated, data.frame)
colnames(lastModifiedTime2015UpdatedDataFrame) <- "Vulnerability_Last_Modified_Time"

#[11]
cvss2015Updated <- dataNVD2015Updated$cvss.base_metrics.score
cvss2015Updated
cvss2015UpdatedDataFrame <- ldply(cvss2015Updated, data.frame)
colnames(cvss2015UpdatedDataFrame) <- "CVSS_Score"
