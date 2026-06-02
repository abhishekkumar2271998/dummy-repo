///
/// Converts any object to a stream.
///
/// Example:
///
///     int age = 48;
///     Stream<int> ageStream = age.asStream();
///
/// or as simple as
///
///     Stream<int> ageStream = 48.asStream();
///
extension ObjectAsStreamExtension<T extends Object?> on T {
  Stream<T> asStream() {
    return Stream.value(this);
  }
}
