# Loading matlab data
library(R.matlab)

# These are the 3D coordinates of the surrogate plot.
input.data<-readMat("input_resampled.mat")  
# input.data[["input"]] is a 9261x3 matrix: [,1] is x, [,2] is y, and [,3] is z.

# These are the values of the scalar surrogate plot.
fmat.data<-readMat("clcd_resampled_long.mat")
# fmat.data[["fmat"]] is a 9261x1 vector which are the scalar values, each row corresponds to the 3D
# coordinates in input.data[["input"]]. 

# I'd ultimately like to have a vector of positions [n, 3] like this, 
# where I'm generating 100 random positions within the input space:
n <- 100
dots<-matrix(data=0,nrow=n,ncol = 3)
dots[,1] <- runif(n,min=min(input.data[["input"]][,1]),max=max(input.data[["input"]][,1]))
dots[,2] <- runif(n,min=min(input.data[["input"]][,2]),max=max(input.data[["input"]][,2]))
dots[,3] <- runif(n,min=min(input.data[["input"]][,3]),max=max(input.data[["input"]][,3]))

# I'd like to search for the indices within input.data[["input"]] that correspond to the 2 or 3 closest 
# input values to each dot position.
# Then I'd use those indices to select the scalar value of the closest positions in 
# fmat.data[["fmat"]].

# Right now, each point gets its own list, which probably won't work long-term for the data set I 
# want to use (the surrogate function it has 201^3 points and I'd like to run it with between 
# 10,000 and 100,000 dots). 
# It would be great if each coordinate could have its own element of the list, like this: 
new.input<-list(input.data[["input"]][,1],input.data[["input"]][,2],input.data[["input"]][,3])
names(new.input)<-c("x","y","z")
# And calling the function would look like:
ans<-GetNeighbors(new.input, dots, 3)
# I could use ans in fmat to return values: 
fmat.values<-fmat.data[["fmat"]][ans]
# What do you think? Everything is flexible. 

