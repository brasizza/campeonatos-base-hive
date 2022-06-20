import 'package:flutter/material.dart';

import 'controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  final SplashController controller;
  const SplashPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.getData().then((complete) {
      if (complete == true) {
        Navigator.of(context).popAndPushNamed('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/splash.jpg',
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "PARTIDAS DE FUTEBOL PELO MUNDO",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "AGUARDE O CARREGAMENTO",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              CircularProgressIndicator.adaptive(),
            ],
          ),
        ],
      ),
    );
  }
}
