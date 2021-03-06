% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/givitiCalibrationMain.R
\name{givitiCheckData}
\alias{givitiCheckData}
\title{Check of data}
\usage{
givitiCheckData(o, e)
}
\arguments{
\item{o}{A numeric vector representing the binary outcomes.
The elements must assume only the values 0 or 1. The predictions
in \code{e} must represent the probability of the event
coded as 1.}

\item{e}{A numeric vector containing the probabilities of the
model under evaluation. The elements must be numeric and between 0 and 1.
The lenght of the vector must be equal to the length of the vector \code{o}.}
}
\value{
The output is \code{TRUE} if the data do not show any of the
 reported problems. Otherwise, the function returns a string describing the
 problem found.
}
\description{
The function verifies that the data are compatible with the
construction of the calibration belt. In particular,
the function checks that the predictions provided do not
complete separate the outcomes and that at least two events and non-events
are present in the data.
}

