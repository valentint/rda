\name{predict.rda}
\alias{predict.rda}
\title{RDA Prediction Function}
\description{
A function that predicts the class labels for new samples using RDA.
}
\usage{
\method{predict}{rda}(object, x, y, xnew, prior, alpha, delta,
            type=c("class", "posterior", "nonzero"),
            trace=FALSE, ...)
}

\arguments{
  \item{object}{An \code{rda} fit object obtained from the function
\code{rda}.}
  \item{x}{The training data matrix as used in the 'fit' object.}
  \item{y}{The class labels for the columns of 'x' as used in the
'fit' object.}
  \item{xnew}{The new data matrix used to predict the class labels of the
new samples. Must be a numerical matrix with rows corresponding to
variables and columns corresponding to the samples. The number of rows
must be the same as 'x'.}
  \item{prior}{A numerical vector that gives the prior proportion of
each class. By default, it is set to the \code{fit} component from the
training step unless users want to specify a new one for prediction.}
  \item{alpha}{A particular regularization value for alpha. Often, this
is the optimal alpha value obtained from the cross-validation step.
But it could be any other value that users set. A vector of values is also
acceptable. If missing, the function will use the default values from
the \code{fit} component.}
  \item{delta}{A particular threshold value for delta. Often, this is
the optimal delta value obtained from the cross-validation step. But
it could be any other value that users set. A vector of values is also
acceptable. If missing, the function will use the default values from 
the \code{fit} component.}
  \item{type}{A character string specifying which type of prediction
is desired. If 'class', then the predicted class labels are returned;
if 'posterior', then the predicted posterior probabilities for each
sample belonging to a class are returned; if 'nonzero', then the
indicators of shrunken genes are returned. 'class' is the default value.}
  \item{trace}{A logical flag indicating whether the intermediate steps
should be printed.}
  \item{\dots}{Additional arguments for generic predict.}
}
\details{
\code{predict.rda} does various predictions on the new test samples
based on fit from the training samples.
}
\value{
If option "type='class'", the function will return the predicted class
labels for the new test samples. The format is a 3-dim array. The first
index corresponds to the alpha value(s) while the second index corresponds
to the delta value(s). The last index is the predicted labels for the
new samples. A reduced-dimensional array is possible if the length of
alpha or delta is 1.

If option "type='posterior'", the function will return the predicted
posterior probabilities of the new test samples belonging to different
classes. The format is a 4-dim array. The first index corresponds to the
alpha value(s) while the second index corresponds to the delta value(s).
The third index represents the samples in 'xnew'. The last index is the
class labels. A reduced-dimensional array is possible if the length of
alpha or delta is 1.

If option "type='nonzero'", the function will return a 3-dim indicator
array of the shrunken genes by RDA with 3 indices corresponding to alpha,
delta and the indices of the genes respectively. A reduced-dimensional
array is possible if the length of alpha or delta is 1.
}
\references{
Guo, Y. et al. (2004) \emph{Regularized Discriminant Analysis and Its
Application in Microarrays}, Technical Report, Department of Statistics,
Stanford University.
}
\author{Yaqian Guo, Trevor Hastie and Robert Tibshirani}
\seealso{
Also see \code{\link{rda}} and \code{\link{rda.cv}}.
}
\examples{
data(colon)
colon.x <- t(colon.x)

## divide the data set into a training set and a test
## set using a ratio of 2:1.
tr.index <- sample(1:62, 40)
fit <- rda(colon.x[, tr.index], colon.y[tr.index])

## predict the class labels of the test set at alpha=0.1
## and delta=0.5
ynew <- predict(fit, x=colon.x[, tr.index], y=colon.y[tr.index], 
                xnew=colon.x[, -tr.index], alpha=0.1, delta=0.5)

## calculate the prediction error
sum(ynew != colon.y[-tr.index])
}
