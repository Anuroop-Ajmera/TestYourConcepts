library(dplyr) # for glimpse etc.
#library(tidyr) # for drop_na etc.
library(funModeling) # for df_status etc.


#a)

# As a starting configuration is a subset of 3 starting points out of 6 from S,
# total number of starting configurations would be C(6,3)

choose(6,3)
# Result is 20

#b)

library(gtools)

combinations(6, 3, letters[1:6], set=TRUE, repeats.allowed=FALSE)

a <- c(0,0)
b <- c(8,0)
c <- c(16,0) 
d <- c(0,6)
e <- c(8,6) 
f <- c(16,6)

x<-c(0,8,16,0,8,6)
y<-c(0,0,0,6,6,6)
df <- data.frame(x,y)



my_cent1 <- matrix(c(0,8,16,0,0,0), 3, 2)
my_cent2 <- matrix(c(0,8,0,0,0,6), 3, 2)
my_cent3 <- matrix(c(0,8,8,0,0,6), 3, 2)
my_cent4 <- matrix(c(0,8,16,0,0,6), 3, 2)
my_cent5 <- matrix(c(0,8,0,0,0,6), 3, 2)
my_cent6 <- matrix(c(0,16,8,0,0,6), 3, 2)
my_cent7 <- matrix(c(0,16,16,0,0,6), 3, 2)
my_cent8 <- matrix(c(0,0,8,0,6,6), 3, 2)
my_cent9 <- matrix(c(0,0,16,0,6,6), 3, 2)
my_cent10 <- matrix(c(0,8,16,0,6,6), 3, 2)
my_cent11<- matrix(c(8,16,0,0,6,6), 3, 2)
my_cent12<- matrix(c(8,16,8,0,0,6), 3, 2)
my_cent13<- matrix(c(8,16,16,0,0,6), 3, 2)
my_cent14<- matrix(c(8,0,8,0,0,6), 3, 2)
my_cent15<- matrix(c(8,0,16,0,6,6), 3, 2)
my_cent16<- matrix(c(8,8,16,0,6,6), 3, 2)
my_cent17<- matrix(c(16,0,8,0,6,6), 3, 2)
my_cent18<- matrix(c(16,0,16,0,6,6), 3, 2)
my_cent19<- matrix(c(16,8,16,0,6,6), 3, 2)
my_cent20<- matrix(c(0,8,16,6,6,6), 3, 2)


my_centre <- list(my_cent1,my_cent2,my_cent3,my_cent4,my_cent5,my_cent6,my_cent7,my_cent8,
                my_cent9,my_cent10,my_cent11,my_cent12,my_cent14,my_cent15,my_cent16,my_cent17,my_cent20)

max_iter <- 10
my_df <- df
for (outer in 1:16){
  
  for (inner in 1:max_iter){
    tryCatch({
      #dfCluster <- kmeans(df,centers = my_centres'i', iter.max = max_iter)
      tryCatch({dfCluster <- kmeans(df,centers = my_centre[[outer]], iter.max = max_iter)},
               warning = function(e) "Caught error")
      
      done <- TRUE
    }, 
    warning=function(w) {done <- FALSE})
    plot(df[,1], df[,2], col=dfCluster$cluster,pch=19,cex=2, main=paste("iter",inner))
    points(dfCluster$centers,col=1:5,pch=3,cex=3,lwd=3)
    if(done) break
  }
  #print("inner loop ran ",inner," times"
  print(paste0("inner loop ran ",inner," times"))
  centroid <- dfCluster$cluster
  my_df[ , paste0("centroid", outer)]<- centroid
}

my_df

#> my_df
#x y centroid1 centroid2 centroid3 centroid4 centroid5 centroid6 centroid7 centroid8 centroid9
#1  0 0         1         1         1         1         1         1         1         1         1
#2  8 0         2         3         3         2         3         3         3         2         1
#3 16 0         3         2         2         3         2         2         2         3         3
#4  0 6         1         1         1         1         1         1         1         1         2
#5  8 6         2         3         3         2         3         3         3         2         2
#6  6 6         2         3         3         2         3         3         3         2         2
#centroid10 centroid11 centroid12 centroid13 centroid14 centroid15 centroid16
#1          1          3          1          2          2          1          2
#2          2          1          1          3          1          1          3
#3          3          2          2          1          3          3          1
#4          1          3          3          2          2          2          2
#5          2          1          3          3          1          2          3
#6          2          1          3          3          1          2          3


# Above iteration shows that we have got stable cluster when we took starting points as 
# Cluster partition is: {a,d}, {b,e,f} and {c}
# Cluster partition is: {a,b}, {d,e,f} and {c}
# 16 centroids were taken out of 20 because other 4 were resulting in empty clusters

##c)
# 13 starting configurations are leading to stable partition {a,d}, {b,e,f} and {c}
# 3 starting configurations are leading to stable partition {a,b}, {d,e,f} and {c}


##d)
#It took maximum of 1 iteration for each configuration to reach stable partition.

