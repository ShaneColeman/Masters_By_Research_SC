#[1]
#NVD_2014_RScript.R

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
nvd2014 <- xmlParse(file = "nvdcve-2.0-2014.xml")
summary(nvd2014)

#[4]
nvd2014List <- xmlToList(nvd2014)
nvd2014List
dataNVD2014 <- ldply(.data = nvd2014List, data.frame)

#[5]
cveID2014 <- dataNVD2014$cve.id
cveID2014
cveID2014DataFrame <- ldply(cveID2014, data.frame)
colnames(cveID2014DataFrame) <- "CVE_ID"

#[6]
summary2014 <- dataNVD2014$summary
summary2014
summary2014DataFrame <- ldply(summary2014, data.frame)
colnames(summary2014DataFrame) <- "Vulnerability_Summary"

#[7]
publishedDateTime2014 <- dataNVD2014$published.datetime
publishedDateTime2014
#----------Vulnerability_Published_Date----------#
publishedDate2014 <- anydate(publishedDateTime2014)
publishedDate2014DataFrame <- ldply(publishedDate2014, data.frame)
colnames(publishedDate2014DataFrame) <- "Vulnerability_Published_Date"

#[8]
#----------Vulnerability_Published_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
publishedTime2014 <- iso8601(anytime(publishedDateTime2014, tz = "UTC"))
publishedTime2014
#http://rfunction.com/archives/1499
publishedTimeSplit2014 <- strsplit(publishedTime2014, " ") 
publishedTimeSplit2014
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
publishedTimeSplitSecondElement2014 <- sapply(publishedTimeSplit2014, "[", 2)
publishedTimeSplitSecondElement2014
publishedTime2014DataFrame <- ldply(publishedTimeSplitSecondElement2014, data.frame)
colnames(publishedTime2014DataFrame) <- "Vulnerability_Published_Time"

#[9]
lastModifiedDateTime2014 <- dataNVD2014$last.modified.datetime
lastModifiedDateTime2014
#----------Vulnerability_Last_Modified_Date----------#
lastModifiedDate2014 <- anydate(lastModifiedDateTime2014)
lastModifiedDate2014
lastModifiedDate2014DataFrame <- ldply(lastModifiedDate2014, data.frame)
colnames(lastModifiedDate2014DataFrame) <- "Vulnerability_Last_Modified_Date"

#[10]
#----------Vulnerability_Last_Modified_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
lastModifiedTime2014 <- iso8601(anytime(lastModifiedDateTime2014, tz = "UTC"))
lastModifiedTime2014
#http://rfunction.com/archives/1499
lastModifiedTimeSplit2014 <- strsplit(lastModifiedTime2014, " ") 
lastModifiedTimeSplit2014
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
lastModifiedTimeSplitSecondElement2014 <- sapply(lastModifiedTimeSplit2014, "[", 2)
lastModifiedTimeSplitSecondElement2014
lastModifiedTime2014DataFrame <- ldply(lastModifiedTimeSplitSecondElement2014, data.frame)
colnames(lastModifiedTime2014DataFrame) <- "Vulnerability_Last_Modified_Time"

#[11]
cvss2014 <- dataNVD2014$cvss.base_metrics.score
cvss2014
cvss2014DataFrame <- ldply(cvss2014, data.frame)
colnames(cvss2014DataFrame) <- "CVSS_Score"

#[12]
#https://nvd.nist.gov/vuln-metrics/cvss
cvssSeverity2014 <- dataNVD2014$cvss.base_metrics.score
cvssSeverity2014
cvssSeverity2014DataFrame <- ldply(cvssSeverity2014, data.frame)
colnames(cvssSeverity2014DataFrame) <- "CVSS_Severity"
str(cvssSeverity2014DataFrame)
View(cvssSeverity2014DataFrame)
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
levels(cvssSeverity2014DataFrame$CVSS_Severity)[levels(cvssSeverity2014DataFrame$CVSS_Severity) == "10.0"] <- "HIGH"
levels(cvssSeverity2014DataFrame$CVSS_Severity)[levels(cvssSeverity2014DataFrame$CVSS_Severity) >= 7.0 & 
																									levels(cvssSeverity2014DataFrame$CVSS_Severity) < 9.9] <- "HIGH"
levels(cvssSeverity2014DataFrame$CVSS_Severity)[levels(cvssSeverity2014DataFrame$CVSS_Severity) >= 4.0 & 
																									levels(cvssSeverity2014DataFrame$CVSS_Severity) <= 6.9] <- "MEDIUM"
levels(cvssSeverity2014DataFrame$CVSS_Severity)[levels(cvssSeverity2014DataFrame$CVSS_Severity) >= 0.0 & 
																									levels(cvssSeverity2014DataFrame$CVSS_Severity) <= 3.9] <- "LOW"
View(cvssSeverity2014DataFrame)

#[13]
cvssAccessVector2014 <- dataNVD2014$cvss.base_metrics.access.vector
cvssAccessVector2014
cvssAccessVector2014DataFrame <- ldply(cvssAccessVector2014, data.frame)
colnames(cvssAccessVector2014DataFrame) <- "CVSS_Access_Vector"

#[14]
cvssAccessComplexity2014 <- dataNVD2014$cvss.base_metrics.access.complexity
cvssAccessComplexity2014
cvssAccessComplexity2014DataFrame <- ldply(cvssAccessComplexity2014, data.frame)
colnames(cvssAccessComplexity2014DataFrame) <- "CVSS_Access_Complexity"

#[15]
cvssAuthentication2014 <- dataNVD2014$cvss.base_metrics.authentication
cvssAuthentication2014
cvssAuthentication2014DataFrame <- ldply(cvssAuthentication2014, data.frame)
colnames(cvssAuthentication2014DataFrame) <- "CVSS_Authentication"

#[16]
cvssConfidentialityImpact2014 <- dataNVD2014$cvss.base_metrics.confidentiality.impact
cvssConfidentialityImpact2014
cvssConfidentialityImpact2014DataFrame <- ldply(cvssConfidentialityImpact2014, data.frame)
colnames(cvssConfidentialityImpact2014DataFrame) <- "CVSS_Confidentiality_Impact"

#[17]
cvssIntegrityImpact2014 <- dataNVD2014$cvss.base_metrics.integrity.impact
cvssIntegrityImpact2014
cvssIntegrityImpact2014DataFrame <- ldply(cvssIntegrityImpact2014, data.frame)
colnames(cvssIntegrityImpact2014DataFrame) <- "CVSS_Integrity_Impact"

#[18]
cvssAvailabilityImpact2014 <- dataNVD2014$cvss.base_metrics.availability.impact
cvssAvailabilityImpact2014
cvssAvailabilityImpact2014DataFrame <- ldply(cvssAvailabilityImpact2014, data.frame)
colnames(cvssAvailabilityImpact2014DataFrame) <- "CVSS_Availability_Impact"

#[19]
cvssGeneratedOnDateTime2014 <- dataNVD2014$cvss.base_metrics.generated.on.datetime
cvssGeneratedOnDateTime2014
#----------CVSS_Generated_On_Date----------#
cvssGeneratedOnDate2014 <- anydate(cvssGeneratedOnDateTime2014)
cvssGeneratedOnDate2014DataFrame <- ldply(cvssGeneratedOnDate2014, data.frame)
colnames(cvssGeneratedOnDate2014DataFrame) <- "CVSS_Generated_On_Date"

#[20]
#----------CVSS_Generated_On_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
cvssGeneratedOnTime2014 <- iso8601(anytime(cvssGeneratedOnDateTime2014, tz = "UTC"))
cvssGeneratedOnTime2014
#http://rfunction.com/archives/1499
cvssGeneratedOnTimeSplit2014 <- strsplit(cvssGeneratedOnTime2014, " ") 
cvssGeneratedOnTimeSplit2014
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
cvssGeneratedOnTimeSplitSecondElement2014 <- sapply(cvssGeneratedOnTimeSplit2014, "[", 2)
cvssGeneratedOnTimeSplitSecondElement2014
cvssGeneratedOnTime2014DataFrame <- ldply(cvssGeneratedOnTimeSplitSecondElement2014, data.frame)
colnames(cvssGeneratedOnTime2014DataFrame) <- "CVSS_Generated_On_Time"

#cwe2014 <- dataNVD2014$cwe
#cwe2014
#cwe2014DataFrame <- ldply(cwe2014, data.frame)
#colnames(cwe2014DataFrame) <- "CWE_ID"

#[21]
cwe_1_2014 <- dataNVD2014$cwe
cwe_1_2014
cwe_1_2014DataFrame <- ldply(cwe_1_2014, data.frame)
colnames(cwe_1_2014DataFrame) <- "CWE_ID_1"

#[22]
cwe_1_Description2014 <- dataNVD2014$cwe
cwe_1_Description2014
cwe_1_Description2014DataFrame <- ldply(cwe_1_Description2014, data.frame)
colnames(cwe_1_Description2014DataFrame) <- "CWE_ID_1_Description"

#[23]
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
#https://nvd.nist.gov/vuln/categories
#----------#
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-264"] <- "Permissions, Privileges, and Access Control"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-119"] <- "Buffer Errors"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-20"] <- "Input Validation"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-200"] <- "Information Leak / Disclosure"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-284"] <- "Improper Access Control"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-476"] <- "NULL Pointer Dereference"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-79"] <- "Cross-Site Scripting (XSS)"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-704"] <- "Incorrect Type Conversion or Cast"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-352"] <- "Cross-Site Request Forgery (CSRF)"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-254"] <- "Security Features"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-19"] <- "Data Handling"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-287"] <- "Authentication Issues"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-190"] <- "Integer Overflow or Wraparound"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-295"] <- "Improper Certificate Validation"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-74"] <- "Injection"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-118"] <- "Improper Access of Indexable Resource ('Range Error')"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-275"] <- "Permission Issues"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-129"] <- "Improper Validation of Array Index"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-682"] <- "Incorrect Calculation"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-362"] <- "Race Conditions"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-399"] <- "Resource Management Errors"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-400"] <- "Uncontrolled Resource Consumption ('Resource Exhaustion')"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-384"] <- "Session Fixation"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-285"] <- "Improper Authorization"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-611"] <- "Improper Restriction of XML External Entity Reference ('XXE')"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-77"] <- "Command Injection"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-601"] <- "URL Redirection to Untrusted Site ('Open Redirect')"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-326"] <- "Inadequate Encryption Strength"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-320"] <- "Key Management Errors"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-22"] <- "Path Traversal"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-78"] <- "OS Command Injections"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-426"] <- "Untrusted Search Path"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-93"] <- "Improper Neutralization of CRLF Sequences ('CRLF Injection')"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-89"] <- "SQL Injection"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-255"] <- "Credentials Management"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-416"] <- "Use After Free"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-310"] <- "Cryptographic Issues"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-134"] <- "Format String Vulnerability"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-125"] <- "Out-of-bounds Read"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-415"] <- "Double Free"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-189"] <- "Numeric Errors"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-640"] <- "Weak Password Recovery Mechanism for Forgotten Password"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-94"] <- "Code Injection"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-428"] <- "Unquoted Search Path or Element"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-191"] <- "Integer Underflow (Wrap or Wraparound)"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-787"] <- "Out-of-bounds Write"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-502"] <- "Deserialization of Untrusted Data"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-485"] <- "Insufficient Encapsulation"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-532"] <- "Information Exposure Through Log Files"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-99"] <- "Improper Control of Resource Identifiers ('Resource Injection')"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-427"] <- "Uncontrolled Search Path Element"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-306"] <- "Missing Authentication for Critical Function"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-798"] <- "Use of Hard-coded Credentials"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-943"] <- "Improper Neutralization of Special Elements in Data Query Logic"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-327"] <- "Use of a Broken or Risky Cryptographic Algorithm"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-388"] <- "Error Handling"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-918"] <- "Server-Side Request Forgery (SSRF)"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-346"] <- "Origin Validation Error"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-91"] <- "XML Injection (aka Blind XPath Injection)"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-361"] <- "Time and State"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-434"] <- "Unrestricted Upload of File with Dangerous Type"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-417"] <- "Channel and Path Errors"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-613"] <- "Insufficient Session Expiration"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-369"] <- "Divide By Zero"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-358"] <- "Improperly Implemented Security Check for Standard"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-59"] <- "Link Following"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-113"] <- "Improper Neutralization of CRLF Sequences in HTTP Headers ('HTTP Response Splitting')"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-404"] <- "Improper Resource Shutdown or Release"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-116"] <- "Improper Encoding or Escaping of Output"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-90"] <- "Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-17"] <- "Code"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-338"] <- "Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)"
#----------#
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-693"] <- "Protection Mechanism Failure"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-345"] <- "Insufficient Verification of Data Authenticity"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-297"] <- "Improper Validation of Certificate with Host Mismatch"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-21"] <- "Path Equivalence"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-331"] <- "Insufficient Entropy"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-172"] <- "Encoding Error"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-669"] <- "Incorrect Resource Transfer Between Spheres"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-330"] <- "Use of Insufficiently Random Values"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-199"] <- "Information Management Errors"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-184"] <- "Incomplete Blacklist"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-18"] <- "Source Code"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-749"] <- "Exposed Dangerous Method or Function"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-347"] <- "Improper Verification of Cryptographic Signature"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-754"] <- "Improper Check for Unusual or Exceptional Conditions"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-664"] <- "Improper Control of a Resource Through its Lifetime"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-775"] <- "Missing Release of File Descriptor or Handle after Effective Lifetime"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-332"] <- "Insufficient Entropy in PRNG"
#----------#
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-441"] <- "Unintended Proxy or Intermediary ('Confused Deputy')"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-123"] <- "Write-what-where Condition"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-185"] <- "Incorrect Regular Expression"
#----------#
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-824"] <- "Access of Uninitialized Pointer"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-16"] <- "Configuration"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-913"] <- "Improper Control of Dynamically-Managed Code Resources"
levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2014DataFrame$CWE_ID_1_Description) == "CWE-665"] <- "Improper Initialization"
View(cwe_1_Description2014DataFrame)

#[24]
cwe_2_2014 <- dataNVD2014$cwe.1
cwe_2_2014
cwe_2_2014DataFrame <- ldply(cwe_2_2014, data.frame)
colnames(cwe_2_2014DataFrame) <- "CWE_ID_2"

#[25]
cwe_2_Description2014 <- dataNVD2014$cwe.1
cwe_2_Description2014
cwe_2_Description2014DataFrame <- ldply(cwe_2_Description2014, data.frame)
colnames(cwe_2_Description2014DataFrame) <- "CWE_ID_2_Description"

#[26]
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
#https://nvd.nist.gov/vuln/categories
#----------#
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-264"] <- "Permissions, Privileges, and Access Control"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-119"] <- "Buffer Errors"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-20"] <- "Input Validation"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-200"] <- "Information Leak / Disclosure"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-284"] <- "Improper Access Control"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-476"] <- "NULL Pointer Dereference"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-79"] <- "Cross-Site Scripting (XSS)"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-704"] <- "Incorrect Type Conversion or Cast"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-352"] <- "Cross-Site Request Forgery (CSRF)"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-254"] <- "Security Features"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-19"] <- "Data Handling"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-287"] <- "Authentication Issues"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-190"] <- "Integer Overflow or Wraparound"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-295"] <- "Improper Certificate Validation"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-74"] <- "Injection"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-118"] <- "Improper Access of Indexable Resource ('Range Error')"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-275"] <- "Permission Issues"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-129"] <- "Improper Validation of Array Index"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-682"] <- "Incorrect Calculation"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-362"] <- "Race Conditions"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-399"] <- "Resource Management Errors"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-400"] <- "Uncontrolled Resource Consumption ('Resource Exhaustion')"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-384"] <- "Session Fixation"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-285"] <- "Improper Authorization"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-611"] <- "Improper Restriction of XML External Entity Reference ('XXE')"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-77"] <- "Command Injection"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-601"] <- "URL Redirection to Untrusted Site ('Open Redirect')"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-326"] <- "Inadequate Encryption Strength"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-320"] <- "Key Management Errors"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-22"] <- "Path Traversal"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-78"] <- "OS Command Injections"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-426"] <- "Untrusted Search Path"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-93"] <- "Improper Neutralization of CRLF Sequences ('CRLF Injection')"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-89"] <- "SQL Injection"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-255"] <- "Credentials Management"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-416"] <- "Use After Free"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-310"] <- "Cryptographic Issues"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-134"] <- "Format String Vulnerability"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-125"] <- "Out-of-bounds Read"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-415"] <- "Double Free"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-189"] <- "Numeric Errors"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-640"] <- "Weak Password Recovery Mechanism for Forgotten Password"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-94"] <- "Code Injection"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-428"] <- "Unquoted Search Path or Element"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-191"] <- "Integer Underflow (Wrap or Wraparound)"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-787"] <- "Out-of-bounds Write"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-502"] <- "Deserialization of Untrusted Data"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-485"] <- "Insufficient Encapsulation"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-532"] <- "Information Exposure Through Log Files"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-99"] <- "Improper Control of Resource Identifiers ('Resource Injection')"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-427"] <- "Uncontrolled Search Path Element"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-306"] <- "Missing Authentication for Critical Function"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-798"] <- "Use of Hard-coded Credentials"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-943"] <- "Improper Neutralization of Special Elements in Data Query Logic"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-327"] <- "Use of a Broken or Risky Cryptographic Algorithm"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-388"] <- "Error Handling"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-918"] <- "Server-Side Request Forgery (SSRF)"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-346"] <- "Origin Validation Error"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-91"] <- "XML Injection (aka Blind XPath Injection)"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-361"] <- "Time and State"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-434"] <- "Unrestricted Upload of File with Dangerous Type"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-417"] <- "Channel and Path Errors"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-613"] <- "Insufficient Session Expiration"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-369"] <- "Divide By Zero"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-358"] <- "Improperly Implemented Security Check for Standard"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-59"] <- "Link Following"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-113"] <- "Improper Neutralization of CRLF Sequences in HTTP Headers ('HTTP Response Splitting')"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-404"] <- "Improper Resource Shutdown or Release"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-116"] <- "Improper Encoding or Escaping of Output"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-90"] <- "Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-17"] <- "Code"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-338"] <- "Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)"
#----------#
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-693"] <- "Protection Mechanism Failure"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-345"] <- "Insufficient Verification of Data Authenticity"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-297"] <- "Improper Validation of Certificate with Host Mismatch"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-21"] <- "Path Equivalence"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-331"] <- "Insufficient Entropy"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-172"] <- "Encoding Error"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-669"] <- "Incorrect Resource Transfer Between Spheres"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-330"] <- "Use of Insufficiently Random Values"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-199"] <- "Information Management Errors"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-184"] <- "Incomplete Blacklist"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-18"] <- "Source Code"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-749"] <- "Exposed Dangerous Method or Function"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-347"] <- "Improper Verification of Cryptographic Signature"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-754"] <- "Improper Check for Unusual or Exceptional Conditions"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-664"] <- "Improper Control of a Resource Through its Lifetime"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-775"] <- "Missing Release of File Descriptor or Handle after Effective Lifetime"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-332"] <- "Insufficient Entropy in PRNG"
#----------#
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-441"] <- "Unintended Proxy or Intermediary ('Confused Deputy')"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-123"] <- "Write-what-where Condition"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-185"] <- "Incorrect Regular Expression"
#----------#
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-824"] <- "Access of Uninitialized Pointer"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-16"] <- "Configuration"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-913"] <- "Improper Control of Dynamically-Managed Code Resources"
levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2014DataFrame$CWE_ID_2_Description) == "CWE-665"] <- "Improper Initialization"
View(cwe_2_Description2014DataFrame)

#[27]
nvd2014Total <- cbind(cveID2014DataFrame, summary2014DataFrame, 
											publishedDate2014DataFrame, publishedTime2014DataFrame, 
											lastModifiedDate2014DataFrame, lastModifiedTime2014DataFrame,
											cvss2014DataFrame, cvssSeverity2014DataFrame,
											cvssAccessVector2014DataFrame, cvssAccessComplexity2014DataFrame, 
											cvssAuthentication2014DataFrame, cvssConfidentialityImpact2014DataFrame, 
											cvssIntegrityImpact2014DataFrame, cvssAvailabilityImpact2014DataFrame, 
											cvssGeneratedOnDate2014DataFrame, 
											cwe_1_2014DataFrame, cwe_1_Description2014DataFrame,
											cwe_2_2014DataFrame, cwe_2_Description2014DataFrame)
nvd2014TotalDistinct <-distinct(nvd2014Total)
write.csv(nvd2014TotalDistinct, "CVE_2014.csv", row.names = FALSE)

#[28]
#https://stat.ethz.ch/pipermail/r-help/2012-December/343413.html
nvd2014TotalDistinctLastRowRemoved <- nvd2014TotalDistinct[-nrow(nvd2014TotalDistinct),]
write.csv(nvd2014TotalDistinctLastRowRemoved, "CVE_2014_Last_Row_Removed.csv", row.names = FALSE)

#[29]
#http://www.duanqu.tech/questions/4900348/how-to-remove-rows-in-a-dataframe-that-contain-certain-words-in-r
nvd2014TotalDistinctRejectRemoved <- nvd2014TotalDistinctLastRowRemoved[!grepl("DO NOT USE THIS CANDIDATE NUMBER.", nvd2014TotalDistinctLastRowRemoved$Vulnerability_Summary), ]
write.csv(nvd2014TotalDistinctRejectRemoved, "CVE_2014_Rejected_Removed.csv", row.names = FALSE)

#[30]
#https://stackoverflow.com/questions/20977972/how-to-remove-na-data-in-only-one-columns
nvd2014TotalDistinctNARemoved <- nvd2014TotalDistinctRejectRemoved[!is.na(nvd2014TotalDistinctRejectRemoved$CVSS_Score),]
write.csv(nvd2014TotalDistinctNARemoved, "CVE_2014_NA_Removed.csv", row.names = FALSE)
