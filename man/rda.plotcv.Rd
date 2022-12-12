\name{plot.rdacv}
\alias{plot.rdacv}
\title{A function that plots the result from rda.cv}
\description{Plot the cross validation error matrix and the number of
shrunken gene matrix obtained from RDA cross-validation analysis.
}

\usage{
\method{plot}{rdacv}(x, type=c("both", "error", "gene"), nice=FALSE, ...)
}

\arguments{
  \item{x}{The fit from \code{rda.cv}.}
  \item{type}{A character string specifying what to plot. If 'both',
then heatmaps for both cv error and shrunken genes are plotted; if
'error', only the error map is produced; if 'gene', only the gene
map is produced. This option is useful if users want to generate a
specific plot. Default is 'both'.}
  \item{nice}{A logical flag. If 'TRUE', then 1-dim curves are
plotted instead of heatmaps. This is useful when the length of
alpha or delta is small. Heatmap in this case can be awful-looking.
For example, if alpha=0.5 is a single value, while delta=seq(10),
then both cv error and shrunken genes will be plotted as a 1-dim
function of delta or vice versa when the length of delta is small.}
  \item{\dots}{Additional arguments for generic plot.}
}

\details{
  \code{plot.rdacv} produces two heatmaps for the cross validation
  error matrix and the number of shrunken genes matrix obtained from
  \code{rda.cv}.
}

\value{
  A list of returning values:
  \item{one.se.pos}{A 2-column matrix of the positions of the one standard 
error boundary points on the CV error heatmap. The first column indicates
the alpha positions and the second column for the delta positions.}
  \item{min.cv.pos}{A 2-column matrix of the positions of the minimal CV
error points on the CV error heatmap. The first column indicates
the alpha positions and the second column for the delta positions.}
}

\references{
Guo, Y. et al. (2004) \emph{Regularized Discriminant Analysis and Its
Application in Microarrays}, Technical Report, Department of Statistics,
Stanford University.
}



\author{ Yaqian Guo, Trevor Hastie and Robert Tibshirani  }

\examples{

## These examples will take too long and R CMD check will complain ...
\dontrun{
    data(colon)
    fit <- rda(t(colon.x), colon.y)
    fit.cv <- rda.cv(fit, x=t(colon.x), y=colon.y)
    plot.rdacv(fit.cv)
}
}
