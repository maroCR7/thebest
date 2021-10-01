import 'package:flutter/material.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  AnimationController? rotationController;

  @override
  void initState() {
    rotationController = AnimationController(
       duration: Duration(seconds: 1), vsync: this);
    rotationController!.repeat();
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
              child: Image.asset('assets/images/load.png', height: MediaQuery.of(context).size.width * 0.15)),
        ),
      ),
    );
  }
}
