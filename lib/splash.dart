import 'package:clockapp/homepage.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    delay();
    super.initState();
  }
  void delay(){
    Future.delayed(Duration(seconds: 15),(){Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context)=>Homepage())));});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/76.png'),
            SizedBox(height: 10,),
            Text(
              'Clock',
              style: TextStyle(
                  fontSize: 30, color: Colors.white70
              ),
            ),
            SizedBox(height: 10,),
            CircularProgressIndicator()
          ],

        ),
      ),
    );
  }
}