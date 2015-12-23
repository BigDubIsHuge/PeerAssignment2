setwd("./UCI HAR Dataset/train/")
subjectTrain <- read.table("subject_train.txt")
trainX <- read.table("X_train.txt")
trainY <- read.table("Y_train.txt")
Train <- cbind(subjectTrain,trainY, trainX)
trainCategory <- rep("Train",nrow(Train))
Train <- cbind(trainCategory,Train)
colnames(Train)[1] <- "Category" 
colnames(Train)[2] <- "ParticipantNumber" 
colnames(Train)[3] <- "Test Label" 

setwd("./../test/")
subjectTest <- read.table("subject_test.txt")
testX <- read.table("X_test.txt")
testY <- read.table("Y_test.txt")
Test <- cbind(subjectTest,testY, testX)
testCategory <- rep("Test",nrow(Test))
Test<- cbind(testCategory,Test)
colnames(Test)[1] <- "Category" 
colnames(Test)[2] <- "ParticipantNumber" 
colnames(Test)[3] <- "Test Label" 

data <- rbind(Train, Test)

setwd("./../")
feature <- read.table("features.txt",stringsAsFactors = FALSE)
meanIndex <- grepl("mean()",feature$V2)
stdIndex <- grepl("std()",feature$V2)
totalIndex <- meanIndex + stdIndex

totalIndex <- as.logical(totalIndex)
temp <- append(c(FALSE,FALSE,FALSE),totalIndex)
colnames(data)[temp] <- feature[totalIndex,2]
totalIndex <- append(c(TRUE,TRUE,TRUE),totalIndex)
data <- data[,totalIndex]

activityName <- read.table("activity_labels.txt")
colnames(activityName)[2] <- "Activity"

data <- merge(activityName,data,by.y = "Test Label", by.x = "V1", all.y = TRUE)
data <- data[,c(-1,-3)]
temp <- ddply(data, .(Activity, ParticipantNumber), numcolwise(mean))
setwd("./../")
write.table(temp,"tidyData.txt",row.names = FALSE)

