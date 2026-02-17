import 'package:flutter_test/flutter_test.dart';
import 'package:school_management_app/main.dart';

void main() {
  testWidgets('Affiche le titre principal', (tester) async {
    await tester.pumpWidget(const SchoolManagementApp());

    expect(find.text('Gestion de Scolarité'), findsOneWidget);
    expect(find.text('Plateforme école ↔ parents'), findsOneWidget);
  });
}
