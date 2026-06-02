typedef AsyncInitializeWith<INPUT extends Object?, OUTPUT extends Object?>
    = Future<OUTPUT> Function(INPUT input);
