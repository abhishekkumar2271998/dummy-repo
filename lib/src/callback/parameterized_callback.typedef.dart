///
/// Example:
///
///     final ParameterizedCallback<double, int> roundOffStrategy;
///     ...
///     final price = roundOffStrategy(8.458);
///
typedef ParameterizedCallback<INPUT extends Object?, OUTPUT extends Object?>
    = OUTPUT Function(INPUT input);
