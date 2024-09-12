import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_2/firebase_options.dart';
import 'package:test_2/provider/firebase_provider.dart';
import 'package:test_2/provider/product_provider.dart';
import 'package:test_2/provider/student_provider.dart';
import 'package:test_2/provider/teacher_provider.dart';
import 'package:test_2/view/teacher_form.dart';
import 'package:test_2/view/user_details.dart';
import 'package:test_2/view/userform.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (context)=> StudentProvider(),),
         ChangeNotifierProvider(create: (context)=> ProductProvider(),),
         ChangeNotifierProvider(create: (context)=> FireBaseProvider(),),
         ChangeNotifierProvider(create: (context)=> TeacherProvider()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:TeacherForm(),
      ),
    );
  }
}

