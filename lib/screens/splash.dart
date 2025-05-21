import 'package:exams/screens/home.dart';
import 'package:exams/screens/login.dart';
import 'package:exams/services/sharepreferences_service.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    load();
  }

  load() async {
    var isConnected = await SharepreferenceService.getValue('isConnected');
    print("isconnected = ${isConnected}");
    Future.delayed(
      Duration(seconds: 5),
      () => {
        if ("CONNECTER" != isConnected)
          {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LoginPage()),
            ),
          }
        else
          {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomePage()),
            ),
          },
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(64),
        child: Center(
          child: LoadingIndicator(
            indicatorType: Indicator.ballRotate,
            colors: [Colors.blue, Colors.orange],
            strokeWidth: 4.0,
            pathBackgroundColor: Colors.black45,
          ),
        ),
      ),
    );
  }
}
