import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/dashboard/dashboard.dart';
import 'Screens/splash_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  // void initState(){
  //   super.initState();
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if(user != null){
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (c) => DashboardScreen(),
  //       ),
  //     );
  //   }
  //
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.deepOrangeAccent),
      ),
      home:const SplashScreen(),
    );
  }
}



