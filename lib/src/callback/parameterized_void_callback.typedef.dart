///
/// Example:
///
///     final ParameterizedVoidCallback<Exception> exceptionHandler;
///     ...
///     exceptionHandler(exception);
///
typedef ParameterizedVoidCallback<INPUT extends Object?> = void Function(
    INPUT input);
