///
/// An interface to force implement [dispose] function.
///
/// Mostly used in services.
///
abstract class Disposable<T extends Object?> {
  T dispose();
}
