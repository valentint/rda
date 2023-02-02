\name{brain}
\docType{data}
\alias{brain}
\title{Brain Cancer Microarray Data}
\description{
The \code{brain} data contains two objects: \code{brain.x}, microarray
expression data for 42 brain cancer samples and \code{brain.y}, the class
labels for these samples.
}
\usage{data(brain)}
\format{
An expression data matrix (42x5597) \code{brain.x} and a class label
vector (42) \code{brain.y} for 42 samples.
}
\details{
\code{brain.y} is the class labels of the 42 samples. \code{brain.x} is
the microarray expression data matrix with each row representing a sample.
}
\source{
Pomeroy, S. et al. (2002) \emph{Prediction of Central Nervous System
Embryonal Tumor Outcome Based on Gene Expression}. Nature, Vol 415,
p436-442.
}
\references{
    Y. Guo, T. Hastie, R. Tibshirani, (2006).
    Regularized linear discriminant analysis and its application in microarrays, 
    \emph{Biostatistics} \bold{8} pp. 86--100.
    \doi{10.1093/biostatistics/kxj035}.
}
\keyword{datasets}
