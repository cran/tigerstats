% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chisqtestGC.R
\name{chisqtestGC}
\alias{chisqtestGC}
\title{Chi-Square Test (GC version)}
\usage{
chisqtestGC(x, data = parent.frame(), p = NULL, graph = FALSE,
             simulate.p.value = FALSE, B = 2000, verbose = TRUE)
}
\arguments{
\item{x}{Could be a formula.  If so, either ~var (for goodness of fit) or ~var1+var2 (for test for association).
Otherwise either a table, matrix or vector of summary data.}

\item{data}{dataframe supplying variables for formula x.  If variables in x are not found in the data,
then they will be searched for in the parent environment.}

\item{p}{For goodness of fit, a vector of probabilities.  This will be automatically scaled so as to sum
to 1.  Negative elements result in an error message.}

\item{graph}{produce relevant graph for P-value (chi-square curve or histogram of simulation results).}

\item{simulate.p.value}{If FALSE, use a chi-square distribution to estimate the P-value.  Other possible
values are "random" and "fixed" and TRUE.  Random effects are suitable for resampling when the data are a random
sample from a population.  Fixed effects assume that the values of the explanatory variable (row variable for table,
var1 in formula ~var1+var2) remain fixed in resampling, and values of response variable are random with null
distribution estimated from the data.  When set to TRUE, we implement an equivalent to R's routine.  
In our view procedure is
most suitable when the data come from a randomized experiment in which the treatment groups are
the values of the explanatory variable.}

\item{B}{number of resamples to take.}

\item{verbose}{If TRUE, include lots of information in the output.}
}
\value{
an object of class GCchisqtest
}
\description{
Perform chi-square test, either goodness of fit or test for association.  Enter either
formula-data input or a summary table.  Simulation is optional.
}
\examples{
#Goodness of fit test for one factor variable:
chisqtestGC(~seat,data=m111survey,p=c(1/3,1/3,1/3))

#Test for relationship between two factor variables:
chisqtestGC(~sex+seat,data=m111survey)

#You can input a two-way table directly into chisqtestGC():
SexSeat <- xtabs(~sex+seat,data=m111survey)
chisqtestGC(SexSeat)

#Several types of simulation are possible, e.g.:
chisqtestGC(~weather+crowd.behavior,data=ledgejump,simulate.p.value="fixed",B=2500)

#For less ouptut, set argument verbose to FALSE:
chisqtestGC(~sex+seat,data=m111survey,verbose=FALSE)
}
\author{
Homer White \email{hwhite0@georgetowncollege.edu}
}
