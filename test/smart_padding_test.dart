import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_padding/smart_padding.dart';

void main() {
  group('SmartPadding', () {
    testWidgets('uses all for every side', (tester) async {
      await tester.pumpWidget(SmartPadding(all: 16.0, child: SizedBox()));

      final padding = tester.widget<Padding>(find.byType(Padding));

      expect(padding.padding, EdgeInsets.all(16.0));
    });

    testWidgets('uses horizontal and vertical values', (tester) async {
      await tester.pumpWidget(
        SmartPadding(horizontal: 16.0, vertical: 8.0, child: SizedBox()),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));

      expect(
        padding.padding,
        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      );
    });

    testWidgets('individual sides override axis values', (tester) async {
      await tester.pumpWidget(
        SmartPadding(
          horizontal: 16.0,
          vertical: 8.0,
          left: 24.0,
          bottom: 12.0,
          child: SizedBox(),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));

      expect(
        padding.padding,
        EdgeInsets.only(left: 24.0, right: 16.0, top: 8.0, bottom: 12.0),
      );
    });

    testWidgets('axis values override all', (tester) async {
      await tester.pumpWidget(
        SmartPadding(
          all: 8.0,
          horizontal: 16.0,
          vertical: 12.0,
          child: SizedBox(),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));

      expect(
        padding.padding,
        EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0, bottom: 12.0),
      );
    });

    testWidgets('individual sides override all', (tester) async {
      await tester.pumpWidget(
        SmartPadding(all: 8.0, left: 16.0, bottom: 24.0, child: SizedBox()),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));

      expect(
        padding.padding,
        EdgeInsets.only(left: 16.0, top: 8.0, right: 8.0, bottom: 24.0),
      );
    });

    testWidgets('defaults to zero padding', (tester) async {
      await tester.pumpWidget(SmartPadding(child: SizedBox()));

      final padding = tester.widget<Padding>(find.byType(Padding));

      expect(padding.padding, EdgeInsets.zero);
    });

    testWidgets('resolves each side through the cascading hierarchy', (
      tester,
    ) async {
      await tester.pumpWidget(
        SmartPadding(
          all: 4.0,
          horizontal: 8.0,
          vertical: 12.0,
          left: 16.0,
          bottom: 20.0,
          child: SizedBox(),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));

      expect(
        padding.padding,
        EdgeInsets.only(left: 16.0, right: 8.0, top: 12.0, bottom: 20.0),
      );
    });

    testWidgets('treats zero as an explicit value', (tester) async {
      await tester.pumpWidget(
        SmartPadding(all: 16.0, bottom: 0.0, child: SizedBox()),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));

      expect(
        padding.padding,
        EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0, bottom: 0.0),
      );
    });
  });
}
