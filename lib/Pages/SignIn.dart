import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_exam/Authentication.dart';
import 'package:flutter_final_exam/Final%20Exam/constants.dart';
import 'package:flutter_final_exam/FirebaseUser.dart';
import 'package:flutter_final_exam/LoginUser.dart';

class SignIn extends StatelessWidget 
{
  SignIn({super.key});
  final AuthService _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() 
  {
    // Clean up the controller when the widget is disposed.
    _email.dispose();
    _password.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) 
  {
    // return Container
    // (
    //   child: ElevatedButton
    //   (
    //     onPressed: () async {
    //       try 
    //       {
    //         final User? user = (await _auth.signInWithEmailAndPassword(
    //           email: emailController.text,
    //           password: passwordController.text,
    //         ))
    //                 .user;
    //         if (!user!.emailVerified) {
    //           await user.sendEmailVerification();
    //         }
    //         // Navigate to /data page
    //         Navigator.pushNamed(context, '/crud');
    //       } on FirebaseAuthException catch (e) {
    //         print('Failed with error code: ${e.code}');
    //         print(e.message);
    //       }
    //     },
    //     child: Ink(
    //       decoration: BoxDecoration(
    //           gradient: const LinearGradient(
    //               colors: CustomColors.backgroundColor),
    //           borderRadius: BorderRadius.circular(50)),
    //       child: Container(
    //         width: 150,
    //         height: 50,
    //         alignment: Alignment.center,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             Spacer(),
    //             const Text(
    //               'Login',
    //               style: TextStyle(
    //                   fontSize: 15, fontStyle: FontStyle.italic),
    //             ),
    //             Icon(Icons.arrow_forward_outlined),
    //             Spacer(),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold
    (
      body: Padding
      (
        padding: EdgeInsets.all(30.0),
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: 
          [
            const Text('Sign Up Page', style: TextStyle(fontSize: 30.0),),
            ElevatedButton.icon
            (
              onPressed: () async
              {
                try 
                {
                  FirebaseUser user = await _auth.register
                  (
                    LoginUser
                    (
                      email: _email.text,
                      password: _password.text
                    )
                  );
                  if (user != null)
                  {
                    Text('User Successflly registered');
                  }
                }
                catch(e)
                {
                  if(e is FirebaseAuthException)
                  {
                    showDialog
                    (
                      context: context,
                      builder: (context) 
                      {
                        return AlertDialog
                        (
                          content: Text(e.code),
                        );
                      }
                    );
                  }
                }
              }, 
              icon: Icon(Icons.g_mobiledata_rounded), 
              label: Text('Sign Up')
            ),
            TextField
            (
              decoration: const InputDecoration
              (
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              controller: _email,
            ),
            TextField
            (
              obscureText: true,
              decoration: const InputDecoration
              (
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              controller: _password,
            ),
            const TextField
            (
              obscureText: true,
              decoration: InputDecoration
              (
                border: OutlineInputBorder(),
                labelText: 'Confirm Password',
              )
            ),
            // ElevatedButton
            // (
            //   child: const Text('Register'),
            //   // onPressed: () {},
            //   onPressed: () async 
            //   {
            //     dynamic result = await _auth.register(LoginUser(email: _email.text, password: _password.text));
            //     if (result.uid == null) //null means unsuccessfull authentication
            //     {
            //       // ignore: use_build_context_synchronously
            //       showDialog
            //       (
            //         context: context,
            //         builder: (context) 
            //         {
            //           return AlertDialog
            //           (
            //             content: Text(result.code),
            //           );
            //         }
            //       );
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}