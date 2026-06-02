///
/// An interface to force implement [initialize] function.
///
/// Mostly used in services.
///
abstract class Initializable<T extends Object?> {
  T initialize();
}
