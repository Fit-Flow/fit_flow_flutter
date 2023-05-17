import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_flow_flutter/utils/components/dialogs/snackbar_dialog.dart';
import 'package:get/get.dart';

class AuthenticationViewModel extends GetxController implements GetxService {
  Future<void> createUser(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      Get.offNamed("/dashboard");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        buildErrorSnackBar('Fejl', 'Kodeord er ikke stærkt nok');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        buildErrorSnackBar('Fejl', 'Kontoen findes allerede');
      } else {
        buildErrorSnackBar('Fejl', '${e.message}');
      }
    } catch (e) {
      print(e);
      buildErrorSnackBar('Fejl', '${e}');
    }
  }

  Future<void> login(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      Get.offNamed('/dashboard');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
