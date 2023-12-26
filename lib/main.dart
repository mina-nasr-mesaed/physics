import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:physics/modules/Authentication/signup_screen.dart';
import 'package:physics/modules/Authentication/splash_screen.dart';
import 'package:physics/modules/level_pdf/level1.dart';
import 'package:physics/modules/level_pdf/level3.dart';
import 'package:physics/modules/level_pdf/level4.dart';
import 'package:physics/modules/pdf_list.dart';
import 'package:physics/modules/student%20List.dart';
import 'package:physics/modules/student/level1_student.dart';
import 'Firebase/auth.dart';
import 'modules/admin/home_screen.dart';
import 'modules/admin/post.dart';
import 'modules/level_Screen.dart';
import 'modules/Authentication/login_screen.dart';
import 'modules/level_pdf/level2.dart';
import 'modules/student/level2_student.dart';
import 'modules/student/level3_student.dart';
import 'modules/student/level4_student.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseApp =await Firebase.initializeApp();
  return firebaseApp;
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //Color(0xFF7ED957) green
        //Color(0xFF0097B2)  blue
        // [Color(0xFF0097B2), Color(0xFF7ED957)] gradiunt
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => SplashScreen(),
        "auth": (context) => Auth(),
        "login": (context) =>  LoginPage(),
        "signup": (context) => Register(),
        "home": (context) => HomeScreen(),
        "level": (context) =>Level(),
        'pdfview':(context) =>pdf_list(),
        'studentview':(context) =>Student_List(),
        'pdf1':(context) =>pdf1(),
        'pdf2':(context) =>pdf2(),
        'pdf3':(context) =>pdf3(),
        'pdf4':(context) =>pdf4(),
        'pdf1s':(context) =>pdf1Student(),
        'pdf2s':(context) =>pdf2Student(),
        'pdf3s':(context) =>pdf3Student(),
        'pdf4s':(context) =>pdf4Student(),
        'post':(context) =>PostCreationScreen(),
        //"form":(Context)=>Form1(),
      },
    );
  }
}
