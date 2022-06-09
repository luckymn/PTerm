#######################################################################################################
###Lasso
###load package
library("glmnet")

cv.out_lasso = cv.glmnet(as.matrix(x[,-1]),x[,1],alpha=1,family="binomial")

bestlam = cv.out_lasso$lambda.min

out2 = glmnet(x[,-1],x[,1], alpha=1, family = "binomial")

plot(out2, xvar = "lambda", label = TRUE)

lasso.coef = predict(out2,type="coefficients",s=bestlam)

lasso.coef[lasso.coef!=0]

########################################################################################################
###SVM
###load package
library("e1071")

svm_kernel <- "linear" 
svm_type <- "C-classification" 

##train the model
svm_model<- svm(data,label,type=svm_type,kernel=svm_kernel,class.weights=w) 

##predict
predtempT <- predict(svm_model,data_svm[,using_col])
########################################################################################################

###LDA
###load package
library("MASS")      

###train the model
LDA_model<- lda(as.matrix(data,label,tol=F,CV=TRUE)

###preidct
predtempT <- predict(LDA_model,data)$class

########################################################################################################

###LR
###train the model
LR_model<- glm(Type~.,family=binomial(link=logit),data=Train)

###preidct
predtempT <- predict(LR_model,type='response', newdata=Train)

