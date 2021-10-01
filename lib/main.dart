import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thebest/screens/splash.dart';
import 'package:thebest/services/get_data.dart';

import 'provider/home_provider.dart';

void main() {
  GetData.init();

  runApp(    ChangeNotifierProvider(create: (_)=> HomeProvider(),

            child: const MyApp() ,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home:  Splash(),
    );
  }
}

