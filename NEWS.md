# gradethis development

* New function: `grade_this(expr)`. Evaluates the expression and returns the first grade that is called or error that is thrown.
* New function: `grade_this_code(correct, incorrect)`. Makes a grade from comparing the user code against the solution code. This is a simplified version of `grade_code()`.
* New function: `code_feedback()`. Compares the user code against the solution code.
* Checking exercise code with blanks, e.g. `____`, now returns clear feedback that students should replace the `____` with code. (#153)
* The `exercise.parse.error` global option now accepts a function with one argument. The function is given the gradethis check environment with an additional `.error` object containing the parse error condition. (#153)
* Improved code feedback for function definitions will detect mistakes in function arguments (#178)
* gradethis now accepts markdown or an htmltools `tags` or a `tagList()` object for feedback messages. Markdown processing is handled via commonmark. Internally, all code feedback messages now use markdown. (#189)

### Breaking changes

* Deprecated `grade_feedback()`
* `graded()` now returns and signals a condition with class `"gradethis_graded"` instead of returning an object with class `"grader_graded"`
* `grade_code()`, `grade_result()`, and `grade_result_strict()` now return a function that accepts checking arguments to be supplied by `grade_learnr()`
* `grade_code()` will now throw an error (rather than returning `NULL`) if no solution code is provided
* `evaluate_condition()` now accepts `last_value` and `env` rather than `grader_args` and `learnr_args`
* `condition()`s now have a class of `"gradethis_condition"`
* gradethis now uses learnr for `random_praise()` and `random_encouragement()`. `random_encourage()` has been soft-deprecated (#183).
* The `gradethis.glue_pipe` option is now called `gradethis.pipe_warning` as it sets the default value of the `pipe_warning()` function. `pipe_warning()` can be included in the glue strings of other messages, such as those set by `gradethis.code.incorrect` (#193).
* The `glue_pipe` argument of `glue_code()` is now deprecated (#193).


### Bug fixes
* Added a `NEWS.md` file to track changes to the package.
