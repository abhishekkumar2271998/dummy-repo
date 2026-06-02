import 'disposable.dart';

///
/// An interface to force implement async [dispose] function.
///
/// Mostly used in services.
///
abstract class AsyncDisposable<T extends Object?>
    implements Disposable<Future<T>> {}
