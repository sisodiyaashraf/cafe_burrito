import 'package:flutter_test/flutter_test.dart';
import 'package:cafe_burrito/app.dart';

void main() {
  testWidgets('Setup check screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CafeBurritoApp());

    expect(find.text('Cafe Burrito'), findsOneWidget);
    expect(find.text('Brew. Wrap. Serve.'), findsOneWidget);
  });
}
