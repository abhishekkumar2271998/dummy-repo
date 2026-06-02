import 'named.exception.dart';

typedef ExceptionBuilder<EXCEPTION extends NamedException> = EXCEPTION
    Function();
