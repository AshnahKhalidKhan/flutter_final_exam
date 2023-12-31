import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_final_exam/Pages/Question1.dart';
import 'package:flutter_final_exam/Pages/Question2.dart';
import 'package:flutter_final_exam/Pages/SignIn.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_final_exam/Core/Repository/product_repository.dart';
import 'package:flutter_final_exam/Core/network.dart';
import 'package:flutter_final_exam/Pages/LoginPage.dart';
import 'package:flutter_final_exam/firebase_options.dart';

void main() async 
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp
  (
    options: DefaultFirebaseOptions.currentPlatform
  );
  final DataRepository dataRepository = DataRepository
  (
    dataAPIClient: DataAPIClient(httpClient: http.Client()),
    firebaseFirestore: FirebaseFirestore.instance
  );
  //runApp(const MyApp());
  runApp
  (
    MyApp(dataRepository: dataRepository)
  );
}

class MyApp extends StatelessWidget 
{
  final DataRepository dataRepository;
  const MyApp({super.key, required this.dataRepository});

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      title: 'Flutter Demo',
      // home: LoginPage(dataRepository: dataRepository)
      // home: SignIn()



      home: Question1(dataRepository: dataRepository),
      // home: Question2()
    );
  }
}

// void main() 
// {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget 
// {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) 
//   {
//     return MaterialApp
//     (
//       title: 'Flutter Demo',
//       // home: LoginPage(dataRepository: dataRepository)
//       // home: SignIn()
//       home: Question2()
//     );
//   }
// }