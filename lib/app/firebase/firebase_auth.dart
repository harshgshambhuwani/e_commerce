import 'package:e_commerce/app/data/app_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;
  Future<String?> registrationAPI({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      showToast(message: "Account has been created successfully");

      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast(message: e.code.toString());
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        showToast(message: e.message.toString());

        return 'The account already exists for that email.';
      } else {
        showToast(message: e.message.toString());

        return e.message;
      }
    } catch (e) {
      showToast(message: e.toString());
      return e.toString();
    }
  }

  Future<String?> loginAPI({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      showToast(message: "Login Successful");
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast(message: "No user found for that email.");

        return 'No user found for that email.';
      } else if (e.code == 'wrong-password')
      {
        showToast(message: "Wrong password provided for that user.");

        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

}