import 'runnable.dart';

abstract class AsyncRunnable<T extends Object?> implements Runnable<Future<T>> {
}
