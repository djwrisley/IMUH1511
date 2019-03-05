# today is about exploratory data analysis with the corpus you built collectively

install.packages("stylo")
library(stylo)

# let's try stylo with our Harry Potter data first

setwd("/Users/djw12/Downloads/data")

# download the corpus from the class Drive, put it in a folder called corpus
# make sure that everything is named properly: AuthorofText_TitleorKeyword.txt

setwd("/Users/djw12/Downloads/IM 1511 /experiment4")

#let's try a few things.  The stylo command will bring up the GUI

stylo()

# select English, plain text, utf8 (What seems to be the difference between the Englishes?)
# click OK 

# features allow us to change the way that the sampling happens
# statistics allows us to do a consensus version instead of just one set of parameters
# or even a PCA (https://en.m.wikipedia.org/wiki/Principal_component_analysis)
# from Output select loadings and rerun: what did you get? 

# make a copy of the corpus and divide it into two parts according to your own criteria (gender, subject)
# primary_set & secondary_set
# set the working directory

setwd("/Users/djw12/Downloads/IM 1511 /experiment4")

oppose()


