import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<String?> register(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return "Success";
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak';
      }
      if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return "Success";
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      }
      if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }
}
