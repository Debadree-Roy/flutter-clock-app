import 'dart:async';
import 'dart:ui';

import 'package:clockapp/alarm_page.dart';
import 'package:clockapp/clock_view.dart';
import 'package:clockapp/stopwatch.dart';
import 'package:clockapp/timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign= '';
    if(!timezoneString.startsWith('-')) offsetSign= '+';
    return Scaffold(
      backgroundColor:Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextButton( onPressed: () {},
                 child: Column(
                  children: [
                    Image.asset('assets/clock_icon.png',scale: 1.5,),
                    SizedBox(height: 10,),
                    Text('Clock',style: TextStyle(fontFamily: 'avenir',color:Colors.white,fontSize: 14))
                  ],
                ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextButton( onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context)=> AlarmPage())));
                },
                  child: Column(
                    children: [
                      Image.asset('assets/alarm_icon.png',scale: 1.5,),
                      SizedBox(height: 10,),
                      Text('Alarm',style: TextStyle(fontFamily: 'avenir',color:Colors.white,fontSize: 14))
                    ],
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextButton( onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context)=> TimerPage())));
                },
                  child: Column(
                    children: [
                      Image.asset('assets/timer_icon.png',scale: 1.5,),
                      SizedBox(height: 10,),
                      Text('Timer',style: TextStyle(fontFamily: 'avenir',color:Colors.white,fontSize: 14))
                    ],
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextButton( onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context)=> StopwatchPage())));
                },
                  child: Column(
                    children: [
                      Image.asset('assets/stopwatch_icon.png',scale: 1.5,),
                      SizedBox(height: 10,),
                      Text('Stopwatch',style: TextStyle(fontFamily: 'avenir',color:Colors.white,fontSize: 14))
                    ],
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: IconButton(
                  onPressed: () {
                    showAboutDialog(context: context,
                        applicationIcon: FlutterLogo(),
                        applicationLegalese: "Build by Soumyadeep Das,Shalini Acheriya,Neha Kumar,Anindita Mukhopadhay,Joyjeet Paul",
                        applicationName: "Clock App"
                    );
                  }, icon: Icon(Icons.info,color: Colors.white,),

                ),
              ),
            ],
          ),
          VerticalDivider(color: Colors.white54,width: 1),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10,100,0,10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Clock',
                    style: TextStyle( fontFamily: 'avenir',fontWeight: FontWeight.w700, color: Colors.white,fontSize: 24),
                  ),
                  SizedBox(height: 32),
                  Text(
                    formattedTime,
                    style: TextStyle(fontFamily: 'avenir', color: Colors.white,fontSize: 64),
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(fontFamily: 'avenir', color: Colors.white,fontSize: 20),
                  ),
                  ClockView(),
                  SizedBox(height: 10,),
                  Text(
                    'TimeZone',
                    style: TextStyle(fontFamily: 'avenir', color: Colors.white,fontSize: 20),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.language,color: Colors.white),
                      Text(
                        'UTC' + offsetSign + timezoneString,
                        style: TextStyle(fontFamily: 'avenir', color: Colors.white,fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
