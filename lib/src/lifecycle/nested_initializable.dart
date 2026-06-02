import 'initialize.typedef.dart';

abstract class NestedInitializable<OUTPUT extends Object?,
    INNER_OUTPUT extends Object?> {
  OUTPUT initialize({Initialize<INNER_OUTPUT> innerInitialize});
}
