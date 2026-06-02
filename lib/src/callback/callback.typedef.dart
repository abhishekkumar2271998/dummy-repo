///
/// Example:
///
///     final Callback<int> callback;
///     ...
///     final output = callback();
///
typedef Callback<OUTPUT extends Object?> = OUTPUT Function();
