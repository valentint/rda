\name{rda}
\alias{rda}
\title{Main RDA Function}
\description{
The function that does RDA analysis on high dimensional data, e.g.,
microarray expression data.
}
\usage{
rda(x, y, xnew=NULL, ynew=NULL, prior=table(y)/length(y),
    alpha=seq(0, 0.99, len=10), delta=seq(0, 3, len=10), 
    regularization=c("S", "R"), genelist=FALSE, trace=FALSE)
}
\arguments{
\item{x}{The training data set. It must be a numerical matrix.
The columns are sample observations and the rows are variables. For
example, in the microarray settings, "x" is the gene expression
matrix with the columns corresponding to the arrays while the rows
corresponding to the genes.}
\item{y}{The class labels of the training samples (columns) in 'x', which
must be consecutive integers starting from 1.}
\item{xnew}{The test data matrix. It has the same structure as 'x'.
The columns are samples and the rows are variables.}
\item{ynew}{The class labels of the test samples. Same requirement as for
'y'.}
\item{prior}{A numerical vector that gives the prior proportion of
each class. Its length is equal to the number of classes. If not 
supplied, it is set to the sample proportions by default.}
\item{alpha}{A numerical vector of the regularization values for alpha.
A single value is allowed. If not supplied, the default one will be used.}
\item{delta}{A numerical vector of the threshold values for delta.
A single value is allowed. If not supplied, the default one will be used.}
\item{regularization}{Define which regularization method to use. 'S'
stands for regularization on covariance; 'R' stands for regularization on
correlation. 'S' is the default option.}
\item{genelist}{A logical flag. If 'TRUE', then the function will return
an array of indices indicating the genes remained for each (alpha, delta)
combination. By default, this is set to 'FALSE'.}
\item{trace}{A logical flag. If 'TRUE', then the intermediate
computation steps will be displayed. Caution: this would lead to a
very long output display. By default, this is set to 'FALSE'.}  
}
\details{
\code{rda} does RDA analysis on high dimensional data. This is the main
function of the package.}
\value{
The function will return an 'rda' object with the following list of
components: 
  \item{alpha}{The vector of the regularization values for alpha used in
the function.}
  \item{delta}{The vector of the threshold values for delta used in the
function.}
  \item{prior}{The vector of the prior proportion of each class used
in the function.}
  \item{error}{The training error matrix. The rows correspond to the
alpha values while the columns correspond to the delta values.} 
  \item{yhat}{A 3-dim array giving the predicted class labels of 'y'.
The first index corresponds to the alpha values while the second index
corresponds to the delta values. The third index is the predicted class
labels for the corresponding samples. However, when the length of alpha or
delta is 1, this could be a 2-dim matrix or even a 1-dim vector.}
  \item{ngene}{The matrix of the number of shrunken genes. The rows
correspond to the alpha values while the columns correspond to the
delta values.}
  \item{centroids}{The group centroids matrix. It has the same number
of rows as 'x' and the number of columns is the total number of classes.
Each column is the centroids vector of the samples within that class.}
  \item{centroid.overall}{A single vector giving the grand mean vector
of all the samples in the 'x' matrix.}
  \item{yhat.new}{A 3-dim array of the predicted class labels for the
columns of 'xnew' if 'xnew' is provided. The first index corresponds to
the alpha values while the second index corresponds to the delta values.
The third index is the predicted class labels for the corresponding
samples. However, when the length of alpha or delta is 1, this can be a
2-dim matrix or even a 1-dim vector.}
  \item{posterior}{A 4-dim array giving the posterior probabilities of
each column of 'xnew' belonging to a class if 'xnew' is provided. The
first index corresponds to the alpha values while the second index
corresponds to the delta values. The third index is the corresponding
columns in 'xnew'. The last index corresponds to different classes.
However, an array of reduced dimensions may be produced if any of these
four indices has length of 1.}
  \item{testerror}{The test error matrix if both \code{xnew} and
\code{ynew} are supplied. The rows correspond to the alpha values
while the columns correspond to the delta values.}
  \item{gene.list}{A 3-dim array giving the indicator whether a gene
is shrunken or not for a particular (alpha, delta) if "genelist" option
is 'TRUE'. '0' means that gene is shrunken while '1' otherwise. The first
two indices correspond to alpha and delta. A reduced-dimensional array is
possible if either alpha or delta is of length 1.}  
  \item{reg}{The type of regularization used in calculation.}
}
\references{
    Y. Guo, T. Hastie, R. Tibshirani, (2006).
    Regularized linear discriminant analysis and its application in microarrays, 
    \emph{Biostatistics} \bold{8} pp. 86--100.
    \doi{10.1093/biostatistics/kxj035}.
}

\author{Yaqian Guo, Trevor Hastie and Robert Tibshirani}
\seealso{
\code{\link{rda.cv}} and \code{\link{predict.rda}}.
}
\examples{
data(colon)
colon.x <- t(colon.x)
fit <- rda(colon.x, colon.y)
}
