import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  int secoends=0, minitues=0, hours=0;
  String digitSecoends= "00", digitMinitues="00", digitHours="00";
  Timer? timer;
  bool started = false;
  List laps=[];

  void stop(){
    timer!.cancel();
    setState(() {
      started=false;
    });
  }

  void reset(){
    timer!.cancel();
    setState(() {
      secoends=0;
      minitues=0;
      hours=0;

      digitSecoends="00";
      digitMinitues="00";
      digitHours="00";

      laps=[];

      started=false;
    });
  }

  void addLaps(){
    String lap="$digitHours:$digitMinitues:$digitSecoends";
    setState(() {
      laps.add(lap);
    });
  }

  void start(){
    started=true;
    timer= Timer.periodic(Duration(seconds: 1), (timer){
      int localSecoends= secoends+1;
      int localMinitues= minitues;
      int localhours = hours;

      if(localSecoends > 59){
        if(localMinitues >59 ){
          localhours++;
          localMinitues=0;
        }else{
          localMinitues++;
          localSecoends=0;
        }
      }
      setState(() {
        secoends=localSecoends;
        minitues= localMinitues;
        hours= localhours;

        digitSecoends=(secoends >=10) ? "$secoends" : "0$secoends";
        digitMinitues=(minitues>=10) ? "$minitues" : "0$minitues";
        digitHours=(hours>=10) ? "$hours" : "0$hours";
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(backgroundColor:Color(0xFF2D2F41), title:Text("Stopwatch",style: TextStyle(fontFamily: 'avenir',fontWeight: FontWeight.w700, color: Colors.white,fontSize: 28),),centerTitle: true),
      backgroundColor: Color(0xFF2D2F41),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Center(
                child:Text("$digitHours:$digitMinitues:$digitSecoends",style: TextStyle(fontFamily: 'avenir',fontWeight: FontWeight.w600, color: Colors.white,fontSize: 82),),
              ),
              Container(
                height: 200,
                 decoration: BoxDecoration(
                   color: Color(0xFF323f68),
                   borderRadius: BorderRadius.circular(8.0),
                 ),
                child: ListView.builder(
                  itemCount: laps.length,
                    itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Lap ${index+1}",style: TextStyle(fontFamily: 'avenir', color: Colors.white,fontSize:16 ),),
                          Text("${laps[index]}",style: TextStyle(fontFamily: 'avenir', color: Colors.white,fontSize:16 ),)
                        ],
                      ),
                    );
                    }
                ),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: RawMaterialButton(
                    onPressed: () {
                      (!started) ? start() : stop();
                    },
                    shape: const StadiumBorder(side: BorderSide(color: Colors.blue)),
                    child: Text((!started) ? "Start" : "Pause",style: TextStyle(fontFamily: 'avenir', color: Colors.white,),),
                  )),
                  SizedBox(width: 8.0,),
                  IconButton(onPressed: () {
                    addLaps();
                  }, icon: Icon(Icons.flag), color: Colors.white,),
                  Expanded(child: RawMaterialButton(
                    onPressed: () {
                      reset();
                    },
                    fillColor: Colors.blue,
                    shape: const StadiumBorder(),
                    child: Text("Reset",style: TextStyle(fontFamily: 'avenir', color: Colors.white,),),
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
