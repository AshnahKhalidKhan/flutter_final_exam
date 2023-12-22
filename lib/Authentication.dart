import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_final_exam/FirebaseUser.dart';
import 'package:flutter_final_exam/LoginUser.dart';

class AuthService 
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser? _firebaseUser(User? user) 
  {
    return user != null ? FirebaseUser(uid: user.uid) : null;
  }

  Stream<FirebaseUser?> get user 
  {
    return _auth.authStateChanges().map(_firebaseUser);
  }

  Future register(LoginUser user) async 
  {
    try
    {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword
      (
        email: user.email.toString(),
        password: user.password.toString()
      );
      User? user1 = userCredential.user;
      if (user1 != null)
      {
        return FirebaseUser(uid: user1.uid);
      }
      else
      {
        return null;
      }
    }
    on FirebaseAuthException catch (e) 
    {
      return FirebaseUser
      (
        code: e.code, 
        uid: null
      );
    }
    catch (e) 
    {
      return FirebaseUser
      (
        code: e.toString(), 
        uid: null
      );
    }
  }

  Future login(LoginUser user) async 
  {
    try
    {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword
      (
        email: user.email.toString(),
        password: user.password.toString()
      );
      User? user1 = userCredential.user;
      if (user1 != null)
      {
        return FirebaseUser(uid: user1.uid);
      }
      else
      {
        return null;
      }
    }
    on FirebaseAuthException catch (e) 
    {
      return FirebaseUser
      (
        code: e.code, 
        uid: null
      );
    }
  }

}