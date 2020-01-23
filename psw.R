library(tidyverse)

f_wrd <- read.csv("pwords", header = FALSE,
                  stringsAsFactors = FALSE)
colnames(f_wrd) <- "base"
set1 <- c("r","q","w","e","k","v")
set2 <- c("k","d","b","h","q","u")
set3 <- c("c","e","d","z","a","o")
set4 <- c("v","w","o","h","m","r")
set5 <- c("z","e","u","j","s","x")

# prep dataframe
df_wrd <- data.frame(x1 = character(0),
                     x2 = character(0),
                     x3 = character(0),
                     x4 = character(0),
                     x5 = character(0),
                     stringsAsFactors = FALSE)
for (i in seq_along(f_wrd$base)) {
  df_wrd[i,] <- NA
  wrd <- f_wrd$base[i]
  wrd <- unlist(strsplit(wrd, ""))
  df_wrd[i,] <- as.character(wrd)
}
df_sel <- df_wrd                                               # setup temp set
v_col <- as.vector(c(0,0,0,0,0))                             # setup col-vector
request <- 1
print(request)

#--------------------
# round 1: input set1
set <- c("r","q","w","e","k","v")               # set needs to be input by user
df_sel <- df_sel[which(df_sel[,request] %in% set),]
v_col[request] <- -1
for (i in c(1:length(v_col))) {
  if (v_col[i] != -1) {
    v_col[i] <- length(unique(df_sel[,i]))
  }
}
if (max(v_col) == 1) {
  request <- "stop"
} else {
  request <- which(v_col == max(v_col))[1]
}
print(df_sel)
print(request)

#--------------------
# round 2: input set2
set <- c("k","d","b","h","q","u")               # set needs to be input by user
df_sel <- df_sel[which(df_sel[,request] %in% set),]
v_col[request] <- -1
for (i in seq_along(v_col)) {
  if (v_col[i] != -1) {
    v_col[i] <- length(unique(df_sel[,i]))
  }
}
if (max(v_col) == 1) {
  request <- "stop"
} else {
  request <- which(v_col == max(v_col))[1]
}
print(df_sel)
print(request)

#--------------------
# round 3: input set3
set <- c("c","e","d","z","a","o")               # set needs to be input by user
df_sel <- df_sel[which(df_sel[,request] %in% set),]
v_col[request] <- -1
for (i in seq_along(v_col)) {
  if (v_col[i] != -1) {
    v_col[i] <- length(unique(df_sel[,i]))
  }
}
if (max(v_col) == 1) {
  request <- "stop"
} else {
  request <- which(v_col == max(v_col))[1]
}
print(df_sel)
print(request)
