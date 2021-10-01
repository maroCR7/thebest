import 'package:flutter/material.dart';

import 'home_screen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController? rotationController;

  @override
  void initState() {
    rotationController = AnimationController(
        duration: const Duration(seconds: 2), vsync: this);
    rotationController!.repeat();
    Future.delayed(const Duration(seconds: 4)).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen())));
    super.initState();
  }

  @override
  void dispose() {
    rotationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(rotationController!),
              child: Image.asset('assets/images/boomLogo.png', height: MediaQuery.of(context).size.width * 0.15 )),
        ),
      ),
    );
  }
}
