readDataSet <- function( x, nameX ) {

        ## Obtain original work directory
        owd <- getwd()
        setwd( x)

        ##Read Subject FILE
        ff <- paste0("subject_", x, ".txt")
        sbjt <- read.table(ff)
        names(sbjt) <- "Subject"
        
        ##Read Subject FILE
        ff <- paste0("y_", x, ".txt")
        yt <- read.table(ff)
        names(yt) <- "Activity"
        
        ## Read X Data
        ff <- paste0("X_", x, ".txt")
        Xt <- read.table(ff)
        names(Xt) <- nameX
        setwd(owd)
        
        Xt <- cbind(yt, Xt)
        Xt <- cbind(sbjt, Xt)
        ### Find std and mean messures
        Xt
}

run_analysis <- function(dsdir = NULL) {
        library(tidyr)
        library(dplyr)
        
        ## Obtain original work directory
        owd1 <- getwd()
        if (!is.null(dsdir)) {
        setwd(dsdir)
        }
        ## Read Features Names 
        fest <- read.table("features.txt")
        actlab <- read.table("activity_labels.txt")
        names(actlab) <- c("Activity", "ActivityLab")
        
        ## Read test and train datasets
        test <- readDataSet("test", fest$V2)
        train <- readDataSet("train", fest$V2)
        
        ## Merge the datasets
        tot1 <- rbind(test, train)
        
        ## Set Activity label
        tot1 <- merge( actlab, tot1, by.y = "Activity", by.x = "Activity")
        tot1 <- select(tot1, -Activity)
        
        ## Find std and mean mesurements
        vstd <- grep("-std\\(\\)", names(tot1))
        vmean <- grep("-mean\\(\\)", names(tot1))
        vtot <- as.numeric(rbind(vstd, vmean))
        
        ## Extracts only the measurements on the mean and standard deviation for each measurement.
        tot <- cbind(tot1[,c(1,2)], tot1[, vtot])
       
        ## Appropriately labels the data set with descriptive variable name
        nm <- names(tot)
        nm <- gsub("[(][)]", "", nm)
        nm <- gsub("^t", "TimeDomain_", nm)
        nm <- gsub("^f", "FrequencyDomain_", nm)
        nm <- gsub("Acc", "Accelerometer", nm)
        nm <- gsub("Gyro", "Gyroscope", nm)
        nm <- gsub("Mag", "Magnitude", nm)
        nm <- gsub("-mean-", "_Mean_", nm)
        nm <- gsub("-std-", "_StandardDeviation_", nm)
        nm <- gsub("-", "_", nm)
        names(tot) <- nm
        ## Change to original Working Directory
        setwd(owd1)
        ## creates a second, independent tidy data set with the average of each variable for each activity and each subject
       sum <- tot %>%
                group_by(ActivityLab, Subject) %>%
              summarise_each(funs(mean) )

        ## Return de DataSet
       sum
        
}