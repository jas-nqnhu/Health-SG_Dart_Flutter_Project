import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseAuthService {
// FirebaseAuth instance
  final FirebaseAuth _fbAuth = FirebaseAuth.instance;

// get current user email
  String getUEmail() {
    final User user = _fbAuth.currentUser;
    String email = user.email;
    return email;
  }
// get current user id
  String getUid() {
    final User user = _fbAuth.currentUser;
    String uid = user.uid;
    return uid;
  }
  Future<User> signIn({String email, String password}) async {
    try {
      UserCredential ucred = await _fbAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = ucred.user;
      print("Signed In successful! userid: ${ucred.user.uid}, user: $user.");
      return user;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    }
  } //signln

  Future<User> signUp({String email, String password}) async {
    try {
      UserCredential ucred = await _fbAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = ucred.user;
      print('Signed Up successful! user: $user');

      return user;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    } //signUp
  }

  Future<void> signOut() async {
    try {
      await _fbAuth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  } //signOut
}//FirebaseAuthService