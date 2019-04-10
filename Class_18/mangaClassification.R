
# adapted from https://www.r-bloggers.com/flag-space-a-scatter-plot-of-raster-images/ | https://gist.github.com/dsparks/3886739#file-raster_scatter-r
# images should be all png, preferably no black and white

# installing needed packages

doInstall <- TRUE  # Change to FALSE if you don't want packages installed.
toInstall <- c("png", "devtools", "MASS", "RCurl")
if(doInstall){install.packages(toInstall, repos = "http://cran.r-project.org")}
lapply(toInstall, library, character.only = TRUE)

source_gist("818983")
source_gist("818986")

# read in a list of the files. This can be made easily with cmd+C inside the folder

mangafiles <- "/Users/djw12/Desktop/mangafiles.txt"
pngfiles <- scan(mangafiles, what="", sep="\n")

# read in the png files

setwd("/Users/djw12/Downloads/mangapng")
pngList <- list()
for(ii in 1:length(pngfiles)){
  tempName <- paste("Manga", ii)
  tempPNG <- readPNG(pngfiles[ii])  # Downloads & loads PNGs
  pngList[[tempName]] <- tempPNG  # And assigns them to a list.
}

# calculating the average red, green, and blue values for all pixels in each.

meanRGB <- t(sapply(pngList, function(ll){
  apply(ll[, , -4], 3, mean)
}))

# The dimensions of each item are equal to the pixel dimensions of the .PNG

MangaDimensions <- t(sapply(pngList, function(ll){
  dim(ll)[1:2]
}))

# Using non-metric multidimensional scaling (MDS) to put similarly-colored flags 
# in similar locations in a two-dimensional space
# https://en.wikipedia.org/wiki/Multidimensional_scaling

MangaDistance <- dist(meanRGB)
MangaDistance[MangaDistance <= 0] <- 1e-10

MDS <- isoMDS(MangaDistance)$points
plot(MDS, col = rgb(meanRGB), pch = 20, cex = 2)

# visualize the scatter plot with the raster images included in 2 dimensional space

boxParameter <- 15000   # To alter dimensions of raster image bounding box
par(bg = gray(8/9))
plot(MDS, type = "n", asp = 1)
for(ii in 1:length(pngList)){  # Go through each manga
  tempName <- rownames(MDS)[ii]
  Coords <- MDS[tempName, 1:2]  # Get coordinates from MDS
  Dims <- MangaDimensions[tempName, ]  # Get pixel dimensions
  rasterImage(pngList[[tempName]],  # Plot each manga with these boundaries:
              Coords[1]-Dims[2]/boxParameter, Coords[2]-Dims[1]/boxParameter,
              Coords[1]+Dims[2]/boxParameter, Coords[2]+Dims[1]/boxParameter)
}

