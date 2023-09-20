import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var logger = Logger();
  late AnimationController _controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        lowerBound: 0.5,
        upperBound: 1);

    animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    navigateToMainContent();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  navigateToMainContent() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("access_token");
    logger.d("Token === $token");
    logger.d(token != null);
    logger.d(token != Null);
    logger.d(token.runtimeType);
    if (context.mounted && token != null) {
      logger.i("Inside token not null");
      context.go('/home');
    } else if (token == null) {
      logger.i("Inside token not null");
      context.go("/auth");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ScaleTransition(
          scale: animation,
          child: Center(
            child: Image.asset(
              "assets/images/logo1.png",
              width: 200,
              height: 200,
            ),
          ),
        ));
  }
}
