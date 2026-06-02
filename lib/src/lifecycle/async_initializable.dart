import 'initializable.dart';

///
/// An interface to force implement async [initialize] function.
///
/// Mostly used in services.
///
abstract class AsyncInitializable<T extends Object?>
    implements Initializable<Future<T>> {}
