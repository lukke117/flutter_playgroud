import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {

  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return 'Sign in was successful';
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return 'Sign up was successful';
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }
}