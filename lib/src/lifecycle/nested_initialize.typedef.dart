import 'initialize.typedef.dart';

typedef NestedInitialize<OUTPUT extends Object?, INNER_OUTPUT extends Object?>
    = OUTPUT Function({Initialize<INNER_OUTPUT> innerInitialize});
