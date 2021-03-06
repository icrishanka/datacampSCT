\name{get_arguments}
\alias{get_arguments}
\title{Get the arguments of one or multiple function calls done by a student}
\usage{
get_arguments(fun = NULL, code = DM.user.code)
}
\arguments{
  \item{fun}{String with the name of the function for which
  you want to find the arguments supplied by the student.}

  \item{code}{String with the code submitted by the
  student.  The default is \code{DM.user.code} which
  contains the student code submitted to the DataCamp
  server (automagically).  This means you don't have to
  specify this argument when writing SCTs for
  DataCamp.com.}
}
\description{
Function takes a function name (\code{fun}) and the
submitted student code (\code{code}) as input. For every
time the function was called, it returns the formal and the
actual arguments of that function call.
}
\details{
The ouput is a list and each list item corresponds to a
function call by the student. Each list item contains a
vector with as values the actual arguments and as names the
formal arguments.
}
\examples{
# Student called the plot function once with two arguments:
 DM.user.code = "plot(1:10,col='blue')"
 get_arguments("plot")

 # Student called the plot function twice:
 DM.user.code = "plot(1:10,col='blue');plot(rnorm(100));"
 get_arguments("plot")
}

