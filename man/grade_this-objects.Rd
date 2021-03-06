% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grade_this.R
\docType{data}
\name{grade_this-objects}
\alias{grade_this-objects}
\alias{.result}
\alias{.user}
\alias{.last_value}
\alias{.solution}
\alias{.user_code}
\alias{.solution_code}
\alias{.envir_prep}
\alias{.envir_result}
\alias{.evaluate_result}
\alias{.label}
\alias{.engine}
\title{Checking environment objects for use in \code{grade_this()}}
\format{
An object of class \code{.result} (inherits from \code{gradethis_placeholder}) of length 0.

An object of class \code{.user} (inherits from \code{.result}, \code{gradethis_placeholder}) of length 0.

An object of class \code{.last_value} (inherits from \code{.result}, \code{gradethis_placeholder}) of length 0.

An object of class \code{.solution} (inherits from \code{gradethis_placeholder}) of length 0.

An object of class \code{.user_code} (inherits from \code{gradethis_placeholder}) of length 0.

An object of class \code{.solution_code} (inherits from \code{gradethis_placeholder}) of length 0.

An object of class \code{.envir_prep} (inherits from \code{gradethis_placeholder}) of length 0.

An object of class \code{.envir_result} (inherits from \code{gradethis_placeholder}) of length 0.

An object of class \code{.evaluate_result} (inherits from \code{gradethis_placeholder}) of length 0.

An object of class \code{.label} (inherits from \code{gradethis_placeholder}) of length 0.

An object of class \code{.engine} (inherits from \code{gradethis_placeholder}) of length 0.
}
\usage{
.result

.user

.last_value

.solution

.user_code

.solution_code

.envir_prep

.envir_result

.evaluate_result

.label

.engine
}
\description{
\code{\link[=grade_this]{grade_this()}} allows instructors to determine a grade and to create custom
feedback messages using custom R code. To facilitate evaluating the
exercise, \code{\link[=grade_this]{grade_this()}} makes available a number of objects that can be
referenced within the \code{{ ... }} expression.

All of the objects provided by \code{learnr} to an exercise checking function
are available for inspection. To avoid name collisions with user or
instructor code, the names of these objects all start with \code{.}.
\itemize{
\item \code{.label}: The exercise label.
\item \code{.engine}: The exercise engine, typically 'r'.
\item \code{.last_value}: The last value returned from evaluating the user's exercise submission.
\item \code{.solution_code}: A string containing the code provided within the \verb{*-solution} chunk for the exercise.
\item \code{.user_code}: A string containing the code submitted by the user.
\item \code{.check_code}: A string containing the code provided within the \verb{*-check} or \verb{*-code-check} chunk for the exercise.
\item \code{.envir_prep}: A copy of the R environment after running the exercise setup code and before the execution of the student's submitted code.
\item \code{.envir_result}: The R environemnt after running the student's submitted code.
\item \code{.evaluate_result}: The return value from the \code{\link[evaluate:evaluate]{evaluate::evaluate()}} function (see learnr's documentation).
}

In addition, \pkg{gradethis} has provided some extra objects:
\itemize{
\item \code{.user}, \code{.result}: The last value returned from evaluating the user's exercise submission.
\item \code{.solution}: The last value returned from evaluating the \code{.solution_code} for the exercise (evaluated in \code{.envir_prep}).
}
}
\keyword{datasets}
