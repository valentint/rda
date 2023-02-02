\name{colon}
\alias{colon}
\title{Colon Cancer Microarray Data}
\description{
The \code{colon} data contains two objects: \code{colon.x}, microarray
expression data for 62 colon cancer samples and \code{colon.y}, the class
labels for these samples.
}
\usage{data(colon)}
\format{
An expression data matrix (62x2000) \code{colon.x} and a class label
vector (62) \code{colon.y} for 62 samples.
}
\details{
\code{colon.y} is the class labels of the 62 samples. \code{colon.x} is
the microarray expression data matrix with each row representing a sample.
}
\source{
Alon, U. et al. (1999) \emph{Broad Patterns of Gene Expression Revealed
by Clustering Analysis of Tumor and Normal Colon Tissues Probed by
Oligonucleotide Arrays}. PNAS, Vol 96, p6745-6750. The data set is
available at \url{http://microarray.princeton.edu/oncology/}.
}
\references{
    Y. Guo, T. Hastie, R. Tibshirani, (2006).
    Regularized linear discriminant analysis and its application in microarrays, 
    \emph{Biostatistics} \bold{8} pp. 86--100.
    \doi{10.1093/biostatistics/kxj035}.
}
\keyword{datasets}
