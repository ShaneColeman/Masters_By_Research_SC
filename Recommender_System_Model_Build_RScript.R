#[1]
#Recommender_System_Model_Build_RScript.R

#[Memory]
#https://support.rstudio.com/hc/en-us/community/posts/115000475648-Memory-limit
memory.limit()
memory.size(15000)

#[2]
#R package for recommendation - recommenderlab
if(!"recommenderlab" %in% rownames(install.packages()))
{
	install.packages("recommenderlab")
}
library(recommenderlab)
help(package = "recommenderlab")
set.seed(1)

#[3]
training <- sample(x = c(TRUE, FALSE),
										size = nrow(nvd2014_2017ColumnsTotalMatrixBinary),
										replace = TRUE,
										prob = c(0.8, 0.2))
summary(training)
21571 + 5463 #TRUE = 21571 / FALSE = 5463
nvd2014_2017ColumnsTotalMatrixBinary #27034 x 187 rating matrix of class ‘binaryRatingMatrix’ with 212381 ratings.
recommender_system_training_data <- nvd2014_2017ColumnsTotalMatrixBinary[training, ]
recommender_system_training_data #21541 x 187 rating matrix of class ‘binaryRatingMatrix’ with 169190 ratings.
recommender_system_testing_data <- nvd2014_2017ColumnsTotalMatrixBinary[!training, ]
recommender_system_testing_data #5493 x 187 rating matrix of class ‘binaryRatingMatrix’ with 43191 ratings.

#[4]
recommender_system_model <- Recommender(data = recommender_system_training_data, 
															method = "IBCF",
															parameter = list(method = "Jaccard"))
recommender_system_model

class(recommender_system_model@model$sim)
dim(recommender_system_model@model$sim)
image(recommender_system_model@model$sim)
range(recommender_system_model@model$sim)
getModel(recommender_system_model)

#[Test]
#dist_test <- as(recommender_system_model@model$sim, "matrix")
#View(dist_test)
#summary(dist_test)


#
##
###
#Test code - remove if necessary
#----- Utilised through the 'Recommender_System_Similarity_Matrix_Modified_RScript.R' RScript -----#

#[3]
trainingModified <- sample(x = c(TRUE, FALSE),
									 size = nrow(nvd2014_2017ColumnsTotalModifiedMatrixBinary),
									 replace = TRUE,
									 prob = c(0.8, 0.2))
summary(trainingModified)
21714 + 5320 #TRUE = 21714 / FALSE = 5320
nvd2014_2017ColumnsTotalModifiedMatrixBinary #27034 x 187 rating matrix of class ‘binaryRatingMatrix’ with 212381 ratings.
recommender_system_training_data_modified <- nvd2014_2017ColumnsTotalModifiedMatrixBinary[trainingModified, ]
recommender_system_training_data_modified #21541 x 187 rating matrix of class ‘binaryRatingMatrix’ with 169190 ratings.
recommender_system_testing_data_modified <- nvd2014_2017ColumnsTotalModifiedMatrixBinary[!trainingModified, ]
recommender_system_testing_data_modified #5493 x 187 rating matrix of class ‘binaryRatingMatrix’ with 43191 ratings.

#[4]
recommender_system_model_modified <- Recommender(data = recommender_system_training_data_modified, 
																				method = "IBCF",
																				parameter = list(method = "Jaccard"))
recommender_system_model_modified

class(recommender_system_model_modified@model$sim)
dim(recommender_system_model_modified@model$sim)
image(recommender_system_model_modified@model$sim)
range(recommender_system_model_modified@model$sim)
getModel(recommender_system_model_modified)

#[Test Modified]
#dist_test_modified <- as(recommender_system_model_modified@model$sim, "matrix")
#View(dist_test_modified)
#summary(dist_test_modified)

###
##
#
