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

#[12]
#https://nvd.nist.gov/vuln-metrics/cvss
cvssSeverity2014Updated <- dataNVD2014Updated$cvss.base_metrics.score
cvssSeverity2014Updated
cvssSeverity2014UpdatedDataFrame <- ldply(cvssSeverity2014Updated, data.frame)
colnames(cvssSeverity2014UpdatedDataFrame) <- "CVSS_Severity"
str(cvssSeverity2014UpdatedDataFrame)
View(cvssSeverity2014UpdatedDataFrame)
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity) == "10.0"] <- "HIGH"
levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity) >= 7.0 & 
																											 	levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity) < 9.9] <- "HIGH"
levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity) >= 4.0 & 
																											 	levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity) <= 6.9] <- "MEDIUM"
levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity) >= 0.0 & 
																											 	levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity) <= 3.9] <- "LOW"
View(cvssSeverity2014UpdatedDataFrame)

#[13]
cvssAccessVector2014Updated <- dataNVD2014Updated$cvss.base_metrics.access.vector
cvssAccessVector2014Updated
cvssAccessVector2014UpdatedDataFrame <- ldply(cvssAccessVector2014Updated, data.frame)
colnames(cvssAccessVector2014UpdatedDataFrame) <- "CVSS_Access_Vector"

#[14]
cvssAccessComplexity2014Updated <- dataNVD2014Updated$cvss.base_metrics.access.complexity
cvssAccessComplexity2014Updated
cvssAccessComplexity2014UpdatedDataFrame <- ldply(cvssAccessComplexity2014Updated, data.frame)
colnames(cvssAccessComplexity2014UpdatedDataFrame) <- "CVSS_Access_Complexity"

#[15]
cvssAuthentication2014Updated <- dataNVD2014Updated$cvss.base_metrics.authentication
cvssAuthentication2014Updated
cvssAuthentication2014UpdatedDataFrame <- ldply(cvssAuthentication2014Updated, data.frame)
colnames(cvssAuthentication2014UpdatedDataFrame) <- "CVSS_Authentication"

#[16]
cvssConfidentialityImpact2014Updated <- dataNVD2014Updated$cvss.base_metrics.confidentiality.impact
cvssConfidentialityImpact2014Updated
cvssConfidentialityImpact2014UpdatedDataFrame <- ldply(cvssConfidentialityImpact2014Updated, data.frame)
colnames(cvssConfidentialityImpact2014UpdatedDataFrame) <- "CVSS_Confidentiality_Impact"

#[17]
cvssIntegrityImpact2014Updated <- dataNVD2014Updated$cvss.base_metrics.integrity.impact
cvssIntegrityImpact2014Updated
cvssIntegrityImpact2014UpdatedDataFrame <- ldply(cvssIntegrityImpact2014Updated, data.frame)
colnames(cvssIntegrityImpact2014UpdatedDataFrame) <- "CVSS_Integrity_Impact"

#[18]
cvssAvailabilityImpact2014Updated <- dataNVD2014Updated$cvss.base_metrics.availability.impact
cvssAvailabilityImpact2014Updated
cvssAvailabilityImpact2014UpdatedDataFrame <- ldply(cvssAvailabilityImpact2014Updated, data.frame)
colnames(cvssAvailabilityImpact2014UpdatedDataFrame) <- "CVSS_Availability_Impact"

#[19]
cvssGeneratedOnDateTime2014Updated <- dataNVD2014Updated$cvss.base_metrics.generated.on.datetime
cvssGeneratedOnDateTime2014Updated
#----------CVSS_Generated_On_Date----------#
cvssGeneratedOnDate2014Updated <- anydate(cvssGeneratedOnDateTime2014Updated)
cvssGeneratedOnDate2014UpdatedDataFrame <- ldply(cvssGeneratedOnDate2014Updated, data.frame)
colnames(cvssGeneratedOnDate2014UpdatedDataFrame) <- "CVSS_Generated_On_Date"

#[20]
#----------CVSS_Generated_On_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
cvssGeneratedOnTime2014Updated <- iso8601(anytime(cvssGeneratedOnDateTime2014Updated, tz = "UTC"))
cvssGeneratedOnTime2014Updated
#http://rfunction.com/archives/1499
cvssGeneratedOnTimeSplit2014Updated <- strsplit(cvssGeneratedOnTime2014Updated, " ") 
cvssGeneratedOnTimeSplit2014Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
cvssGeneratedOnTimeSplitSecondElement2014Updated <- sapply(cvssGeneratedOnTimeSplit2014Updated, "[", 2)
cvssGeneratedOnTimeSplitSecondElement2014Updated
cvssGeneratedOnTime2014UpdatedDataFrame <- ldply(cvssGeneratedOnTimeSplitSecondElement2014Updated, data.frame)
colnames(cvssGeneratedOnTime2014UpdatedDataFrame) <- "CVSS_Generated_On_Time"

#[21]
cwe_1_2014Updated <- dataNVD2014Updated$cwe
cwe_1_2014Updated
cwe_1_2014UpdatedDataFrame <- ldply(cwe_1_2014Updated, data.frame)
colnames(cwe_1_2014UpdatedDataFrame) <- "CWE_ID_1"

#[22]
cwe_1_Description2014Updated <- dataNVD2014Updated$cwe
cwe_1_Description2014Updated
cwe_1_Description2014UpdatedDataFrame <- ldply(cwe_1_Description2014Updated, data.frame)
colnames(cwe_1_Description2014UpdatedDataFrame) <- "CWE_ID_1_Description"

#[23]
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
#https://nvd.nist.gov/vuln/categories
#----------#
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-264"] <- "Permissions, Privileges, and Access Control"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-119"] <- "Buffer Errors"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-20"] <- "Input Validation"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-200"] <- "Information Leak / Disclosure"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-284"] <- "Improper Access Control"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-476"] <- "NULL Pointer Dereference"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-79"] <- "Cross-Site Scripting (XSS)"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-704"] <- "Incorrect Type Conversion or Cast"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-352"] <- "Cross-Site Request Forgery (CSRF)"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-254"] <- "Security Features"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-19"] <- "Data Handling"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-287"] <- "Authentication Issues"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-190"] <- "Integer Overflow or Wraparound"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-295"] <- "Improper Certificate Validation"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-74"] <- "Injection"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-118"] <- "Improper Access of Indexable Resource ('Range Error')"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-275"] <- "Permission Issues"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-129"] <- "Improper Validation of Array Index"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-682"] <- "Incorrect Calculation"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-362"] <- "Race Conditions"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-399"] <- "Resource Management Errors"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-400"] <- "Uncontrolled Resource Consumption ('Resource Exhaustion')"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-384"] <- "Session Fixation"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-285"] <- "Improper Authorization"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-611"] <- "Improper Restriction of XML External Entity Reference ('XXE')"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-77"] <- "Command Injection"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-601"] <- "URL Redirection to Untrusted Site ('Open Redirect')"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-326"] <- "Inadequate Encryption Strength"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-320"] <- "Key Management Errors"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-22"] <- "Path Traversal"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-78"] <- "OS Command Injections"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-426"] <- "Untrusted Search Path"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-93"] <- "Improper Neutralization of CRLF Sequences ('CRLF Injection')"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-89"] <- "SQL Injection"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-255"] <- "Credentials Management"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-416"] <- "Use After Free"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-310"] <- "Cryptographic Issues"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-134"] <- "Format String Vulnerability"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-125"] <- "Out-of-bounds Read"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-415"] <- "Double Free"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-189"] <- "Numeric Errors"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-640"] <- "Weak Password Recovery Mechanism for Forgotten Password"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-94"] <- "Code Injection"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-428"] <- "Unquoted Search Path or Element"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-191"] <- "Integer Underflow (Wrap or Wraparound)"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-787"] <- "Out-of-bounds Write"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-502"] <- "Deserialization of Untrusted Data"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-485"] <- "Insufficient Encapsulation"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-532"] <- "Information Exposure Through Log Files"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-99"] <- "Improper Control of Resource Identifiers ('Resource Injection')"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-427"] <- "Uncontrolled Search Path Element"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-306"] <- "Missing Authentication for Critical Function"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-798"] <- "Use of Hard-coded Credentials"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-943"] <- "Improper Neutralization of Special Elements in Data Query Logic"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-327"] <- "Use of a Broken or Risky Cryptographic Algorithm"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-388"] <- "Error Handling"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-918"] <- "Server-Side Request Forgery (SSRF)"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-346"] <- "Origin Validation Error"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-91"] <- "XML Injection (aka Blind XPath Injection)"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-361"] <- "Time and State"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-434"] <- "Unrestricted Upload of File with Dangerous Type"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-417"] <- "Channel and Path Errors"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-613"] <- "Insufficient Session Expiration"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-369"] <- "Divide By Zero"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-358"] <- "Improperly Implemented Security Check for Standard"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-59"] <- "Link Following"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-113"] <- "Improper Neutralization of CRLF Sequences in HTTP Headers ('HTTP Response Splitting')"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-404"] <- "Improper Resource Shutdown or Release"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-116"] <- "Improper Encoding or Escaping of Output"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-90"] <- "Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-17"] <- "Code"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-338"] <- "Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)"
#----------#
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-693"] <- "Protection Mechanism Failure"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-345"] <- "Insufficient Verification of Data Authenticity"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-297"] <- "Improper Validation of Certificate with Host Mismatch"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-21"] <- "Path Equivalence"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-331"] <- "Insufficient Entropy"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-172"] <- "Encoding Error"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-669"] <- "Incorrect Resource Transfer Between Spheres"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-330"] <- "Use of Insufficiently Random Values"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-199"] <- "Information Management Errors"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-184"] <- "Incomplete Blacklist"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-18"] <- "Source Code"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-749"] <- "Exposed Dangerous Method or Function"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-347"] <- "Improper Verification of Cryptographic Signature"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-754"] <- "Improper Check for Unusual or Exceptional Conditions"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-664"] <- "Improper Control of a Resource Through its Lifetime"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-775"] <- "Missing Release of File Descriptor or Handle after Effective Lifetime"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-332"] <- "Insufficient Entropy in PRNG"
#----------#
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-441"] <- "Unintended Proxy or Intermediary ('Confused Deputy')"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-123"] <- "Write-what-where Condition"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-185"] <- "Incorrect Regular Expression"
#----------#
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-824"] <- "Access of Uninitialized Pointer"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-16"] <- "Configuration"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-913"] <- "Improper Control of Dynamically-Managed Code Resources"
levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014UpdatedDataFrame$CWE_ID_1_Description) == "CWE-665"] <- "Improper Initialization"
View(cwe_1_Description2014UpdatedDataFrame)

#[24]
cwe_2_2014Updated <- dataNVD2014Updated$cwe.1
cwe_2_2014Updated
cwe_2_2014UpdatedDataFrame <- ldply(cwe_2_2014Updated, data.frame)
colnames(cwe_2_2014UpdatedDataFrame) <- "CWE_ID_2"

#[25]
cwe_2_Description2014Updated <- dataNVD2014Updated$cwe.1
cwe_2_Description2014Updated
cwe_2_Description2014UpdatedDataFrame <- ldply(cwe_2_Description2014Updated, data.frame)
colnames(cwe_2_Description2014UpdatedDataFrame) <- "CWE_ID_2_Description"

#[26]
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
#https://nvd.nist.gov/vuln/categories
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-264"] <- "Permissions, Privileges, and Access Control"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-119"] <- "Buffer Errors"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-20"] <- "Input Validation"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-200"] <- "Information Leak / Disclosure"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-284"] <- "Improper Access Control"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-476"] <- "NULL Pointer Dereference"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-79"] <- "Cross-Site Scripting (XSS)"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-704"] <- "Incorrect Type Conversion or Cast"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-352"] <- "Cross-Site Request Forgery (CSRF)"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-254"] <- "Security Features"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-19"] <- "Data Handling"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-287"] <- "Authentication Issues"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-190"] <- "Integer Overflow or Wraparound"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-295"] <- "Improper Certificate Validation"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-74"] <- "Injection"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-118"] <- "Improper Access of Indexable Resource ('Range Error')"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-275"] <- "Permission Issues"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-129"] <- "Improper Validation of Array Index"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-682"] <- "Incorrect Calculation"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-362"] <- "Race Conditions"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-399"] <- "Resource Management Errors"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-400"] <- "Uncontrolled Resource Consumption ('Resource Exhaustion')"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-384"] <- "Session Fixation"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-285"] <- "Improper Authorization"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-611"] <- "Improper Restriction of XML External Entity Reference ('XXE')"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-77"] <- "Command Injection"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-601"] <- "URL Redirection to Untrusted Site ('Open Redirect')"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-326"] <- "Inadequate Encryption Strength"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-320"] <- "Key Management Errors"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-22"] <- "Path Traversal"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-78"] <- "OS Command Injections"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-426"] <- "Untrusted Search Path"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-93"] <- "Improper Neutralization of CRLF Sequences ('CRLF Injection')"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-89"] <- "SQL Injection"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-255"] <- "Credentials Management"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-416"] <- "Use After Free"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-310"] <- "Cryptographic Issues"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-134"] <- "Format String Vulnerability"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-125"] <- "Out-of-bounds Read"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-415"] <- "Double Free"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-189"] <- "Numeric Errors"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-640"] <- "Weak Password Recovery Mechanism for Forgotten Password"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-94"] <- "Code Injection"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-428"] <- "Unquoted Search Path or Element"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-191"] <- "Integer Underflow (Wrap or Wraparound)"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-787"] <- "Out-of-bounds Write"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-502"] <- "Deserialization of Untrusted Data"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-485"] <- "Insufficient Encapsulation"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-532"] <- "Information Exposure Through Log Files"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-99"] <- "Improper Control of Resource Identifiers ('Resource Injection')"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-427"] <- "Uncontrolled Search Path Element"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-306"] <- "Missing Authentication for Critical Function"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-798"] <- "Use of Hard-coded Credentials"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-943"] <- "Improper Neutralization of Special Elements in Data Query Logic"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-327"] <- "Use of a Broken or Risky Cryptographic Algorithm"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-388"] <- "Error Handling"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-918"] <- "Server-Side Request Forgery (SSRF)"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-346"] <- "Origin Validation Error"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-91"] <- "XML Injection (aka Blind XPath Injection)"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-361"] <- "Time and State"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-434"] <- "Unrestricted Upload of File with Dangerous Type"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-417"] <- "Channel and Path Errors"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-613"] <- "Insufficient Session Expiration"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-369"] <- "Divide By Zero"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-358"] <- "Improperly Implemented Security Check for Standard"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-59"] <- "Link Following"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-113"] <- "Improper Neutralization of CRLF Sequences in HTTP Headers ('HTTP Response Splitting')"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-404"] <- "Improper Resource Shutdown or Release"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-116"] <- "Improper Encoding or Escaping of Output"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-90"] <- "Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-17"] <- "Code"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-338"] <- "Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)"
#----------#
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-693"] <- "Protection Mechanism Failure"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-345"] <- "Insufficient Verification of Data Authenticity"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-297"] <- "Improper Validation of Certificate with Host Mismatch"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-21"] <- "Path Equivalence"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-331"] <- "Insufficient Entropy"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-172"] <- "Encoding Error"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-669"] <- "Incorrect Resource Transfer Between Spheres"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-330"] <- "Use of Insufficiently Random Values"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-199"] <- "Information Management Errors"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-184"] <- "Incomplete Blacklist"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-18"] <- "Source Code"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-749"] <- "Exposed Dangerous Method or Function"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-347"] <- "Improper Verification of Cryptographic Signature"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-754"] <- "Improper Check for Unusual or Exceptional Conditions"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-664"] <- "Improper Control of a Resource Through its Lifetime"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-775"] <- "Missing Release of File Descriptor or Handle after Effective Lifetime"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-332"] <- "Insufficient Entropy in PRNG"
#----------#
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-441"] <- "Unintended Proxy or Intermediary ('Confused Deputy')"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-123"] <- "Write-what-where Condition"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-185"] <- "Incorrect Regular Expression"
#----------#
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-824"] <- "Access of Uninitialized Pointer"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-16"] <- "Configuration"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-913"] <- "Improper Control of Dynamically-Managed Code Resources"
levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014UpdatedDataFrame$CWE_ID_2_Description) == "CWE-665"] <- "Improper Initialization"
View(cwe_2_Description2014UpdatedDataFrame)

#[27]
nvd2014UpdatedTotal <- cbind(cveID2014UpdatedDataFrame, summary2014UpdatedDataFrame, 
														 publishedDate2014UpdatedDataFrame, publishedTime2014UpdatedDataFrame, 
														 lastModifiedDate2014UpdatedDataFrame, lastModifiedTime2014UpdatedDataFrame,
														 cvss2014UpdatedDataFrame, cvssSeverity2014UpdatedDataFrame,
														 cvssAccessVector2014UpdatedDataFrame, cvssAccessComplexity2014UpdatedDataFrame, 
														 cvssAuthentication2014UpdatedDataFrame, cvssConfidentialityImpact2014UpdatedDataFrame, 
														 cvssIntegrityImpact2014UpdatedDataFrame, cvssAvailabilityImpact2014UpdatedDataFrame, 
														 cvssGeneratedOnDate2014UpdatedDataFrame, cvssGeneratedOnTime2014UpdatedDataFrame,
														 cwe_1_2014UpdatedDataFrame, cwe_1_Description2014UpdatedDataFrame,
														 cwe_2_2014UpdatedDataFrame, cwe_2_Description2014UpdatedDataFrame)
nvd2014UpdatedTotalDistinct <- distinct(nvd2014UpdatedTotal)
write.csv(nvd2014UpdatedTotalDistinct, "CVE_2014_Updated.csv", row.names = FALSE)
