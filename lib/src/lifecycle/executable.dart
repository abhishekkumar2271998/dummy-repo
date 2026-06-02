///
/// An interface to force implement async [execute] function.
///
/// Mostly used in commands.
///
abstract class Executable<OUTPUT extends Object?> {
  OUTPUT execute();
}
