import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:real_landlords_for_students/app.dart';

void main() {
  testWidgets('App starts on the welcome screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));

    expect(find.text('Find a room.\nKnow who you rent from.'), findsOneWidget);
    expect(find.textContaining('landlords in Tashkent'), findsOneWidget);
  });
}
