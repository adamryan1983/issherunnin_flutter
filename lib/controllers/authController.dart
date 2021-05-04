import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:issherunnin_flutter/subpages/user.dart';
import '../tabs.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin fbLogin = FacebookLogin();
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  RxBool _issigned = false.obs;

  void setIsSigned(bool value) {
    _issigned.value = value;
  }

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  Rxn<User> _firebaseUser = Rxn<User>();

  String get user => _firebaseUser.value?.email;

  @override
  // ignore: must_call_super
  void onInit() {
    _firebaseUser.bindStream(_auth.userChanges());
  }

  void createUser(
      String firstname, String lastname, String email, String password) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("users");
    Map<String, String> userdata = {
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "password": password
    };
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      reference.add(userdata).then((value) => Get.offAll(TabsPage()));
    }).catchError(
      (onError) => Get.snackbar(
          "Error while creating account ", onError.message,
          snackPosition: SnackPosition.BOTTOM),
    );
  }

  void login(String email, String password) {
    try {
      _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.offAll(TabsPage()));
    } catch (e) {
      Get.snackbar("Error logging in", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut().then((value) => Get.offAll(TabsPage()));
    } catch (e) {
      Get.snackbar("Error signing out", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<User> signInGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final User currentUser = _auth.currentUser;
    assert(currentUser.uid == user.uid);
    return user;
  }

  void sendpasswordresetemail(String email) async {
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(UserPage());
      Get.snackbar("Password Reset email link is been sent", "Success");
    }).catchError(
        (onError) => Get.snackbar("Error In Email Reset", onError.message));
  }

  void signOutGoogle() async {
    try {
      await _googleSignIn.signOut().then((value) => Get.offAll(TabsPage()));
    } catch (e) {
      Get.snackbar("Error signing out", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final FacebookLoginResult result = await fbLogin.logIn(['email']);

      // Create a credential from the access token
      final facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken.token);

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
    } catch (e) {
      Get.snackbar("Error signing out", e.message,
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }
}
