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

#[5]
cveID2017Updated <- dataNVD2017Updated$cve.id
cveID2017Updated
cveID2017UpdatedDataFrame <- ldply(cveID2017Updated, data.frame)
colnames(cveID2017UpdatedDataFrame) <- "CVE_ID"

#[6]
summary2017Updated <- dataNVD2017Updated$summary
summary2017Updated
summary2017UpdatedDataFrame <- ldply(summary2017Updated, data.frame)
colnames(summary2017UpdatedDataFrame) <- "Vulnerability_Summary"

#[7]
publishedDateTime2017Updated <- dataNVD2017Updated$published.datetime
publishedDateTime2017Updated
#----------Vulnerability_Published_Date----------#
publishedDate2017Updated <- anydate(publishedDateTime2017Updated) #Published Date 2017
publishedDate2017Updated
publishedDate2017UpdatedDataFrame <- ldply(publishedDate2017Updated, data.frame)
colnames(publishedDate2017UpdatedDataFrame) <- "Vulnerability_Published_Date"

#[8]
#----------Vulnerability_Published_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
publishedTime2017Updated <- iso8601(anytime(publishedDateTime2017Updated, tz = "UTC"))
publishedTime2017Updated
#http://rfunction.com/archives/1499
publishedTimeSplit2017Updated <- strsplit(publishedTime2017Updated, " ") 
publishedTimeSplit2017Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
publishedTimeSplitSecondElement2017Updated <- sapply(publishedTimeSplit2017Updated, "[", 2)
publishedTimeSplitSecondElement2017Updated
publishedTime2017UpdatedDataFrame <- ldply(publishedTimeSplitSecondElement2017Updated, data.frame)
colnames(publishedTime2017UpdatedDataFrame) <- "Vulnerability_Published_Time"

#[9]
lastModifiedDateTime2017Updated <- dataNVD2017Updated$last.modified.datetime
lastModifiedDateTime2017Updated
#----------Vulnerability_Last_Modified_Date----------#
lastModifiedDate2017Updated <- anydate(lastModifiedDateTime2017Updated)
lastModifiedDate2017Updated
lastModifiedDate2017UpdatedDataFrame <- ldply(lastModifiedDate2017Updated, data.frame)
colnames(lastModifiedDate2017UpdatedDataFrame) <- "Vulnerability_Last_Modified_Date"

#[10]
#----------Vulnerability_Last_Modified_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
lastModifiedTime2017Updated <- iso8601(anytime(lastModifiedDateTime2017Updated, tz = "UTC"))
lastModifiedTime2017Updated
#http://rfunction.com/archives/1499
lastModifiedTimeSplit2017Updated <- strsplit(lastModifiedTime2017Updated, " ") 
lastModifiedTimeSplit2017Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
lastModifiedTimeSplitSecondElement2017Updated <- sapply(lastModifiedTimeSplit2017Updated, "[", 2)
lastModifiedTimeSplitSecondElement2017Updated
lastModifiedTime2017UpdatedDataFrame <- ldply(lastModifiedTimeSplitSecondElement2017Updated, data.frame)
colnames(lastModifiedTime2017UpdatedDataFrame) <- "Vulnerability_Last_Modified_Time"

#[11]
cvss2017Updated <- dataNVD2017Updated$cvss.base_metrics.score
cvss2017Updated
cvss2017UpdatedDataFrame <- ldply(cvss2017Updated, data.frame)
colnames(cvss2017UpdatedDataFrame) <- "CVSS_Score"

#[12]
#https://nvd.nist.gov/vuln-metrics/cvss
cvssSeverity2017Updated <- dataNVD2017Updated$cvss.base_metrics.score
cvssSeverity2017Updated
cvssSeverity2017UpdatedDataFrame <- ldply(cvssSeverity2017Updated, data.frame)
colnames(cvssSeverity2017UpdatedDataFrame) <- "CVSS_Severity"
str(cvssSeverity2017UpdatedDataFrame)
View(cvssSeverity2017UpdatedDataFrame)
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity) == "10.0"] <- "HIGH"
levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity) >= 7.0 & 
																									levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity) < 9.9] <- "HIGH"
levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity) >= 4.0 & 
																									levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity) <= 6.9] <- "MEDIUM"
levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity) >= 0.0 & 
																									levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity) <= 3.9] <- "LOW"
View(cvssSeverity2017UpdatedDataFrame)

#[13]
cvssAccessVector2017Updated <- dataNVD2017Updated$cvss.base_metrics.access.vector
cvssAccessVector2017Updated
cvssAccessVector2017UpdatedDataFrame <- ldply(cvssAccessVector2017Updated, data.frame)
colnames(cvssAccessVector2017UpdatedDataFrame) <- "CVSS_Access_Vector"

#[14]
cvssAccessComplexity2017Updated <- dataNVD2017Updated$cvss.base_metrics.access.complexity
cvssAccessComplexity2017Updated
cvssAccessComplexity2017UpdatedDataFrame <- ldply(cvssAccessComplexity2017Updated, data.frame)
colnames(cvssAccessComplexity2017UpdatedDataFrame) <- "CVSS_Access_Complexity"

#[15]
cvssAuthentication2017Updated <- dataNVD2017Updated$cvss.base_metrics.authentication
cvssAuthentication2017Updated
cvssAuthentication2017UpdatedDataFrame <- ldply(cvssAuthentication2017Updated, data.frame)
colnames(cvssAuthentication2017UpdatedDataFrame) <- "CVSS_Authentication"

#[16]
cvssConfidentialityImpact2017Updated <- dataNVD2017Updated$cvss.base_metrics.confidentiality.impact
cvssConfidentialityImpact2017Updated
cvssConfidentialityImpact2017UpdatedDataFrame <- ldply(cvssConfidentialityImpact2017Updated, data.frame)
colnames(cvssConfidentialityImpact2017UpdatedDataFrame) <- "CVSS_Confidentiality_Impact"

#[17]
cvssIntegrityImpact2017Updated <- dataNVD2017Updated$cvss.base_metrics.integrity.impact
cvssIntegrityImpact2017Updated
cvssIntegrityImpact2017UpdatedDataFrame <- ldply(cvssIntegrityImpact2017Updated, data.frame)
colnames(cvssIntegrityImpact2017UpdatedDataFrame) <- "CVSS_Integrity_Impact"

#[18]
cvssAvailabilityImpact2017Updated <- dataNVD2017Updated$cvss.base_metrics.availability.impact
cvssAvailabilityImpact2017Updated
cvssAvailabilityImpact2017UpdatedDataFrame <- ldply(cvssAvailabilityImpact2017Updated, data.frame)
colnames(cvssAvailabilityImpact2017UpdatedDataFrame) <- "CVSS_Availability_Impact"

#[19]
cvssGeneratedOnDateTime2017Updated <- dataNVD2017Updated$cvss.base_metrics.generated.on.datetime
cvssGeneratedOnDateTime2017Updated
#----------CVSS_Generated_On_Date----------#
cvssGeneratedOnDate2017Updated <- anydate(cvssGeneratedOnDateTime2017Updated)
cvssGeneratedOnDate2017UpdatedDataFrame <- ldply(cvssGeneratedOnDate2017Updated, data.frame)
colnames(cvssGeneratedOnDate2017UpdatedDataFrame) <- "CVSS_Generated_On_Date"

#[20]
#----------CVSS_Generated_On_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
cvssGeneratedOnTime2017Updated <- iso8601(anytime(cvssGeneratedOnDateTime2017Updated, tz = "UTC"))
cvssGeneratedOnTime2017Updated
#http://rfunction.com/archives/1499
cvssGeneratedOnTimeSplit2017Updated <- strsplit(cvssGeneratedOnTime2017Updated, " ") 
cvssGeneratedOnTimeSplit2017Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
cvssGeneratedOnTimeSplitSecondElement2017Updated <- sapply(cvssGeneratedOnTimeSplit2017Updated, "[", 2)
cvssGeneratedOnTimeSplitSecondElement2017Updated
cvssGeneratedOnTime2017UpdatedDataFrame <- ldply(cvssGeneratedOnTimeSplitSecondElement2017Updated, data.frame)
colnames(cvssGeneratedOnTime2017UpdatedDataFrame) <- "CVSS_Generated_On_Time"

#[21]
cwe_1_2017Updated <- dataNVD2017Updated$cwe
cwe_1_2017Updated
cwe_1_2017UpdatedDataFrame <- ldply(cwe_1_2017Updated, data.frame)
colnames(cwe_1_2017UpdatedDataFrame) <- "CWE_ID_1"

#[22]
cwe_1_Description2017Updated <- dataNVD2017Updated$cwe
cwe_1_Description2017Updated
cwe_1_Description2017UpdatedDataFrame <- ldply(cwe_1_Description2017Updated, data.frame)
colnames(cwe_1_Description2017UpdatedDataFrame) <- "CWE_ID_1_Description"

#[23]
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
#https://nvd.nist.gov/vuln/categories
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-264"] <- "Permissions, Privileges, and Access Control"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-119"] <- "Buffer Errors"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-20"] <- "Input Validation"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-200"] <- "Information Leak / Disclosure"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-284"] <- "Improper Access Control"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-476"] <- "NULL Pointer Dereference"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-79"] <- "Cross-Site Scripting (XSS)"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-704"] <- "Incorrect Type Conversion or Cast"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-352"] <- "Cross-Site Request Forgery (CSRF)"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-254"] <- "Security Features"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-19"] <- "Data Handling"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-287"] <- "Authentication Issues"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-190"] <- "Integer Overflow or Wraparound"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-295"] <- "Improper Certificate Validation"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-74"] <- "Injection"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-118"] <- "Improper Access of Indexable Resource ('Range Error')"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-275"] <- "Permission Issues"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-129"] <- "Improper Validation of Array Index"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-682"] <- "Incorrect Calculation"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-362"] <- "Race Conditions"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-399"] <- "Resource Management Errors"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-400"] <- "Uncontrolled Resource Consumption ('Resource Exhaustion')"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-384"] <- "Session Fixation"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-285"] <- "Improper Authorization"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-611"] <- "Improper Restriction of XML External Entity Reference ('XXE')"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-77"] <- "Command Injection"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-601"] <- "URL Redirection to Untrusted Site ('Open Redirect')"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-326"] <- "Inadequate Encryption Strength"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-320"] <- "Key Management Errors"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-22"] <- "Path Traversal"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-78"] <- "OS Command Injections"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-426"] <- "Untrusted Search Path"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-93"] <- "Improper Neutralization of CRLF Sequences ('CRLF Injection')"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-89"] <- "SQL Injection"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-255"] <- "Credentials Management"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-416"] <- "Use After Free"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-310"] <- "Cryptographic Issues"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-134"] <- "Format String Vulnerability"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-125"] <- "Out-of-bounds Read"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-415"] <- "Double Free"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-189"] <- "Numeric Errors"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-640"] <- "Weak Password Recovery Mechanism for Forgotten Password"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-94"] <- "Code Injection"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-428"] <- "Unquoted Search Path or Element"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-191"] <- "Integer Underflow (Wrap or Wraparound)"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-787"] <- "Out-of-bounds Write"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-502"] <- "Deserialization of Untrusted Data"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-485"] <- "Insufficient Encapsulation"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-532"] <- "Information Exposure Through Log Files"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-99"] <- "Improper Control of Resource Identifiers ('Resource Injection')"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-427"] <- "Uncontrolled Search Path Element"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-306"] <- "Missing Authentication for Critical Function"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-798"] <- "Use of Hard-coded Credentials"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-943"] <- "Improper Neutralization of Special Elements in Data Query Logic"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-327"] <- "Use of a Broken or Risky Cryptographic Algorithm"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-388"] <- "Error Handling"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-918"] <- "Server-Side Request Forgery (SSRF)"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-346"] <- "Origin Validation Error"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-91"] <- "XML Injection (aka Blind XPath Injection)"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-361"] <- "Time and State"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-434"] <- "Unrestricted Upload of File with Dangerous Type"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-417"] <- "Channel and Path Errors"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-613"] <- "Insufficient Session Expiration"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-369"] <- "Divide By Zero"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-358"] <- "Improperly Implemented Security Check for Standard"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-59"] <- "Link Following"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-113"] <- "Improper Neutralization of CRLF Sequences in HTTP Headers ('HTTP Response Splitting')"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-404"] <- "Improper Resource Shutdown or Release"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-116"] <- "Improper Encoding or Escaping of Output"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-90"] <- "Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-17"] <- "Code"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-338"] <- "Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)"
#----------#
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-331"] <- "Insufficient Entropy"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-347"] <- "Improper Verification of Cryptographic Signature"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-123"] <- "Write-what-where Condition"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-345"] <- "Insufficient Verification of Data Authenticity"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-754"] <- "Improper Check for Unusual or Exceptional Conditions"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-444"] <- "Inconsistent Interpretation of HTTP Requests ('HTTP Request Smuggling')"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-330"] <- "Use of Insufficiently Random Values"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-769"] <- "File Descriptor Exhaustion"
levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017UpdatedDataFrame$CWE_ID_1_Description) == "CWE-824"] <- "Access of Uninitialized Pointer"
View(cwe_1_Description2017UpdatedDataFrame)

#[24]
cwe_2_2017Updated <- dataNVD2017Updated$cwe.1
cwe_2_2017Updated
cwe_2_2017UpdatedDataFrame <- ldply(cwe_2_2017Updated, data.frame)
colnames(cwe_2_2017UpdatedDataFrame) <- "CWE_ID_2"
