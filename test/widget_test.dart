import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:regression_poc/home/screens/home_screen.dart';
import 'package:regression_poc/login/repositories/auth_repository.dart';
import 'package:regression_poc/login/screens/login_screen.dart';
import 'package:regression_poc/login/services/auth_service.dart';
import 'package:regression_poc/login/services/auth_service_impl.dart';


class MockAuthRepository implements AuthRepository {
  @override
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (email == 'usuario_test' && password == 'contraseña_test') {
      return true;
    }
    return false;
  }
}

void main() {
    setUp(() {
    GetIt.I.reset(); 
    GetIt.I.registerSingleton<AuthRepository>(MockAuthRepository());
    GetIt.I.registerFactory<AuthService>(() => AuthServiceImpl(GetIt.I<AuthRepository>()));
  });

  testWidgets('Debe mostrar los campos de email y contraseña', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    expect(find.byKey(const Key('username')), findsOneWidget);
    expect(find.byKey(const Key('password')), findsOneWidget);
  });

  testWidgets('Debe iniciar sesión exitosamente y navegar a HomeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    await tester.enterText(find.byKey(const Key('username')), 'usuario_test');
    await tester.enterText(find.byKey(const Key('password')), 'contraseña_test');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(); 
    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('Debe mostrar error si las credenciales son incorrectas', (WidgetTester tester) async {

    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );
    await tester.enterText(find.byKey(const Key('username')), 'incorrect@ufrontera.cl');
    await tester.enterText(find.byKey(const Key('password')), 'wrongpassword');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.text('Credenciales incorrectas'), findsOneWidget);
  });

   testWidgets('Debe mostrar CircularProgressIndicator durante el inicio de sesión', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    await tester.tap(find.byType(ElevatedButton));

    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('Debe iniciar sesión exitosamente y navegar a HomeScreen', (WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: LoginScreen(),
    ),
  );

  await tester.enterText(find.byKey(const Key('username')), 'usuario_test');
  await tester.enterText(find.byKey(const Key('password')), 'contraseña_test');
  expect(find.text('Recordar credenciales'), findsOneWidget);
  expect(find.byType(Checkbox), findsOneWidget);
  await tester.tap(find.byType(ElevatedButton));
  await tester.pumpAndSettle(); 


  expect(find.byType(HomeScreen), findsOneWidget);
});

testWidgets('Debe permitir seleccionar y deseleccionar el checkbox Recordar credenciales', (WidgetTester tester) async {

  await tester.pumpWidget(
    const MaterialApp(
      home: LoginScreen(),
    ),
  );


  var checkbox = find.byType(Checkbox);
  expect(tester.widget<Checkbox>(checkbox).value, false);


  await tester.tap(checkbox);
  await tester.pump();

  expect(tester.widget<Checkbox>(checkbox).value, true);
  await tester.tap(checkbox);
  await tester.pump();

  expect(tester.widget<Checkbox>(checkbox).value, false);
});

}