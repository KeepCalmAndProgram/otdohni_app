import 'package:otdohni_app/pages/home_page.dart';
import 'package:otdohni_app/widgets/authentication.dart';
import 'package:otdohni_app/pages/login_register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Authentication().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return const LoginRegisterPage();
        }
      },
    );
  }
}
