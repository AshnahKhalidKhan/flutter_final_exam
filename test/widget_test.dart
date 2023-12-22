// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:flutter_final_exam/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_exam/Core/Repository/product_repository.dart';
import 'package:flutter_final_exam/Core/network.dart';
import 'package:flutter_final_exam/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:http/http.dart' as http;

void main() async
{
  final DataRepository dataRepository = DataRepository
  (
    dataAPIClient: DataAPIClient(httpClient: http.Client()),
    firebaseFirestore: FirebaseFirestore.instance
  );

  setUpAll(() => {loadAppFonts()});
  testGoldens
  (
    'DeviceBuilder - checkinggggg', //Sir ki file
    (tester) async
    {
      final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios
      (
        devices:
        [
          Device.phone
        ]
      )
      ..addScenario
      (
        widget: MyApp(dataRepository: dataRepository),
        name: 'First Test Page',
      );

      await tester.pumpDeviceBuilder //app par device ko bana deta hai
      (
        builder,
        wrapper: materialAppWrapper
        (
          theme: ThemeData.light(),
          platform: TargetPlatform.android
        )
      );

      await screenMatchesGolden(tester, 'HELLLOOOOOOO_first_screenshot');
    }
  );
}