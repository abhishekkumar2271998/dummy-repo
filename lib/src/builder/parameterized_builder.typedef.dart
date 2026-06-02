///
/// Example:
///
///     final ParameterizedBuilder<Type, Car> carBuilder;
///     ...
///     final car = carBuilder(HondaCivic);
///
typedef ParameterizedBuilder<INPUT extends Object?, INSTANCE extends Object?>
    = INSTANCE Function(INPUT input);
