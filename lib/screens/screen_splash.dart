import 'package:flutter/material.dart';
import 'package:music_player/screens/screen_home.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotoScreenHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0A0808), Color(0xFF2C2B26)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            'tunezz',
            style: TextStyle(
              fontSize: width * 0.23,
              fontFamily: "Alegreya Sans",
              color: const Color.fromARGB(227, 18, 179, 219),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> gotoScreenHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ScreenHome()));
  }
}
