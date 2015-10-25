#1 labels and column 

activity_labels <- read.table("C:/Users/Janainafig/Desktop/Coursera/Dataset/activity_labels.txt")[,2]
features <- read.table("C:/Users/Janainafig/Desktop/Coursera/Dataset/features.txt")[,2]

#2 extract meand and std deviation

extract_features <- grepl("mean|std", features)

#test x and y and extract meand and std
X_test <- read.table("C:/Users/Janainafig/Desktop/Coursera/Dataset/test/X_test.txt")
y_test <- read.table("C:/Users/Janainafig/Desktop/Coursera/Dataset/test/y_test.txt")
subject_test <- read.table("C:/Users/Janainafig/Desktop/Coursera/Dataset/test/subject_test.txt")

names(X_test) = features


X_test = X_test[,extract_features]

# labels

y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Bind data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

# Load X_train and y_train 
X_train <- read.table("C:/Users/Janainafig/Desktop/Coursera/Dataset/train/X_train.txt")
y_train <- read.table("C:/Users/Janainafig/Desktop/Coursera/Dataset/train/y_train.txt")

subject_train <- read.table("C:/Users/Janainafig/Desktop/Coursera/Dataset/subject_train.txt")

names(X_train) = features
