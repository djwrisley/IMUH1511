# exercise adapted from ch 8 of Humanities Data in R (Arnold/Tilton)
# loading the jpeg library for reading jpeg images

library(jpeg)

# reading the image into an array

manga <- readJPEG("a114.jpeg")

# explore the array; can you tell how the image has been turned into numbers? 

class(manga)
dim(manga)
range(manga)

# crop the image by pixels and save it

mangaCrop <- manga[1:130,1:150,]
plot(mangaCrop)
writeJPEG(mangaCrop, "mangaCrop.jpeg")

# rotate the image by changing the array 

mangaRotate <- aperm(a=manga,perm= c(2, 1, 3))
mangaRotate <- mangaRotate[dim(mangaRotate) [1]:1,,]
writeJPEG(mangaRotate,paste0("mangaRotate.jpeg"))

# isolate a color channel 

mangaRed <- manga
mangaRed[,,2:3] <- 0
writeJPEG(mangaRed, "mangaRed.jpeg")
