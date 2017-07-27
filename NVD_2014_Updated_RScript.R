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

#[7]
publishedDateTime2014Updated <- dataNVD2014Updated$published.datetime
publishedDateTime2014Updated
#----------Vulnerability_Published_Date----------#
publishedDate2014Updated <- anydate(publishedDateTime2014Updated) #Published Date 2014
publishedDate2014Updated
publishedDate2014UpdatedDataFrame <- ldply(publishedDate2014Updated, data.frame)
colnames(publishedDate2014UpdatedDataFrame) <- "Vulnerability_Published_Date"

#[8]
#----------Vulnerability_Published_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
publishedTime2014Updated <- iso8601(anytime(publishedDateTime2014Updated, tz = "UTC"))
publishedTime2014Updated
#http://rfunction.com/archives/1499
publishedTimeSplit2014Updated <- strsplit(publishedTime2014Updated, " ") 
publishedTimeSplit2014Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
publishedTimeSplitSecondElement2014Updated <- sapply(publishedTimeSplit2014Updated, "[", 2)
publishedTimeSplitSecondElement2014Updated
publishedTime2014UpdatedDataFrame <- ldply(publishedTimeSplitSecondElement2014Updated, data.frame)
colnames(publishedTime2014UpdatedDataFrame) <- "Vulnerability_Published_Time"

#[9]
lastModifiedDateTime2014Updated <- dataNVD2014Updated$last.modified.datetime
lastModifiedDateTime2014Updated
#----------Vulnerability_Last_Modified_Date----------#
lastModifiedDate2014Updated <- anydate(lastModifiedDateTime2014Updated)
lastModifiedDate2014Updated
lastModifiedDate2014UpdatedDataFrame <- ldply(lastModifiedDate2014Updated, data.frame)
colnames(lastModifiedDate2014UpdatedDataFrame) <- "Vulnerability_Last_Modified_Date"

#[10]
#----------Vulnerability_Last_Modified_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
lastModifiedTime2014Updated <- iso8601(anytime(lastModifiedDateTime2014Updated, tz = "UTC"))
lastModifiedTime2014Updated
#http://rfunction.com/archives/1499
lastModifiedTimeSplit2014Updated <- strsplit(lastModifiedTime2014Updated, " ") 
lastModifiedTimeSplit2014Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
lastModifiedTimeSplitSecondElement2014Updated <- sapply(lastModifiedTimeSplit2014Updated, "[", 2)
lastModifiedTimeSplitSecondElement2014Updated
lastModifiedTime2014UpdatedDataFrame <- ldply(lastModifiedTimeSplitSecondElement2014Updated, data.frame)
colnames(lastModifiedTime2014UpdatedDataFrame) <- "Vulnerability_Last_Modified_Time"

#[11]
cvss2014Updated <- dataNVD2014Updated$cvss.base_metrics.score
cvss2014Updated
cvss2014UpdatedDataFrame <- ldply(cvss2014Updated, data.frame)
colnames(cvss2014UpdatedDataFrame) <- "CVSS_Score"
