import 'named.exception.dart';

typedef ParameterizedExceptionBuilder<INPUT extends Object?,
        EXCEPTION extends NamedException>
    = EXCEPTION Function(INPUT input);
