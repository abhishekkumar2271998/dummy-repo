import 'executable.dart';

///
/// A mixin on [Executable].
///
/// [call] function lets you use classes as methods.
///
/// Example:
///
///     class DeployCommand extends Executable<bool> with CallToExecute {
///
///       final deployService = DeployService();
///
///       @override
///       bool execute() {
///         deployService.validate();
///         deployService.run();
///         return true;
///       }
///     }
///
/// Generally a command is executed like this.
///
///     final cmd = DeployCommand();
///     cmd.execute();
///
/// With [CallToExecute] mixin, you can now execute like this:
///
///     cmd();
///
mixin CallToExecute<OUTPUT extends Object?> on Executable<OUTPUT> {
  ///
  /// Calls the [execute] function.
  ///
  OUTPUT call() => execute();
}
