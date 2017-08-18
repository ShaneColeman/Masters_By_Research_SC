#NVD_ARFF_Conversion.R

#----------ARFF (Attribute-Relation File Format) Conversion, from Data Frame to ARFF----------#
#https://stackoverflow.com/questions/40880549/how-to-write-data-frame-into-arff-using-r

install.packages("foreign")
library(foreign)

#Data Frame: "nvd2014_2017SelectedColumnsModifiedOrdered"
#Data Frame RScript File Location: "Recommender_System_Similarity_Matrix_Modified_RScript.R"
write.arff(nvd2014_2017SelectedColumnsModifiedOrdered, file = "nvd_2014_2017_total_columns_ordered.arff")
