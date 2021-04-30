import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../subpages/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import '../subpages/home.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  static final FacebookLogin facebookSignIn = new FacebookLogin();

  Rxn<User> _firebaseUser = Rxn<User>();

  String get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(
      String firstname, String lastname, String email, String password) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("users");
    Map<String, String> userdata = {
      "firstname": firstname,
      "lastname": lastname,
      "email": email
    };
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      reference.add(userdata).then((value) => Get.offAll(HomePage()));
    }).catchError(
      (onError) => Get.snackbar(
          "Error while creating account ", onError.message,
          snackPosition: SnackPosition.BOTTOM),
    );
  }

  void login(String email, String password) {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("Error logging in", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut(String email, String password) async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar("Error signing out", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void google_signIn() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final User user = (await _auth
        .signInWithCredential(credential)
        .then((value) => Get.offAll(UserPage())));
  }

  void google_signOut() async {
    await googleSignIn.signOut().then((value) => Get.offAll(HomePage()));
  }

  Future<Null> fb_login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        print('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }
}
