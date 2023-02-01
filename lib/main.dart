import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/responsive/mobileScreenLayout.dart';
import 'package:instagram_clone_flutter/responsive/responsive_screen_layout.dart';
import 'package:instagram_clone_flutter/responsive/webScreenLayout.dart';
import 'package:instagram_clone_flutter/screens/login_screen.dart';
import 'package:instagram_clone_flutter/screens/signup_screen.dart';
import 'package:instagram_clone_flutter/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      title: 'Flutter Demo',
      // home: const ResponsiveLayout(mobileScreenLayout:mobileScreenLayout(),webScreenLayout:webScreenLayout() ,),
    home: LoginScreen(),
    );
  }
}


