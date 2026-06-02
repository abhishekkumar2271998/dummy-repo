import 'package:test/test.dart';
import 'package:zam_temp1/zam_temp1.dart';

void main() {
  testNamedException();
}

void testNamedException() {
  group('NamedException:', () {
    final exception =
        NamedException('Provided value is -26 which is negative.');

    test('Defaults are set successfully.', () {
      expect(exception.key, 'NamedException');
      expect(exception.name, 'NamedException');
      expect(exception.category, NamedException);
      expect(exception.problem, 'Provided value is -26 which is negative.');
      expect(exception.solution, '<none>');
      expect(exception.severity, ExceptionSeverity.none);
      expect(exception.text,
          '''NamedException has occured.\n> Problem: Provided value is -26 which is negative.\n> Solution: <none>''');
      expect(exception.toString(),
          '''NamedException has occured.\n> Problem: Provided value is -26 which is negative.\n> Solution: <none>''');
    });
  });
  group('NamedException:', () {
    final exception = NamedException(
      'Provided value is -26 which is negative.',
      solution: 'Please provide a positive value.',
      severity: ExceptionSeverity.warning,
    );

    test('Provided values are set successfully.', () {
      expect(exception.problem, 'Provided value is -26 which is negative.');
      expect(exception.solution, 'Please provide a positive value.');
      expect(exception.severity, ExceptionSeverity.warning);
      expect(exception.text,
          '''NamedException has occured.\n> Problem: Provided value is -26 which is negative.\n> Solution: Please provide a positive value.''');
      expect(exception.toString(),
          '''NamedException has occured.\n> Problem: Provided value is -26 which is negative.\n> Solution: Please provide a positive value.''');
    });
  });
}
