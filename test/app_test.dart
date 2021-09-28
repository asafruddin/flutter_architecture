import 'package:flutter_test/flutter_test.dart';
import 'package:try_starter/app/app.dart';
import 'package:try_starter/presentation/login/login_page.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(LoginScreen), findsOneWidget);
    });
  });
}
