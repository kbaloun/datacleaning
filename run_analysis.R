
#1) Merges the training and the test sets to create one data set.
a <- read.table("../UCI_HAR_Dataset/train/subject_train.txt")
b <- read.table("../UCI_HAR_Dataset/test/subject_test.txt")
#subjects <- append(a, b, after=length(a))
subjects <- c(a, b, recursive=TRUE)

a <- read.table("../UCI_HAR_Dataset/train/X_train.txt")
b <- read.table("../UCI_HAR_Dataset/test/X_test.txt")
x <- rbind(a,b)
a <- read.table("../UCI_HAR_Dataset/train/y_train.txt")
b <- read.table("../UCI_HAR_Dataset/test/y_test.txt")
ys <- c(a, b, recursive=TRUE)
activity <- c(1:10299)
full <- cbind(subjects,ys,activity,x)

#xvals <- c(a, b, recursive=TRUE)
# c <- merge.data.frame(a,b)
# that returns an empty frame, maybe since no key

#2) Extracts only the measurements on the mean and standard deviation for each measurement. 

a <- read.table("../UCI_HAR_Dataset/features.txt", sep=" ")
allfeats <- data.table(a)
a <- allfeats[(like(V2,"mean") & !like(V2,"Freq")),]
b <- allfeats[like(V2,"std()"),]
feats <- rbind(a,b)
feats <- feats[order(V1)]
feats$V1 <- paste0("V",feats$V1)

#coalscc <- sccdt[like(Short.Name,"Coal"),SCC]
#feats <- allfeats[allfeats$v2 %in% ("mean", "std")]

#3) Uses descriptive activity names to name the activities in the data set

# correctly fill the ACTIVITY column created in #1
full <- full[sample(1:10299),]; full$activity[full$ys=="1"] = "WALKING"
full <- full[sample(1:10299),]; full$activity[full$ys=="2"] = "WALKING_UPSTAIRS"
full <- full[sample(1:10299),]; full$activity[full$ys=="3"] = "WALKING_DOWNSTAIRS"
full <- full[sample(1:10299),]; full$activity[full$ys=="4"] = "SITTING"
full <- full[sample(1:10299),]; full$activity[full$ys=="5"] = "STANDING"
full <- full[sample(1:10299),]; full$activity[full$ys=="6"] = "LAYING"


#4) Appropriately labels the data set with descriptive variable names. 

fulldf <- data.frame(full)
keepcols <- feats$V1
tightdf <- fulldf[c("subjects","activity",keepcols)]
keepcolnames <- feats$V2
keepcolnames <- as.character(keepcolnames)
colnames(tightdf) <- c("subjects","activity",keepcolnames)

#5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidydt = data.table(tightdf)
coldt = data.table(keepcolnames)
tidycolsdt = coldt[like(keepcolnames,"mean"),]
tidycols <- tidycolsdt$keepcolnames
tidydf <- tightdf[c("subjects","activity",tidycols)]
tidydt <- data.table(tidydf)

setkey(tidydt,subjects,activity)
finaltidydt <- tidydt[, lapply(.SD,mean), by=c("subjects","activity")]
write.table(finaltidydt, file="tidyActivity.txt", row.name=FALSE)
# upload your data set as a txt file 
#   created with write.table() using row.name=FALSE