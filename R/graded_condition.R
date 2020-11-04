## IF some day that `rlang::return_from()` is removed, the code can be replaced with this tryCatch
## However,
##  * The callstack is not as useful when debugging
##  * Code is not allowed to continue from where the original condition was thrown
##    * (As of writing this comment, this is not needed)


## (if the condition makes it to the top level...)
## print method to override a gradethis_graded condition to have a "friendly" print method
#' @export
conditionMessage.gradethis_graded <- function(c) {
  condition_obj <- c

  if (condition_obj$correct) {
    paste0("Correct: ", as.character(condition_obj$message))
  } else {
    paste0("Incorrect: ", as.character(condition_obj$message))
  }
}

# Turn errors into `fail()`ures
capture_errors <- function(expr, on_error = NULL) {
  if (is.null(on_error)) {
    on_error <- function(e, that_env) {
      # TODO DELETE
      print("turning error into failure")
      utils::str(e)
      # END TODO DELETE
      # must wrap in ignore statement to retrieve fail object
      ret <- capture_graded({
        fail(conditionMessage(e))
      })
      rlang::return_from(that_env, ret)
    }
  }
  stopifnot(is.function(on_error))

  this_env <- rlang::current_env()
  withCallingHandlers(
    error = function(e) {
      on_error(e, this_env)
    },
    expr
  )
}

## This function solves the situation of trying to execute a "single line of code" code block
## Because the gradethis condition is "thrown", the code block will return when the first condition is received
## Ex:
# {
#   pass_if_throw(1)
#   pass_if_throw(2)
#   pass_if_throw(3)
# }
capture_graded <- function(expr, on_graded = NULL) {
  if (is.null(on_graded)) {
    on_graded <- function(gc_obj, that_env) {
      rlang::return_from(that_env, gc_obj)
    }
  }
  stopifnot(is.function(on_graded))

  this_env <- rlang::current_env()
  withCallingHandlers(
    gradethis_graded = function(gc_obj) {
      on_graded(gc_obj, this_env)
    },
    expr
  )
}
ignore_graded <- function(expr) {
  withCallingHandlers(
    gradethis_graded = function(gc_obj) {
      # do nothing
    },
    expr
  )
}

# helper method to evaluate an expr
# will capture errors and turn them into `failure("message")`
#
#' @export
eval_gradethis_expr <- function(expr, on_error = NULL) {
  capture_graded({
    capture_errors(expr, on_error = on_error)
  })
}