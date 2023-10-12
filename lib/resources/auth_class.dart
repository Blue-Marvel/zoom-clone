import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone/utils/snack_bar.dart';

class AuthMethod {
     static final FirebaseAuth _auth = FirebaseAuth.instance;
     static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Stream<User?> get userState => _auth.authStateChanges();

  static Future<bool> googleSignIn(BuildContext context) async {
    bool res = false;
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user == null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          _firestore.collection('users').doc(user!.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
      }
        res = true;
      // ignore: use_build_context_synchronously
      showSnackBar(context, 'Successfully logged in');
      return res;
    } on FirebaseException catch (e) {
      res = false;
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.message.toString());
    return res;
    }
  }
}
