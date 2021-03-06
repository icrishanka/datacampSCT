\name{function_has_arguments}
\alias{function_has_arguments}
\title{Check whether a student called a function with the correct formal arguments or actual arguments}
\usage{
function_has_arguments(fun = NULL, args = NULL, values = NULL,
  eval = NULL, code = DM.user.code)
}
\arguments{
  \item{fun}{String with the name of the function. E.g.
  "plot".}

  \item{args}{A character vector with the names of the
  formal arguments a student should have assigned a value
  to when calling the function \code{fun}.}

  \item{values}{The values a student should have assigned
  to the arguments specified in the argument \code{args}
  (in other words: the actual arguments). The values should
  be supplied in the order corresponding to the order of
  \code{args}.}

  \item{eval}{A logical vector specifying whether the
  corresponding value in the \code{values} arguments should
  be evaluated when testing whether a student did the
  function call.}

  \item{code}{The string containing the code submitted by
  the user. The default is \code{DM.user.code} which
  contains the student code submitted to the DataCamp
  server (automagically). This means you don't have to
  specify this argument when writing SCTs for
  DataCamp.com.}
}
\description{
This function is the key component of many more advanced
Submission Correctness Tests. We use the terms "formal
arguments" and "actual arguments" (read
\url{http://adv-r.had.co.nz/Functions.html#function-arguments}
if you are not familiar with those terms). The function
returns the number of times the function call you specify
was done in the student code. The function can be used in a
"layered fashion". Have a look at the examples to
understand the different use cases. You can either check
whether the student assigned "something" to the formal
arguments or you can check whether the student used the
correct actual arguments. In the latter case, you can
compare what was supplied to the actual arguments either as
a string or after evaluating it.  Have a look at the
examples in case this is unclear.
}
\examples{
# When student submits incorrect code function_has_arguments returns false
 code_with_error = "mean(x);plot(xasdfasb,a;mean(x)"
 function_has_arguments("plot", code = code_with_error)

 # When you check the existence of formal arguments in a function, it returns them correctly:
 code2 = "plot(rnorm(10),pch=16,xlab='test');plot(rnorm(100));plot(x~y)"
 function_has_arguments("plot","x",code=code2) # 3 occurences
 function_has_arguments("plot",c("x","xlab"),code=code2) # 1 occurence

 # When you specify the arguments of a function explicitly without evaluation:
 code3 = "plot(rnorm(100),pch=16,xlab='test');plot(x~y);mean(x);hist(mean(rnorm(100)))";
 x = y = 1:10;
 function_has_arguments("plot","x","rnorm(100)",code=code3) # one occurence
 function_has_arguments("plot","x","x ~ y",code=code3) # one occurence
 function_has_arguments("hist","x","mean(rnorm(100))",code=code3) # one occurence
 function_has_arguments("plot",c("x","pch","xlab"),c("rnorm(100)","16","test"),code=code3)
 function_has_arguments("plot",c("x","pch","xlab"),c("rnorm(100)","14","test"),code=code3)

 # When you specify the arguments of a function explicitly with evaluation:
 x = y = 1:10;
 my_test=label="test";
 code4 = "plot(1:20,pch=16,xlab=label,ylab='saywhat');plot(x);plot(x~y);mean(x);hist(mean(1:10))";
 function_has_arguments("plot","xlab","my_test",eval=TRUE,code=code4)
}

