import 'package:test/test.dart';
import 'package:zam_temp1/zam_temp1.dart';

void main() {
  testObjectAsStreamExtension();
}

void testObjectAsStreamExtension() {
  group('ObjectAsStreamExtension:', () {
    final input = 86;
    final output = input.asStream();

    test('Value 86 is converted to a stream.', () {
      expect(output, emits(86));
    });
  });
}
