import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pert6/main.dart';

void main() {
  testWidgets('Book list shows and detail opens', (WidgetTester tester) async {

    // Render halaman utama
    await tester.pumpWidget(MaterialApp(home: BookListScreen()));

    // Cek buku pertama tampil di layar
    expect(find.text('Algorithms to Live By'), findsOneWidget);

    // Tap buku pertama
    await tester.tap(find.text('Algorithms to Live By'));
    await tester.pumpAndSettle();

    // Cek halaman detail tampil
    expect(find.text('Title: Algorithms to Live By'), findsOneWidget);

    // Cek tombol Read the book ada
    expect(find.text('Read the book'), findsOneWidget);
  });
}