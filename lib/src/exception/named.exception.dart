import '../object/identifiable.dart';
import 'exception_severity.enum.dart';

///
/// Wrapper around the built-in [Exception] class.
///
/// Provides more classified details of the exception like [severity].
///
/// Example:
///
///     final exception = NamedException('Provided value is -26 which is negative.');
/// or
///
///     final exception = NamedException(
///       'Provided value is -26 which is negative.'
///       solution: 'Please provide a positive value.'
///       severity: ExceptionSeverity.critical,
///     );
///
class NamedException implements Exception, Identifiable<String> {
  ///
  /// An identifer for the exception.
  /// Default to the class's [runtimeType].
  ///
  String get key => this.runtimeType.toString();

  ///
  /// A more user readable exception name than the [key].
  /// Default to [key] unless otherwise specified.
  ///
  String get name => key;

  ///
  /// [category] is either the super class or this class.
  ///
  Type get category => this.runtimeType;

  ///
  /// Problem statement of the [Exception].
  ///
  /// Example:
  ///
  ///     problem => 'Provided value is -26 which is negative.'
  ///
  final String problem;

  ///
  /// Solution statement of the [Exception].
  ///
  /// Example:
  ///
  ///     solution => 'Please provide a positive value.'
  ///
  final String solution;

  ///
  /// Severity can be none, warning or critical.
  ///
  final ExceptionSeverity severity;

  ///
  /// Complete description of the [Exception].
  ///
  /// Mostly built using [name], [problem] and [solution].
  ///
  String get text =>
      '$name has occured.\n> Problem: $problem\n> Solution: $solution';

  ///
  /// Example:
  ///
  ///     final exception = NamedException('Provided value is -26 which is negative.');
  /// or
  ///
  ///     final exception = NamedException(
  ///       'Provided value is -26 which is negative.'
  ///       solution: 'Please provide a positive value.'
  ///       severity: ExceptionSeverity.critical,
  ///     );
  ///
  const NamedException(
    this.problem, {
    this.solution = '<none>',
    this.severity = ExceptionSeverity.none,
  });

  String toString() => text;
}
