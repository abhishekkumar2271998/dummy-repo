import 'startable.dart';

abstract class AsyncStartable<T extends Object?>
    implements Startable<Future<T>> {}
