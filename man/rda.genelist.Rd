\name{genelist.rda}
\alias{genelist.rda}
\title{RDA Shrunken Gene List Function}
\description{
A function that returns the shrunken gene (variable) names by RDA for a
particular (alpha, delta) combination.}
\usage{
genelist.rda(x, y, alpha, delta, prior=table(y)/length(y),
             gnames=NULL, regularization="S")
}

\arguments{
  \item{x}{The training data set for which you want to obtain the
shrunken gene list. It must be a numerical matrix. The columns are sample
observations and the rows are variables.}
  \item{y}{The class labels for the columns of 'x'.}
  \item{prior}{A numerical vector that gives the prior proportion of each
class. By default, it is set to be the sample frequencies unless users
want to specify a different one.}
  \item{alpha}{A single regularization value for alpha. Users must supply
this option.}
  \item{delta}{A threshold value for delta. Users must supply this 
option.}
  \item{gnames}{A character vector that specifies the names of the
variables of the training data set 'x'. By default, it is set to be
\code{NULL} and the function uses either the row names of 'x' (if it
exists) or the row index \code{1:nrow(x)}. Users can provide their
customized gene name list. However, the length of the name vector must be
the same as the number of rows of 'x'.}
  \item{regularization}{The type of regularization. It is either 'S' or
'R'. The default value is 'S'.}
}
\details{
  \code{genelist.rda} will return a vector of names for those shrunken
genes by RDA for a particular (alpha, delta).}

\value{
  A character vector of the names of the shrunken genes. 
}

\references{
Guo, Y. et al. (2004) \emph{Regularized Discriminant Analysis and Its
Application in Microarrays}, Technical Report, Department of Statistics,
Stanford University.
}

\author{ Yaqian Guo, Trevor Hastie and Robert Tibshirani }

\examples{
data(colon)
colon.x <- t(colon.x)
genenames <- genelist.rda(colon.x, colon.y, alpha=0.1, delta=0.3)
}
