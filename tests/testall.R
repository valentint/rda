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

set.seed(1)
fit <- rda(colon.x, colon.y)
try(fit.cv <- rda.cv(x=colon.x, y=colon.y))
(fit.cv <- rda.cv(fit, x=colon.x, y=colon.y))
fit.cv <- rda.cv(fit, x=colon.x, y=colon.y, folds=rda:::balanced.folds(colon.y))
try(plot.rdacv(1))
plot.rdacv(fit.cv, type="both")
plot.rdacv(fit.cv, type="gene")
plot.rdacv(fit.cv, type="error")

## divide the data set into a training set and a test
## set using a ratio of 2:1.
tr.index <- sample(1:62, 40)
fit <- rda(colon.x[, tr.index], colon.y[tr.index])

## predict the class labels of the test set at alpha=0.1
## and delta=0.5
ynew <- predict(fit, x=colon.x[, tr.index], y=colon.y[tr.index], 
                xnew=colon.x[, -tr.index], alpha=0.1, delta=0.5)

try(ynew <- rda:::predict.rda())
try(ynew <- predict(fit))
try(ynew <- predict(fit, x=colon.x[, tr.index], y=colon.y[tr.index], xnew=colon.x[, -tr.index], type="class"))
try(ynew <- predict(fit, x=colon.x[, tr.index], y=colon.y[tr.index], xnew=colon.x[, -tr.index], type="posterior"))
try(ynew <- predict(fit, x=colon.x[, tr.index], y=colon.y[tr.index], xnew=colon.x[, -tr.index], type="nonzero"))
