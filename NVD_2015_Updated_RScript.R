#[1]
#NVD_2015_Updated_RScript.R

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

#[12]
#https://nvd.nist.gov/vuln-metrics/cvss
cvssSeverity2015Updated <- dataNVD2015Updated$cvss.base_metrics.score
cvssSeverity2015Updated
cvssSeverity2015UpdatedDataFrame <- ldply(cvssSeverity2015Updated, data.frame)
colnames(cvssSeverity2015UpdatedDataFrame) <- "CVSS_Severity"
str(cvssSeverity2015UpdatedDataFrame)
View(cvssSeverity2015UpdatedDataFrame)
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
levels(cvssSeverity2015UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2015UpdatedDataFrame$CVSS_Severity) == "10.0"] <- "HIGH"
levels(cvssSeverity2015UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2015UpdatedDataFrame$CVSS_Severity) >= 7.0 & 
																											 	levels(cvssSeverity2015UpdatedDataFrame$CVSS_Severity) < 9.9] <- "HIGH"
levels(cvssSeverity2015UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2015UpdatedDataFrame$CVSS_Severity) >= 4.0 & 
																											 	levels(cvssSeverity2015UpdatedDataFrame$CVSS_Severity) <= 6.9] <- "MEDIUM"
levels(cvssSeverity2015UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2015UpdatedDataFrame$CVSS_Severity) >= 0.0 & 
																											 	levels(cvssSeverity2015UpdatedDataFrame$CVSS_Severity) <= 3.9] <- "LOW"
View(cvssSeverity2015UpdatedDataFrame)

#[13]
cvssAccessVector2015Updated <- dataNVD2015Updated$cvss.base_metrics.access.vector
cvssAccessVector2015Updated
cvssAccessVector2015UpdatedDataFrame <- ldply(cvssAccessVector2015Updated, data.frame)
colnames(cvssAccessVector2015UpdatedDataFrame) <- "CVSS_Access_Vector"

#[14]
cvssAccessComplexity2015Updated <- dataNVD2015Updated$cvss.base_metrics.access.complexity
cvssAccessComplexity2015Updated
cvssAccessComplexity2015UpdatedDataFrame <- ldply(cvssAccessComplexity2015Updated, data.frame)
colnames(cvssAccessComplexity2015UpdatedDataFrame) <- "CVSS_Access_Complexity"

#[15]
cvssAuthentication2015Updated <- dataNVD2015Updated$cvss.base_metrics.authentication
cvssAuthentication2015Updated
cvssAuthentication2015UpdatedDataFrame <- ldply(cvssAuthentication2015Updated, data.frame)
colnames(cvssAuthentication2015UpdatedDataFrame) <- "CVSS_Authentication"

#[16]
cvssConfidentialityImpact2015Updated <- dataNVD2015Updated$cvss.base_metrics.confidentiality.impact
cvssConfidentialityImpact2015Updated
cvssConfidentialityImpact2015UpdatedDataFrame <- ldply(cvssConfidentialityImpact2015Updated, data.frame)
colnames(cvssConfidentialityImpact2015UpdatedDataFrame) <- "CVSS_Confidentiality_Impact"

#[17]
cvssIntegrityImpact2015Updated <- dataNVD2015Updated$cvss.base_metrics.integrity.impact
cvssIntegrityImpact2015Updated
cvssIntegrityImpact2015UpdatedDataFrame <- ldply(cvssIntegrityImpact2015Updated, data.frame)
colnames(cvssIntegrityImpact2015UpdatedDataFrame) <- "CVSS_Integrity_Impact"

#[18]
cvssAvailabilityImpact2015Updated <- dataNVD2015Updated$cvss.base_metrics.availability.impact
cvssAvailabilityImpact2015Updated
cvssAvailabilityImpact2015UpdatedDataFrame <- ldply(cvssAvailabilityImpact2015Updated, data.frame)
colnames(cvssAvailabilityImpact2015UpdatedDataFrame) <- "CVSS_Availability_Impact"

#[19]
cvssGeneratedOnDateTime2015Updated <- dataNVD2015Updated$cvss.base_metrics.generated.on.datetime
cvssGeneratedOnDateTime2015Updated
#----------CVSS_Generated_On_Date----------#
cvssGeneratedOnDate2015Updated <- anydate(cvssGeneratedOnDateTime2015Updated)
cvssGeneratedOnDate2015UpdatedDataFrame <- ldply(cvssGeneratedOnDate2015Updated, data.frame)
colnames(cvssGeneratedOnDate2015UpdatedDataFrame) <- "CVSS_Generated_On_Date"

#[20]
#----------CVSS_Generated_On_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
cvssGeneratedOnTime2015Updated <- iso8601(anytime(cvssGeneratedOnDateTime2015Updated, tz = "UTC"))
cvssGeneratedOnTime2015Updated
#http://rfunction.com/archives/1499
cvssGeneratedOnTimeSplit2015Updated <- strsplit(cvssGeneratedOnTime2015Updated, " ") 
cvssGeneratedOnTimeSplit2015Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
cvssGeneratedOnTimeSplitSecondElement2015Updated <- sapply(cvssGeneratedOnTimeSplit2015Updated, "[", 2)
cvssGeneratedOnTimeSplitSecondElement2015Updated
cvssGeneratedOnTime2015UpdatedDataFrame <- ldply(cvssGeneratedOnTimeSplitSecondElement2015Updated, data.frame)
colnames(cvssGeneratedOnTime2015UpdatedDataFrame) <- "CVSS_Generated_On_Time"

#[21]
cwe_1_2015Updated <- dataNVD2015Updated$cwe
cwe_1_2015Updated
cwe_1_2015UpdatedDataFrame <- ldply(cwe_1_2015Updated, data.frame)
colnames(cwe_1_2015UpdatedDataFrame) <- "CWE_ID_1"

#[22]
cwe_1_Description2015Updated <- dataNVD2015Updated$cwe
cwe_1_Description2015Updated
cwe_1_Description2015UpdatedDataFrame <- ldply(cwe_1_Description2015Updated, data.frame)
colnames(cwe_1_Description2015UpdatedDataFrame) <- "CWE_ID_1_Description"

#[23]
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
#https://nvd.nist.gov/vuln/categories
#----------#
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-264"] <- "Permissions, Privileges, and Access Control"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-119"] <- "Buffer Errors"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-20"] <- "Input Validation"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-200"] <- "Information Leak / Disclosure"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-284"] <- "Improper Access Control"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-476"] <- "NULL Pointer Dereference"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-79"] <- "Cross-Site Scripting (XSS)"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-704"] <- "Incorrect Type Conversion or Cast"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-352"] <- "Cross-Site Request Forgery (CSRF)"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-254"] <- "Security Features"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-19"] <- "Data Handling"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-287"] <- "Authentication Issues"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-190"] <- "Integer Overflow or Wraparound"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-295"] <- "Improper Certificate Validation"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-74"] <- "Injection"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-118"] <- "Improper Access of Indexable Resource ('Range Error')"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-275"] <- "Permission Issues"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-129"] <- "Improper Validation of Array Index"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-682"] <- "Incorrect Calculation"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-362"] <- "Race Conditions"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-399"] <- "Resource Management Errors"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-400"] <- "Uncontrolled Resource Consumption ('Resource Exhaustion')"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-384"] <- "Session Fixation"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-285"] <- "Improper Authorization"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-611"] <- "Improper Restriction of XML External Entity Reference ('XXE')"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-77"] <- "Command Injection"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-601"] <- "URL Redirection to Untrusted Site ('Open Redirect')"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-326"] <- "Inadequate Encryption Strength"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-320"] <- "Key Management Errors"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-22"] <- "Path Traversal"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-78"] <- "OS Command Injections"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-426"] <- "Untrusted Search Path"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-93"] <- "Improper Neutralization of CRLF Sequences ('CRLF Injection')"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-89"] <- "SQL Injection"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-255"] <- "Credentials Management"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-416"] <- "Use After Free"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-310"] <- "Cryptographic Issues"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-134"] <- "Format String Vulnerability"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-125"] <- "Out-of-bounds Read"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-415"] <- "Double Free"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-189"] <- "Numeric Errors"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-640"] <- "Weak Password Recovery Mechanism for Forgotten Password"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-94"] <- "Code Injection"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-428"] <- "Unquoted Search Path or Element"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-191"] <- "Integer Underflow (Wrap or Wraparound)"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-787"] <- "Out-of-bounds Write"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-502"] <- "Deserialization of Untrusted Data"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-485"] <- "Insufficient Encapsulation"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-532"] <- "Information Exposure Through Log Files"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-99"] <- "Improper Control of Resource Identifiers ('Resource Injection')"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-427"] <- "Uncontrolled Search Path Element"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-306"] <- "Missing Authentication for Critical Function"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-798"] <- "Use of Hard-coded Credentials"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-943"] <- "Improper Neutralization of Special Elements in Data Query Logic"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-327"] <- "Use of a Broken or Risky Cryptographic Algorithm"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-388"] <- "Error Handling"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-918"] <- "Server-Side Request Forgery (SSRF)"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-346"] <- "Origin Validation Error"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-91"] <- "XML Injection (aka Blind XPath Injection)"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-361"] <- "Time and State"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-434"] <- "Unrestricted Upload of File with Dangerous Type"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-417"] <- "Channel and Path Errors"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-613"] <- "Insufficient Session Expiration"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-369"] <- "Divide By Zero"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-358"] <- "Improperly Implemented Security Check for Standard"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-59"] <- "Link Following"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-113"] <- "Improper Neutralization of CRLF Sequences in HTTP Headers ('HTTP Response Splitting')"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-404"] <- "Improper Resource Shutdown or Release"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-116"] <- "Improper Encoding or Escaping of Output"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-90"] <- "Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-17"] <- "Code"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-338"] <- "Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)"
#----------#
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-693"] <- "Protection Mechanism Failure"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-345"] <- "Insufficient Verification of Data Authenticity"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-297"] <- "Improper Validation of Certificate with Host Mismatch"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-21"] <- "Path Equivalence"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-331"] <- "Insufficient Entropy"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-172"] <- "Encoding Error"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-669"] <- "Incorrect Resource Transfer Between Spheres"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-330"] <- "Use of Insufficiently Random Values"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-199"] <- "Information Management Errors"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-184"] <- "Incomplete Blacklist"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-18"] <- "Source Code"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-749"] <- "Exposed Dangerous Method or Function"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-347"] <- "Improper Verification of Cryptographic Signature"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-754"] <- "Improper Check for Unusual or Exceptional Conditions"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-664"] <- "Improper Control of a Resource Through its Lifetime"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-775"] <- "Missing Release of File Descriptor or Handle after Effective Lifetime"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-332"] <- "Insufficient Entropy in PRNG"
#----------#
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-441"] <- "Unintended Proxy or Intermediary ('Confused Deputy')"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-123"] <- "Write-what-where Condition"
levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2015UpdatedDataFrame$CWE_ID_1_Description) == "CWE-185"] <- "Incorrect Regular Expression"
View(cwe_1_Description2015UpdatedDataFrame)

#[24]
cwe_2_2015Updated <- dataNVD2015Updated$cwe.1
cwe_2_2015Updated
cwe_2_2015UpdatedDataFrame <- ldply(cwe_2_2015Updated, data.frame)
colnames(cwe_2_2015UpdatedDataFrame) <- "CWE_ID_2"

#[25]
cwe_2_Description2015Updated <- dataNVD2015Updated$cwe.1
cwe_2_Description2015Updated
cwe_2_Description2015UpdatedDataFrame <- ldply(cwe_2_Description2015Updated, data.frame)
colnames(cwe_2_Description2015UpdatedDataFrame) <- "CWE_ID_2_Description"

#[26]
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
#https://nvd.nist.gov/vuln/categories
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-264"] <- "Permissions, Privileges, and Access Control"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-119"] <- "Buffer Errors"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-20"] <- "Input Validation"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-200"] <- "Information Leak / Disclosure"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-284"] <- "Improper Access Control"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-476"] <- "NULL Pointer Dereference"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-79"] <- "Cross-Site Scripting (XSS)"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-704"] <- "Incorrect Type Conversion or Cast"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-352"] <- "Cross-Site Request Forgery (CSRF)"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-254"] <- "Security Features"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-19"] <- "Data Handling"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-287"] <- "Authentication Issues"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-190"] <- "Integer Overflow or Wraparound"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-295"] <- "Improper Certificate Validation"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-74"] <- "Injection"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-118"] <- "Improper Access of Indexable Resource ('Range Error')"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-275"] <- "Permission Issues"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-129"] <- "Improper Validation of Array Index"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-682"] <- "Incorrect Calculation"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-362"] <- "Race Conditions"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-399"] <- "Resource Management Errors"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-400"] <- "Uncontrolled Resource Consumption ('Resource Exhaustion')"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-384"] <- "Session Fixation"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-285"] <- "Improper Authorization"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-611"] <- "Improper Restriction of XML External Entity Reference ('XXE')"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-77"] <- "Command Injection"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-601"] <- "URL Redirection to Untrusted Site ('Open Redirect')"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-326"] <- "Inadequate Encryption Strength"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-320"] <- "Key Management Errors"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-22"] <- "Path Traversal"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-78"] <- "OS Command Injections"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-426"] <- "Untrusted Search Path"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-93"] <- "Improper Neutralization of CRLF Sequences ('CRLF Injection')"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-89"] <- "SQL Injection"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-255"] <- "Credentials Management"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-416"] <- "Use After Free"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-310"] <- "Cryptographic Issues"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-134"] <- "Format String Vulnerability"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-125"] <- "Out-of-bounds Read"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-415"] <- "Double Free"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-189"] <- "Numeric Errors"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-640"] <- "Weak Password Recovery Mechanism for Forgotten Password"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-94"] <- "Code Injection"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-428"] <- "Unquoted Search Path or Element"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-191"] <- "Integer Underflow (Wrap or Wraparound)"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-787"] <- "Out-of-bounds Write"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-502"] <- "Deserialization of Untrusted Data"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-485"] <- "Insufficient Encapsulation"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-532"] <- "Information Exposure Through Log Files"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-99"] <- "Improper Control of Resource Identifiers ('Resource Injection')"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-427"] <- "Uncontrolled Search Path Element"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-306"] <- "Missing Authentication for Critical Function"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-798"] <- "Use of Hard-coded Credentials"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-943"] <- "Improper Neutralization of Special Elements in Data Query Logic"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-327"] <- "Use of a Broken or Risky Cryptographic Algorithm"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-388"] <- "Error Handling"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-918"] <- "Server-Side Request Forgery (SSRF)"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-346"] <- "Origin Validation Error"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-91"] <- "XML Injection (aka Blind XPath Injection)"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-361"] <- "Time and State"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-434"] <- "Unrestricted Upload of File with Dangerous Type"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-417"] <- "Channel and Path Errors"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-613"] <- "Insufficient Session Expiration"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-369"] <- "Divide By Zero"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-358"] <- "Improperly Implemented Security Check for Standard"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-59"] <- "Link Following"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-113"] <- "Improper Neutralization of CRLF Sequences in HTTP Headers ('HTTP Response Splitting')"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-404"] <- "Improper Resource Shutdown or Release"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-116"] <- "Improper Encoding or Escaping of Output"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-90"] <- "Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-17"] <- "Code"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-338"] <- "Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)"
#----------#
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-693"] <- "Protection Mechanism Failure"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-345"] <- "Insufficient Verification of Data Authenticity"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-297"] <- "Improper Validation of Certificate with Host Mismatch"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-21"] <- "Path Equivalence"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-331"] <- "Insufficient Entropy"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-172"] <- "Encoding Error"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-669"] <- "Incorrect Resource Transfer Between Spheres"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-330"] <- "Use of Insufficiently Random Values"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-199"] <- "Information Management Errors"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-184"] <- "Incomplete Blacklist"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-18"] <- "Source Code"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-749"] <- "Exposed Dangerous Method or Function"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-347"] <- "Improper Verification of Cryptographic Signature"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-754"] <- "Improper Check for Unusual or Exceptional Conditions"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-664"] <- "Improper Control of a Resource Through its Lifetime"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-775"] <- "Missing Release of File Descriptor or Handle after Effective Lifetime"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-332"] <- "Insufficient Entropy in PRNG"
#----------#
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-441"] <- "Unintended Proxy or Intermediary ('Confused Deputy')"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-123"] <- "Write-what-where Condition"
levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2015UpdatedDataFrame$CWE_ID_2_Description) == "CWE-185"] <- "Incorrect Regular Expression"
View(cwe_2_Description2015UpdatedDataFrame)

nvd2015UpdatedTotal <- cbind(cveID2015UpdatedDataFrame, summary2015UpdatedDataFrame, 
														 publishedDate2015UpdatedDataFrame, publishedTime2015UpdatedDataFrame, 
														 lastModifiedDate2015UpdatedDataFrame, lastModifiedTime2015UpdatedDataFrame,
														 cvss2015UpdatedDataFrame, cvssSeverity2015UpdatedDataFrame,
														 cvssAccessVector2015UpdatedDataFrame, cvssAccessComplexity2015UpdatedDataFrame, 
														 cvssAuthentication2015UpdatedDataFrame, cvssConfidentialityImpact2015UpdatedDataFrame, 
														 cvssIntegrityImpact2015UpdatedDataFrame, cvssAvailabilityImpact2015UpdatedDataFrame, 
														 cvssGeneratedOnDate2015UpdatedDataFrame, cvssGeneratedOnTime2015UpdatedDataFrame,
														 cwe_1_2015UpdatedDataFrame, cwe_1_Description2015UpdatedDataFrame,
														 cwe_2_2015UpdatedDataFrame, cwe_2_Description2015UpdatedDataFrame)
nvd2015UpdatedTotalDistinct <- distinct(nvd2015UpdatedTotal)
write.csv(nvd2015UpdatedTotalDistinct, "CVE_2015_Updated.csv", row.names = FALSE)

#[28]
#https://stat.ethz.ch/pipermail/r-help/2012-December/343413.html
nvd2015UpdatedTotalDistinctLastRowRemoved <- nvd2015UpdatedTotalDistinct[-nrow(nvd2015UpdatedTotalDistinct),]
write.csv(nvd2015UpdatedTotalDistinctLastRowRemoved, "CVE_2015_Updated_Last_Row_Removed.csv", row.names = FALSE)

#[29]
#http://www.duanqu.tech/questions/4900348/how-to-remove-rows-in-a-dataframe-that-contain-certain-words-in-r
nvd2015UpdatedTotalDistinctReject <- nvd2015UpdatedTotalDistinctLastRowRemoved[grepl("DO NOT USE THIS CANDIDATE NUMBER.", nvd2015UpdatedTotalDistinctLastRowRemoved$Vulnerability_Summary), ]
View(nvd2015UpdatedTotalDistinctReject)
nvd2015UpdatedTotalDistinctRejectRemoved <- nvd2015UpdatedTotalDistinctLastRowRemoved[!grepl("DO NOT USE THIS CANDIDATE NUMBER.", nvd2015UpdatedTotalDistinctLastRowRemoved$Vulnerability_Summary), ]
View(nvd2015UpdatedTotalDistinctRejectRemoved)
write.csv(nvd2015UpdatedTotalDistinctRejectRemoved, "CVE_2015_Updated_Rejected_Removed.csv", row.names = FALSE)

#[30]
#https://stackoverflow.com/questions/20977972/how-to-remove-na-data-in-only-one-columns
nvd2015UpdatedTotalDistinctNA <- nvd2015UpdatedTotalDistinctRejectRemoved[is.na(nvd2015UpdatedTotalDistinctRejectRemoved$CVSS_Score),]
View(nvd2015UpdatedTotalDistinctNA)
nvd2015UpdatedTotalDistinctNARemoved <- nvd2015UpdatedTotalDistinctRejectRemoved[!is.na(nvd2015UpdatedTotalDistinctRejectRemoved$CVSS_Score),]
View(nvd2015UpdatedTotalDistinctNARemoved)
write.csv(nvd2015UpdatedTotalDistinctNARemoved, "CVE_2015_Updated_NA_Removed.csv", row.names = FALSE)
