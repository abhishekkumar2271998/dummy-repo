import 'stoppable.dart';

abstract class AsyncStoppable<T extends Object?>
    implements Stoppable<Future<T>> {}
