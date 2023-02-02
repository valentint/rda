rda <- function(x, y, xnew=NULL, ynew=NULL, prior=table(y)/length(y),
                alpha=seq(0, 0.99, len=10), delta=seq(0, 3, len=10),
                regularization=c("S", "R"), genelist=FALSE, trace=FALSE)
{
    this.call <- match.call()
    regularization <- match.arg(regularization)

    ## Check arguments: alpha. delta, x and y must be numeric
    tmp <- if(regularization == "S")
            rda1(x=x, y=y, xnew=xnew, ynew=ynew, prior=prior, alpha=alpha, delta=delta,
                genelist=genelist, trace=trace)
        else if(regularization == "R")
            Drda1(x=x, y=y, xnew=xnew, ynew=ynew, prior=prior, alpha=alpha, delta=delta,
                genelist=genelist, trace=trace)
        else stop("Regularization argument must be either 'S' or 'R'. ")

    tmp$call <- this.call
    tmp$reg <- regularization
    class(tmp) <- "rda"
    tmp
}
