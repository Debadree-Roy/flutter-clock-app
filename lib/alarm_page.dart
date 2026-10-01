import 'package:clockapp/data.dart';
import 'package:clockapp/homepage.dart';
import 'package:clockapp/theme_data.dart';
import 'package:flutter/material.dart';

import 'notification.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(centerTitle: true,
      title: Text('Alarm',style: TextStyle(fontFamily: 'avenir',fontWeight: FontWeight.w700, color: Colors.white,fontSize: 24),),
      backgroundColor:Color(0xFF2D2F41),
    ),
        backgroundColor:Color(0xFF2D2F41),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child:ListView(children: alarms.map((alarm) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 32),
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color:alarm.gradientColors.last.withOpacity(0.4),
                          blurRadius: 8,
                          spreadRadius: 4,
                          offset: Offset(4,4),
                        )
                      ],
                      gradient: LinearGradient(
                        colors: alarm.gradientColors,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.label,
                                color: Colors.white,
                                size: 24,),
                                SizedBox(width: 8),
                                Text('Class',style: TextStyle(fontFamily: 'avenir', color: Colors.white,fontSize: 24,),),
                              ],
                            ),

                            Switch(onChanged: (bool value){ }, value: true, activeColor: Colors.white,)
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text('Mon-Fri',style: TextStyle(fontFamily: 'avenir', color: Colors.white),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('02:00 PM',style: TextStyle(fontFamily: 'avenir',fontWeight: FontWeight.w700, color: Colors.white,fontSize: 24),),
                            Icon(Icons.keyboard_arrow_down,color: Colors.white,size: 24,)
                          ],
                        ),
                      ],
                    ),

                  );
                }).followedBy([
                  Container(
                    decoration: BoxDecoration(
                      color: CustomColors.clockBG,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32,vertical: 16),
                    child: TextButton(onPressed: () {
                      sendNotification(title: 'Sorry! Currently Database is not Working', body: 'Alarm will be set');
                    },
                      child: Column(
                        children: [
                          Image.asset('assets/add_alarm.png', scale: 1.5,),
                          SizedBox(height: 8,),
                          Text('Add Alarm',style: TextStyle(fontFamily: 'avenir', color: Colors.white,fontSize: 24),),
                        ],
                      ),
                    ),
                  )
                ]).toList(),
                ),
            ),
          ],
        ),
      ),

    );
  }
}
