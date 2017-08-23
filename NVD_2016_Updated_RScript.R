#[1]
#NVD_2016_Updated_RScript.R

#[Memory]
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

#[7]
publishedDateTime2016Updated <- dataNVD2016Updated$published.datetime
publishedDateTime2016Updated
#----------Vulnerability_Published_Date----------#
publishedDate2016Updated <- anydate(publishedDateTime2016Updated) #Published Date 2017
publishedDate2016Updated
publishedDate2016UpdatedDataFrame <- ldply(publishedDate2016Updated, data.frame)
colnames(publishedDate2016UpdatedDataFrame) <- "Vulnerability_Published_Date"

#[8]
#----------Vulnerability_Published_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
publishedTime2016Updated <- iso8601(anytime(publishedDateTime2016Updated, tz = "UTC"))
publishedTime2016Updated
#http://rfunction.com/archives/1499
publishedTimeSplit2016Updated <- strsplit(publishedTime2016Updated, " ") 
publishedTimeSplit2016Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
publishedTimeSplitSecondElement2016Updated <- sapply(publishedTimeSplit2016Updated, "[", 2)
publishedTimeSplitSecondElement2016Updated
publishedTime2016UpdatedDataFrame <- ldply(publishedTimeSplitSecondElement2016Updated, data.frame)
colnames(publishedTime2016UpdatedDataFrame) <- "Vulnerability_Published_Time"

#[9]
lastModifiedDateTime2016Updated <- dataNVD2016Updated$last.modified.datetime
lastModifiedDateTime2016Updated
#----------Vulnerability_Last_Modified_Date----------#
lastModifiedDate2016Updated <- anydate(lastModifiedDateTime2016Updated)
lastModifiedDate2016Updated
lastModifiedDate2016UpdatedDataFrame <- ldply(lastModifiedDate2016Updated, data.frame)
colnames(lastModifiedDate2016UpdatedDataFrame) <- "Vulnerability_Last_Modified_Date"

#[10]
#----------Vulnerability_Last_Modified_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
lastModifiedTime2016Updated <- iso8601(anytime(lastModifiedDateTime2016Updated, tz = "UTC"))
lastModifiedTime2016Updated
#http://rfunction.com/archives/1499
lastModifiedTimeSplit2016Updated <- strsplit(lastModifiedTime2016Updated, " ") 
lastModifiedTimeSplit2016Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
lastModifiedTimeSplitSecondElement2016Updated <- sapply(lastModifiedTimeSplit2016Updated, "[", 2)
lastModifiedTimeSplitSecondElement2016Updated
lastModifiedTime2016UpdatedDataFrame <- ldply(lastModifiedTimeSplitSecondElement2016Updated, data.frame)
colnames(lastModifiedTime2016UpdatedDataFrame) <- "Vulnerability_Last_Modified_Time"

#[11]
cvss2016Updated <- dataNVD2016Updated$cvss.base_metrics.score
cvss2016Updated
cvss2016UpdatedDataFrame <- ldply(cvss2016Updated, data.frame)
colnames(cvss2016UpdatedDataFrame) <- "CVSS_Score"

#[12]
#https://nvd.nist.gov/vuln-metrics/cvss
cvssSeverity2016Updated <- dataNVD2016Updated$cvss.base_metrics.score
cvssSeverity2016Updated
cvssSeverity2016UpdatedDataFrame <- ldply(cvssSeverity2016Updated, data.frame)
colnames(cvssSeverity2016UpdatedDataFrame) <- "CVSS_Severity"
str(cvssSeverity2016UpdatedDataFrame)
View(cvssSeverity2016UpdatedDataFrame)
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity) == "10.0"] <- "HIGH"
levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity) >= 7.0 & 
																											 	levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity) < 9.9] <- "HIGH"
levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity) >= 4.0 & 
																											 	levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity) <= 6.9] <- "MEDIUM"
levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity) >= 0.0 & 
																											 	levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity) <= 3.9] <- "LOW"
View(cvssSeverity2016UpdatedDataFrame)

#[13]
cvssAccessVector2016Updated <- dataNVD2016Updated$cvss.base_metrics.access.vector
cvssAccessVector2016Updated
cvssAccessVector2016UpdatedDataFrame <- ldply(cvssAccessVector2016Updated, data.frame)
colnames(cvssAccessVector2016UpdatedDataFrame) <- "CVSS_Access_Vector"

#[14]
cvssAccessComplexity2016Updated <- dataNVD2016Updated$cvss.base_metrics.access.complexity
cvssAccessComplexity2016Updated
cvssAccessComplexity2016UpdatedDataFrame <- ldply(cvssAccessComplexity2016Updated, data.frame)
colnames(cvssAccessComplexity2016UpdatedDataFrame) <- "CVSS_Access_Complexity"

#[15]
cvssAuthentication2016Updated <- dataNVD2016Updated$cvss.base_metrics.authentication
cvssAuthentication2016Updated
cvssAuthentication2016UpdatedDataFrame <- ldply(cvssAuthentication2016Updated, data.frame)
colnames(cvssAuthentication2016UpdatedDataFrame) <- "CVSS_Authentication"

#[16]
cvssConfidentialityImpact2016Updated <- dataNVD2016Updated$cvss.base_metrics.confidentiality.impact
cvssConfidentialityImpact2016Updated
cvssConfidentialityImpact2016UpdatedDataFrame <- ldply(cvssConfidentialityImpact2016Updated, data.frame)
colnames(cvssConfidentialityImpact2016UpdatedDataFrame) <- "CVSS_Confidentiality_Impact"

#[17]
cvssIntegrityImpact2016Updated <- dataNVD2016Updated$cvss.base_metrics.integrity.impact
cvssIntegrityImpact2016Updated
cvssIntegrityImpact2016UpdatedDataFrame <- ldply(cvssIntegrityImpact2016Updated, data.frame)
colnames(cvssIntegrityImpact2016UpdatedDataFrame) <- "CVSS_Integrity_Impact"

#[18]
cvssAvailabilityImpact2016Updated <- dataNVD2016Updated$cvss.base_metrics.availability.impact
cvssAvailabilityImpact2016Updated
cvssAvailabilityImpact2016UpdatedDataFrame <- ldply(cvssAvailabilityImpact2016Updated, data.frame)
colnames(cvssAvailabilityImpact2016UpdatedDataFrame) <- "CVSS_Availability_Impact"

#[19]
cvssGeneratedOnDateTime2016Updated <- dataNVD2016Updated$cvss.base_metrics.generated.on.datetime
cvssGeneratedOnDateTime2016Updated
#----------CVSS_Generated_On_Date----------#
cvssGeneratedOnDate2016Updated <- anydate(cvssGeneratedOnDateTime2016Updated)
cvssGeneratedOnDate2016UpdatedDataFrame <- ldply(cvssGeneratedOnDate2016Updated, data.frame)
colnames(cvssGeneratedOnDate2016UpdatedDataFrame) <- "CVSS_Generated_On_Date"

#[20]
#----------CVSS_Generated_On_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
cvssGeneratedOnTime2016Updated <- iso8601(anytime(cvssGeneratedOnDateTime2016Updated, tz = "UTC"))
cvssGeneratedOnTime2016Updated
#http://rfunction.com/archives/1499
cvssGeneratedOnTimeSplit2016Updated <- strsplit(cvssGeneratedOnTime2016Updated, " ") 
cvssGeneratedOnTimeSplit2016Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
cvssGeneratedOnTimeSplitSecondElement2016Updated <- sapply(cvssGeneratedOnTimeSplit2016Updated, "[", 2)
cvssGeneratedOnTimeSplitSecondElement2016Updated
cvssGeneratedOnTime2016UpdatedDataFrame <- ldply(cvssGeneratedOnTimeSplitSecondElement2016Updated, data.frame)
colnames(cvssGeneratedOnTime2016UpdatedDataFrame) <- "CVSS_Generated_On_Time"

#[21]
cwe_1_2016Updated <- dataNVD2016Updated$cwe
cwe_1_2016Updated
cwe_1_2016UpdatedDataFrame <- ldply(cwe_1_2016Updated, data.frame)
colnames(cwe_1_2016UpdatedDataFrame) <- "CWE_ID_1"

#[22]
cwe_1_Description2016Updated <- dataNVD2016Updated$cwe
cwe_1_Description2016Updated
cwe_1_Description2016UpdatedDataFrame <- ldply(cwe_1_Description2016Updated, data.frame)
colnames(cwe_1_Description2016UpdatedDataFrame) <- "CWE_ID_1_Description"

#[23]
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
#https://nvd.nist.gov/vuln/categories
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-264"] <- "Permissions, Privileges, and Access Control"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-119"] <- "Buffer Errors"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-20"] <- "Input Validation"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-200"] <- "Information Leak / Disclosure"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-284"] <- "Improper Access Control"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-476"] <- "NULL Pointer Dereference"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-79"] <- "Cross-Site Scripting (XSS)"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-704"] <- "Incorrect Type Conversion or Cast"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-352"] <- "Cross-Site Request Forgery (CSRF)"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-254"] <- "Security Features"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-19"] <- "Data Handling"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-287"] <- "Authentication Issues"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-190"] <- "Integer Overflow or Wraparound"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-295"] <- "Improper Certificate Validation"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-74"] <- "Injection"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-118"] <- "Improper Access of Indexable Resource ('Range Error')"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-275"] <- "Permission Issues"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-129"] <- "Improper Validation of Array Index"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-682"] <- "Incorrect Calculation"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-362"] <- "Race Conditions"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-399"] <- "Resource Management Errors"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-400"] <- "Uncontrolled Resource Consumption ('Resource Exhaustion')"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-384"] <- "Session Fixation"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-285"] <- "Improper Authorization"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-611"] <- "Improper Restriction of XML External Entity Reference ('XXE')"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-77"] <- "Command Injection"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-601"] <- "URL Redirection to Untrusted Site ('Open Redirect')"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-326"] <- "Inadequate Encryption Strength"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-320"] <- "Key Management Errors"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-22"] <- "Path Traversal"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-78"] <- "OS Command Injections"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-426"] <- "Untrusted Search Path"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-93"] <- "Improper Neutralization of CRLF Sequences ('CRLF Injection')"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-89"] <- "SQL Injection"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-255"] <- "Credentials Management"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-416"] <- "Use After Free"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-310"] <- "Cryptographic Issues"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-134"] <- "Format String Vulnerability"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-125"] <- "Out-of-bounds Read"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-415"] <- "Double Free"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-189"] <- "Numeric Errors"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-640"] <- "Weak Password Recovery Mechanism for Forgotten Password"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-94"] <- "Code Injection"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-428"] <- "Unquoted Search Path or Element"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-191"] <- "Integer Underflow (Wrap or Wraparound)"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-787"] <- "Out-of-bounds Write"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-502"] <- "Deserialization of Untrusted Data"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-485"] <- "Insufficient Encapsulation"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-532"] <- "Information Exposure Through Log Files"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-99"] <- "Improper Control of Resource Identifiers ('Resource Injection')"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-427"] <- "Uncontrolled Search Path Element"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-306"] <- "Missing Authentication for Critical Function"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-798"] <- "Use of Hard-coded Credentials"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-943"] <- "Improper Neutralization of Special Elements in Data Query Logic"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-327"] <- "Use of a Broken or Risky Cryptographic Algorithm"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-388"] <- "Error Handling"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-918"] <- "Server-Side Request Forgery (SSRF)"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-346"] <- "Origin Validation Error"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-91"] <- "XML Injection (aka Blind XPath Injection)"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-361"] <- "Time and State"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-434"] <- "Unrestricted Upload of File with Dangerous Type"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-417"] <- "Channel and Path Errors"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-613"] <- "Insufficient Session Expiration"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-369"] <- "Divide By Zero"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-358"] <- "Improperly Implemented Security Check for Standard"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-59"] <- "Link Following"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-113"] <- "Improper Neutralization of CRLF Sequences in HTTP Headers ('HTTP Response Splitting')"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-404"] <- "Improper Resource Shutdown or Release"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-116"] <- "Improper Encoding or Escaping of Output"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-90"] <- "Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-17"] <- "Code"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-338"] <- "Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)"
#----------#
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-693"] <- "Protection Mechanism Failure"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-345"] <- "Insufficient Verification of Data Authenticity"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-297"] <- "Improper Validation of Certificate with Host Mismatch"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-21"] <- "Path Equivalence"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-331"] <- "Insufficient Entropy"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-172"] <- "Encoding Error"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-669"] <- "Incorrect Resource Transfer Between Spheres"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-330"] <- "Use of Insufficiently Random Values"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-199"] <- "Information Management Errors"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-184"] <- "Incomplete Blacklist"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-18"] <- "Source Code"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-749"] <- "Exposed Dangerous Method or Function"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-347"] <- "Improper Verification of Cryptographic Signature"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-754"] <- "Improper Check for Unusual or Exceptional Conditions"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-664"] <- "Improper Control of a Resource Through its Lifetime"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-775"] <- "Missing Release of File Descriptor or Handle after Effective Lifetime"
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-332"] <- "Insufficient Entropy in PRNG"
#----------#
levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016UpdatedDataFrame$CWE_ID_1_Description) == "CWE-88"] <- "Argument Injection or Modification"
View(cwe_1_Description2016UpdatedDataFrame)

#[24]
cwe_2_2016Updated <- dataNVD2016Updated$cwe.1
cwe_2_2016Updated
cwe_2_2016UpdatedDataFrame <- ldply(cwe_2_2016Updated, data.frame)
colnames(cwe_2_2016UpdatedDataFrame) <- "CWE_ID_2"

#[25]
cwe_2_Description2016Updated <- dataNVD2016Updated$cwe.1
cwe_2_Description2016Updated
cwe_2_Description2016UpdatedDataFrame <- ldply(cwe_2_Description2016Updated, data.frame)
colnames(cwe_2_Description2016UpdatedDataFrame) <- "CWE_ID_2_Description"

#[26]
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
#https://nvd.nist.gov/vuln/categories
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-264"] <- "Permissions, Privileges, and Access Control"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-119"] <- "Buffer Errors"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-20"] <- "Input Validation"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-200"] <- "Information Leak / Disclosure"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-284"] <- "Improper Access Control"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-476"] <- "NULL Pointer Dereference"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-79"] <- "Cross-Site Scripting (XSS)"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-704"] <- "Incorrect Type Conversion or Cast"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-352"] <- "Cross-Site Request Forgery (CSRF)"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-254"] <- "Security Features"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-19"] <- "Data Handling"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-287"] <- "Authentication Issues"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-190"] <- "Integer Overflow or Wraparound"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-295"] <- "Improper Certificate Validation"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-74"] <- "Injection"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-118"] <- "Improper Access of Indexable Resource ('Range Error')"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-275"] <- "Permission Issues"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-129"] <- "Improper Validation of Array Index"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-682"] <- "Incorrect Calculation"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-362"] <- "Race Conditions"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-399"] <- "Resource Management Errors"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-400"] <- "Uncontrolled Resource Consumption ('Resource Exhaustion')"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-384"] <- "Session Fixation"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-285"] <- "Improper Authorization"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-611"] <- "Improper Restriction of XML External Entity Reference ('XXE')"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-77"] <- "Command Injection"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-601"] <- "URL Redirection to Untrusted Site ('Open Redirect')"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-326"] <- "Inadequate Encryption Strength"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-320"] <- "Key Management Errors"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-22"] <- "Path Traversal"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-78"] <- "OS Command Injections"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-426"] <- "Untrusted Search Path"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-93"] <- "Improper Neutralization of CRLF Sequences ('CRLF Injection')"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-89"] <- "SQL Injection"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-255"] <- "Credentials Management"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-416"] <- "Use After Free"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-310"] <- "Cryptographic Issues"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-134"] <- "Format String Vulnerability"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-125"] <- "Out-of-bounds Read"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-415"] <- "Double Free"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-189"] <- "Numeric Errors"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-640"] <- "Weak Password Recovery Mechanism for Forgotten Password"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-94"] <- "Code Injection"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-428"] <- "Unquoted Search Path or Element"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-191"] <- "Integer Underflow (Wrap or Wraparound)"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-787"] <- "Out-of-bounds Write"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-502"] <- "Deserialization of Untrusted Data"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-485"] <- "Insufficient Encapsulation"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-532"] <- "Information Exposure Through Log Files"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-99"] <- "Improper Control of Resource Identifiers ('Resource Injection')"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-427"] <- "Uncontrolled Search Path Element"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-306"] <- "Missing Authentication for Critical Function"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-798"] <- "Use of Hard-coded Credentials"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-943"] <- "Improper Neutralization of Special Elements in Data Query Logic"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-327"] <- "Use of a Broken or Risky Cryptographic Algorithm"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-388"] <- "Error Handling"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-918"] <- "Server-Side Request Forgery (SSRF)"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-346"] <- "Origin Validation Error"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-91"] <- "XML Injection (aka Blind XPath Injection)"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-361"] <- "Time and State"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-434"] <- "Unrestricted Upload of File with Dangerous Type"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-417"] <- "Channel and Path Errors"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-613"] <- "Insufficient Session Expiration"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-369"] <- "Divide By Zero"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-358"] <- "Improperly Implemented Security Check for Standard"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-59"] <- "Link Following"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-113"] <- "Improper Neutralization of CRLF Sequences in HTTP Headers ('HTTP Response Splitting')"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-404"] <- "Improper Resource Shutdown or Release"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-116"] <- "Improper Encoding or Escaping of Output"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-90"] <- "Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-17"] <- "Code"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-338"] <- "Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)"
#----------#
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-693"] <- "Protection Mechanism Failure"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-345"] <- "Insufficient Verification of Data Authenticity"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-297"] <- "Improper Validation of Certificate with Host Mismatch"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-21"] <- "Path Equivalence"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-331"] <- "Insufficient Entropy"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-172"] <- "Encoding Error"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-669"] <- "Incorrect Resource Transfer Between Spheres"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-330"] <- "Use of Insufficiently Random Values"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-199"] <- "Information Management Errors"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-184"] <- "Incomplete Blacklist"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-18"] <- "Source Code"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-749"] <- "Exposed Dangerous Method or Function"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-347"] <- "Improper Verification of Cryptographic Signature"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-754"] <- "Improper Check for Unusual or Exceptional Conditions"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-664"] <- "Improper Control of a Resource Through its Lifetime"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-775"] <- "Missing Release of File Descriptor or Handle after Effective Lifetime"
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-332"] <- "Insufficient Entropy in PRNG"
#----------#
levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016UpdatedDataFrame$CWE_ID_2_Description) == "CWE-88"] <- "Argument Injection or Modification"
View(cwe_2_Description2016UpdatedDataFrame)

#[27]
nvd2016UpdatedTotal <- cbind(cveID2016UpdatedDataFrame, summary2016UpdatedDataFrame, 
														 publishedDate2016UpdatedDataFrame, publishedTime2016UpdatedDataFrame, 
														 lastModifiedDate2016UpdatedDataFrame, lastModifiedTime2016UpdatedDataFrame,
														 cvss2016UpdatedDataFrame, cvssSeverity2016UpdatedDataFrame,
														 cvssAccessVector2016UpdatedDataFrame, cvssAccessComplexity2016UpdatedDataFrame, 
														 cvssAuthentication2016UpdatedDataFrame, cvssConfidentialityImpact2016UpdatedDataFrame, 
														 cvssIntegrityImpact2016UpdatedDataFrame, cvssAvailabilityImpact2016UpdatedDataFrame, 
														 cvssGeneratedOnDate2016UpdatedDataFrame, cvssGeneratedOnTime2016UpdatedDataFrame,
														 cwe_1_2016UpdatedDataFrame, cwe_1_Description2016UpdatedDataFrame,
														 cwe_2_2016UpdatedDataFrame, cwe_2_Description2016UpdatedDataFrame)
nvd2016UpdatedTotalDistinct <- distinct(nvd2016UpdatedTotal)
View(nvd2016UpdatedTotalDistinct)
write.csv(nvd2016UpdatedTotalDistinct, "CVE_2016_Updated.csv", row.names = FALSE)

#[28]
#https://stat.ethz.ch/pipermail/r-help/2012-December/343413.html
nvd2016UpdatedTotalDistinctLastRowRemoved <- nvd2016UpdatedTotalDistinct[-nrow(nvd2016UpdatedTotalDistinct),]
View(nvd2016UpdatedTotalDistinctLastRowRemoved)
write.csv(nvd2016UpdatedTotalDistinctLastRowRemoved, "CVE_2016_Updated_Last_Row_Removed.csv", row.names = FALSE)

#[29]
#http://www.duanqu.tech/questions/4900348/how-to-remove-rows-in-a-dataframe-that-contain-certain-words-in-r
nvd2016UpdatedTotalDistinctReject <- nvd2016UpdatedTotalDistinctLastRowRemoved[grepl("DO NOT USE THIS CANDIDATE NUMBER.", nvd2016UpdatedTotalDistinctLastRowRemoved$Vulnerability_Summary), ]
View(nvd2016UpdatedTotalDistinctReject)
nvd2016UpdatedTotalDistinctRejectRemoved <- nvd2016UpdatedTotalDistinctLastRowRemoved[!grepl("DO NOT USE THIS CANDIDATE NUMBER.", nvd2016UpdatedTotalDistinctLastRowRemoved$Vulnerability_Summary), ]
View(nvd2016UpdatedTotalDistinctRejectRemoved)
write.csv(nvd2016UpdatedTotalDistinctRejectRemoved, "CVE_2016_Updated_Rejected_Removed.csv", row.names = FALSE)

#[30]
#https://stackoverflow.com/questions/20977972/how-to-remove-na-data-in-only-one-columns
nvd2016UpdatedTotalDistinctNA <- nvd2016UpdatedTotalDistinctRejectRemoved[is.na(nvd2016UpdatedTotalDistinctRejectRemoved$CVSS_Score),]
View(nvd2016UpdatedTotalDistinctNA)
nvd2016UpdatedTotalDistinctNARemoved <- nvd2016UpdatedTotalDistinctRejectRemoved[!is.na(nvd2016UpdatedTotalDistinctRejectRemoved$CVSS_Score),]
View(nvd2016UpdatedTotalDistinctNARemoved)
write.csv(nvd2016UpdatedTotalDistinctNARemoved, "CVE_2016_Updated_NA_Removed.csv", row.names = FALSE)

#[CVE ID, CWE & CVSS Score]
View(nvd2016UpdatedTotalDistinctNARemoved)
nvd2016CVEIDCVSS <- nvd2016UpdatedTotalDistinctNARemoved[c(1,17,7)]
View(nvd2016CVEIDCVSS)
#https://stackoverflow.com/questions/18514694/how-to-save-a-data-frame-in-a-txt-or-excel-file-separated-by-columns
#https://www.math.ucla.edu/~anderson/rw1001/library/base/html/write.table.html
write.table(nvd2016CVEIDCVSS, "nvd2016CVEIDCWECVSS.txt", 
						row.names = FALSE, col.names = FALSE, 
						quote = FALSE, sep = "\t")
