import 'package:flutter/material.dart';
import 'package:yokeshinzone/pages/home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () => Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (c) => const HomePage()),
        (Route<dynamic> route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text('Yoke Shin Zone', style: TextStyle(
          color: Colors.white,
        )),
      ),
    );
  }
}
