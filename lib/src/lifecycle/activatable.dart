abstract class Activatable<T extends Object?> {
  bool get isActive;

  ///
  /// Sets [isActive] flag.
  ///
  T activate();

  ///
  /// Unsets [isActive] flag.
  ///
  T deactivate();
}
