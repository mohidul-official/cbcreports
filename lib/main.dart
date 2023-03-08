import 'package:cbcreports/users/authentication/login_screen.dart';
import 'package:cbcreports/users/fregments/dashboard_of_fregments.dart';
import 'package:cbcreports/users/userPreference/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CBC REPORTS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: RememberUserPrefs.readUserInfo(),
          builder: (context, dataSnapShot) {
            if (dataSnapShot.data == null) {
              return LoginScreen();
            } else {
              return DashboardOfFragments();
            }
          }),
    );
  }
}
