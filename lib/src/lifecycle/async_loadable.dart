import 'loadable.dart';

abstract class AsyncLoadable<T extends Object?> implements Loadable<Future<T>> {
}
