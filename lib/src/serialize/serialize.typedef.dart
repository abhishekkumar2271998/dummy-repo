///
/// Alias for function that converts a object in to an map.
///
typedef Serialize<T extends Object?> = Map<String, Object?> Function(T item);
