% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/givitiCalibrationMain.R
\name{givitiCalibrationTest}
\alias{givitiCalibrationTest}
\title{Calibration Test}
\usage{
givitiCalibrationTest(o, e, devel, subset = NULL, thres = 0.95,
  maxDeg = 4)
}
\arguments{
\item{o}{A numeric vector representing the binary outcomes.
The elements must assume only the values 0 or 1. The predictions
in \code{e} must represent the probability of the event
coded as 1.}

\item{e}{A numeric vector containing the probabilities of the
model under evaluation. The elements must be numeric and between 0 and 1.
The lenght of the vector must be equal to the length of the vector \code{o}.}

\item{devel}{A character string specifying if the model has been fit on
the same dataset under evaluation (\code{internal}) or if the model has
been developed on an external sample (\code{external}). See also the 'Details' section.}

\item{subset}{An optional boolean vector specifying the subset of observations
to be considered.}

\item{thres}{A numeric scalar between 0 and 1 representing 1 - the significance level
adopted in the forward selection. By default is set to 0.95.}

\item{maxDeg}{The maximum degree considered in the forward selection.
By default is set to 4.}
}
\value{
A list of class \code{htest} containing the following components:
\describe{
  \item{statistic}{The value of the test's statistic.}
  \item{p.value}{The p-value of the test.}
  \item{null.value}{The vector of coefficients hypothesized under the null hypothesis,
                    that is, the parameters corresponding to the bisector.}
  \item{alternative}{A character string describing the alternative hypothesis.}
  \item{method}{A character string indicating what type of calibration
                test (internal or external) was performed.}
  \item{estimate}{The estimate of the coefficients of the polynomial logistic
                   regression.}
  \item{data.name}{A character string giving the name(s) of the data.}
}
}
\description{
\code{givitiCalibrationTest} performs the calibration test associated to the
calibration belt.
}
\details{
The calibration belt and the associated test can be used both to evaluate
the calibration of the model in external samples or in the development dataset. However,
the two cases have different requirements. When a model is evaluated on independent
samples, the calibration belt and the related test can be applied whatever is the
method used to fit the model. Conversely, they can be used on the development set
only if the model is fitted with logistic regression.
}
\examples{
#Random by-construction well calibrated model
e <- runif(100)
o <- rbinom(100, size = 1, prob = e)
givitiCalibrationTest(o, e, "external")

#Random by-construction poorly calibrated model
e <- runif(100)
o <- rbinom(100, size = 1, prob = logistic(logit(e)+2))
givitiCalibrationTest(o, e, "external")
}
\seealso{
\code{\link{givitiCalibrationBelt}} and \code{\link{plot.givitiCalibrationBelt}}
 to compute and plot the calibaration belt.
}

