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

# round 1: input set1
df1 <- df_wrd[which(df_wrd$x1 %in% set1),]
print(df1)
s <- as.vector(c(0,0,0,0,0))
s[2] <- length(unique(df1$x2))
s[3] <- length(unique(df1$x3))
s[4] <- length(unique(df1$x4))
s[5] <- length(unique(df1$x5))
request <- which(s==max(s))[1]

#
df2 <- df1[which(df1$x2 %in% set2),]
print(df2)
s <- as.vector(c(0,0,0,0,0))
s[3] <- length(unique(df2$x3))
s[4] <- length(unique(df2$x4))
s[5] <- length(unique(df2$x5))
request <- which(s==max(s))[1]

#
df3 <- df2[which(df2$x3 %in% set3),]
print(df3)
s <- as.vector(c(0,0,0,0,0))
s[4] <- length(unique(df3$x4))
s[5] <- length(unique(df3$x5))
request <- which(s==max(s))[1]
if (max(s) == 1) {
  request <- "stop"
}
