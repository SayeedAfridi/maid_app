import 'package:flutter_test/flutter_test.dart';
import 'package:maid/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ActiveCycleViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
