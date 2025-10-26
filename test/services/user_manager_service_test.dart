import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ai_chat/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('UserManagerServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
