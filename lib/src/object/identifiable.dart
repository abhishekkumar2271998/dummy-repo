///
/// Most commonly used interface in classes with keys to identify objects.
/// [key] is supposed to be unique.
/// Can be used in [==] operator and [hashCode] overrides.
///
abstract class Identifiable<T extends Object?> {
  T get key;
}
