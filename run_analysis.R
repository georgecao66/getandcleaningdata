#Set working directory to inside the unzipd data 
setwd("C:/Users/caozhiy/Documents/data/UCI HAR Dataset")

#Read all needed files into variable. Use read.table because read.csv seems not working for me
actTestData <- read.table("./test/Y_test.txt", header = FALSE)
actTrainData <- read.table("./train/Y_train.txt", header = FALSE)
subTestData <- read.table("./test/subject_test.txt", header = FALSE)
subTrainData <- read.table("./train/subject_train.txt", header = FALSE)
feaTestData <- read.table("./test/X_test.txt", header = FALSE)
feaTrainData <- read.table("./train/X_train.txt", header = FALSE)
feaNames <- read.table("features.txt", header = FALSE)
actNames <- read.table("activity_labels.txt",header = FALSE)

#Combind the activity test and train data and set the column name
allActData <- rbind(actTestData, actTrainData)
names(allActData) < c("activityid")

#Combind the subject test and train data and set the column name
allSubData <- rbind(subTestData, subTrainData)
names(allSubData) <- c("subjectid")

#Combind the feature test and train data and set the column name provided by the features.txt
allFeaData <- rbind(feaTestData, feaTrainData)
names(allFedata <- feaNames$V2

#Now put the subject and activity data to the right of feature data
feaAndSubData <- cbind(allFeaData, allSubData)
allCombinedData <- cbind(feaAndSubData, allActData)

#Find the col row number with contain mean and std and use it the find the full feature col names that contains mean or std
meanAndStdColNum <- grep("mean|std", feaNames$V2)
meanAndStdColNames <- feaNames$V2(meanAndStdColNum, feaNames$V2)

#Compile all the col names we want
allColWanted <- c(as.character(subdataFeatureName), "subjectid", "activityid")

#Subset the data based what we want
allDataWanted <- subset(allCombinedData, select=allColWanted)

#Then join the activity label to ge the description of activity
allDataWantedWithActLabel <- mergedData <- merge(allDataWanted, actNames, by.x="activityid", by.y="V1", all=TRUE)

#Remove the activity id column and rename the activity label to activity
noActIddata <- subset(mergedData, select = -c(activityid))
colnames(noActIddata)[which(names(noActIddata) == "V2")] <- "activity"

#Do some clean up with the colnames
names(noActIddata) <- tolower(names(noActIddata))
names(noActIddata) <- gsub("[()]", "", names(noActIddata))

#write out the file.
write.table(noActIddata, "final.txt", sep="\t", row.name=FALSE)







