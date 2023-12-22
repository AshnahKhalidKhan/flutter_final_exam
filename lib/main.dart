import 'package:firebase_core/firebase_core.dart';
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
    dataAPIClient: DataAPIClient(httpClient: http.Client())
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
      home: LoginPage(dataRepository: dataRepository)
    );
  }
}