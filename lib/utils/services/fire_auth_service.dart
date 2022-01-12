import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireAuthService {
  FireAuthService(this.auth);

  final FirebaseAuth auth;
  GoogleSignIn? _googleSignIn;

  bool get isEmailVerified {
    if (auth.currentUser == null) return false;
    if (auth.currentUser!.emailVerified) return true;
    return false;
  }

  bool get isCurrentUserExists => auth.currentUser != null;

  Future<Either<FirebaseAuthException, Unit>> createUserWithEmailAndPassword(
    String email,
    String displayName,
    String password,
  ) async {
    try {
      var credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.updateDisplayName(displayName);
      await credential.user!.sendEmailVerification();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e);
    }
  }

  Future<Either<FirebaseAuthException, Unit>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e);
    }
  }

  Future<Either<FirebaseAuthException, Unit>> signOut() async {
    try {
      await auth.signOut();
      await _googleSignIn?.disconnect();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e);
    }
  }

  Future<Either<FirebaseAuthException, Unit>> signInWithGoogle() async {
    try {
      _googleSignIn = GoogleSignIn();
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn?.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await auth.signInWithCredential(credential);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e);
    }
    // TODO add PlatformException
    // } on PlatformException catch (e) {
    //   return left(e);
    // }
  }
}
