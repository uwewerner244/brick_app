import 'package:brick_app/model/brick_set.dart';
import 'package:brick_app/model/inventory.dart';
import 'package:brick_app/model/rebrickable_model.dart';
import 'package:brick_app/pages/part_list.dart';
import 'package:brick_app/widgets/brick_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider/provider.dart';

import '../mocks.dart';
import '../model/inventory_test.dart';

main() {
  createApp() {
    final RebrickableModel rebrickableModelMock = MockRebrickableModel();
    when(() =>
            rebrickableModelMock.getInventoriesOfSet(setNum: brickSet.setNum))
        .thenAnswer((_) async => inventoryList);
    return ChangeNotifierProvider<RebrickableModel>(
      create: (_) => rebrickableModelMock,
      child: MaterialApp(
        home: PartList(brickSet),
      ),
    );
  }

  group('app bar', () {
    testWidgets('renders correcty', (WidgetTester tester) async {
      await tester.pumpWidget(createApp());

      expect(
          find.descendant(
              of: find.byType(BrickAppBar),
              matching: find.text('Parts of Set: ${brickSet.name}')),
          findsOneWidget);
    });

    testWidgets('renders sort icon', (WidgetTester tester) async {
      await tester.pumpWidget(createApp());

      expect(
          find.descendant(
              of: find.byType(BrickAppBar), matching: find.byIcon(Icons.sort)),
          findsOneWidget);
    });
  });

  group('part list view', () {
    void _checkPosition(int index, String partName) {
      final listTileFinder = find.byType(ListTile);
      expect(
          find.descendant(
              of: listTileFinder.at(index),
              matching: find.text(partName),
              skipOffstage: false),
          findsOneWidget);
    }

    testWidgets('renders list tile for part correctly',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createApp());

        await tester.pump();

        expect(find.text(inventoryList.first.part.name, skipOffstage: false),
            findsNWidgets(2));
        expect(
            find.text('${inventoryList.first.quantity}x', skipOffstage: false),
            findsOneWidget);
      });
    });

    testWidgets('sorts parts correctly depending on quantity',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createApp());

        await tester.pump();

        _checkPosition(0, '4x');
        _checkPosition(1, '3x');

        await tester.tap(find.descendant(
            of: find.byType(BrickAppBar), matching: find.byIcon(Icons.sort)));

        await tester.pump();

        _checkPosition(0, '3x');
        _checkPosition(1, '4x');
      });
    });
  });
}

final BrickSet brickSet = BrickSet.fromJson({
  "set_num": "70672-1",
  "name": "Cole's Dirt Bike",
  "year": 2019,
  "theme_id": 435,
  "num_parts": 221,
  "set_img_url": "https://cdn.rebrickable.com/media/sets/70672-1/12578.jpg",
  "set_url": "https://rebrickable.com/sets/70672-1/coles-dirt-bike/",
  "last_modified_dt": "2019-04-19T17:19:54.565420Z"
});

final List<Inventory> inventoryList = [
  Inventory.fromJson(inventoryJson),
  Inventory.fromJson(inventoryJson..['quantity'] = 4)
];
