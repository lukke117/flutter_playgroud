import 'package:class_example_app/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthenticationWrapper());
  }
}

class AuthenticationWrapper extends StatelessWidget {
  final _authService = AuthenticationService(FirebaseAuth.instance);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: _authService.authStateChanges,
      builder: (context, snapshot) {
        final user = snapshot.data;
        if (user == null) {
          return SignInPage(authService: _authService);
        } else {
          return HomePage(
            authService: _authService,
          );
        }
      },
    );
  }
}

class SignInPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthenticationService authService;

  SignInPage({Key key, this.authService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              authService.signIn(
                email: emailController.text,
                password: passwordController.text,
              );
            },
            child: Text('Sign in'),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final AuthenticationService authService;

  HomePage({Key key, this.authService});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('HOME'),
            ElevatedButton(
              onPressed: () {
                authService.signOut();
              },
              child: Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}