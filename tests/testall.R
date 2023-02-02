library(rda)

## Test balanced.folds
x <- rda:::balanced.folds(iris$Species)
table(iris$Species[x[[1]]])
table(iris$Species[x[[2]]])
x <- rda:::balanced.folds(iris$Species, nfolds=5)
table(iris$Species[x[[1]]])
table(iris$Species[x[[2]]]) 

data(colon)
colon.x <- t(colon.x)
(fit <- rda(colon.x, colon.y, regularization="S"))
(fit <- rda(colon.x, colon.y, regularization="R"))
