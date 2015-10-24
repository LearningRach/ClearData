library(reshape2)

# Load files and datasets
activityLabels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
train <- read.table("train/X_train.txt")[features_w]
tr_Activities <- read.table("train/Y_train.txt")
tr_Subjects <- read.table("train/subject_train.txt")
test <- read.table("test/X_test.txt")[features_w]
testActivities <- read.table("test/Y_test.txt")
testSubjects <- read.table("test/subject_test.txt")

#extract only column wanted
activityLabels[,2] <- as.character(activityLabels[,2])
features[,2] <- as.character(features[,2])
train <- cbind(tr_Subjects, tr_Activities, train)
test <- cbind(testSubjects, testActivities, test)

# Extract mean and standard deviation for each measurement
features_w <- grep(".*mean.*|.*std.*", features[,2])
features_w.names <- features[features_w,2]
features_w.names = gsub('-mean', 'Mean', features_w.names)
features_w.names = gsub('-std', 'Std', features_w.names)
features_w.names <- gsub('[-()]', '', features_w.names)

# merge datasets and add labels
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", features_w.names)

# create factors
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
allData$subject <- as.factor(allData$subject)
allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

#write results into text file
write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
