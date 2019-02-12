# our own MAGA generator, imitating the @MAGABot1 parody twitter bot, a bot that imitates the "Make America Great Again" slogan

# choosing and displaying a random value 

a<-c(1,2,3,4,5,6)
sample(a, 8, replace=TRUE)

# creating a vector of strings
b<-c("great", "stupid", "wonderful", "fantastic", "dead", "moribund", "green")

# choosing a random string
sample(b, 1, replace = TRUE)

#concatenating (i.e. pasting together) strings 
paste("Make America", sample(b, 1, replace = TRUE), "Again")

# loading vector from a file
# the adjectives in adj.txt were taken from https://www.paperrater.com/page/lists-of-adjectives

setwd("/Users/djw12/Desktop/")
adj_file = "adj.txt"
adj <- scan(adj_file, what="", sep="\n")
paste("Make America", sample(adj, 1), "Again")

# instead of downloading that file to your machine you can load it in from a github repository

adj_git <- "https://raw.githubusercontent.com/djwrisley/IMUH1511/master/Class_5/adj.txt"
adjgit <- scan(adj_git, what="", sep="\n")
paste("Make America", sample(adjgit, 1), "Again")


