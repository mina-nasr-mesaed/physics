import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Firebase/auth.dart';
import 'modules/home_screen.dart';
import 'modules/level_Screen.dart';
import 'modules/login_screen.dart';
import 'modules/signup_screen.dart';
import 'modules/splash_screen.dart';

void main() async {
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
      initialRoute: 'level',
      routes: {
        "/": (context) => SplashScreen(),
        "auth": (context) => const Auth(),
        "signupScreen": (context) => const SignUpscreen(),
        "loginScreen": (context) => const LoginScreen(),
        "homeScreen": (context) => HomeScreen(),
        "level": (context) =>Level(),
        //"form":(Context)=>Form1(),
      },
    );
  }
}
