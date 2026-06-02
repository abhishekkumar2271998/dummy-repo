///
/// Alias for function that converts a map in to an object.
///
typedef Deserialize<T extends Object?> = T Function(Map<String, Object?> json);
