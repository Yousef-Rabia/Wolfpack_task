import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isPlaying=false;
  late AudioPlayer audioPlayer1;
  late AudioPlayer audioPlayer2;
  late AudioPlayer audioPlayer3;
  late AudioPlayer audioPlayer4;
  late double vol1;
  late double vol2;
  late double vol3;
  late double vol4;
  double vol=0;
  late StreamSubscription<double> _subscription;

  @override
  void initState()  {
    super.initState();
    audioPlayer1=AudioPlayer();
    audioPlayer2=AudioPlayer();
    audioPlayer3=AudioPlayer();
    audioPlayer4=AudioPlayer();
    vol1=0.5;
    vol2=0.5;
    vol3=0.5;
    vol4=0.5;
    vol=-1;
    _subscription = PerfectVolumeControl.stream.listen((value) {
      if(vol==-1) {
        vol = value;
      }
      if(vol>value)
        {
          setState(() {
            vol1-=(vol1-vol+value)<0?(vol1):(vol-value);
            vol2-=(vol2-vol+value)<0?(vol2):(vol-value);
            vol3-=(vol3-vol+value)<0?(vol3):(vol-value);
            vol4-=(vol4-vol+value)<0?(vol4):(vol-value);

          });
        }
      else if(vol<value){
        setState(() {
          vol1+=(vol1+value-vol)>1?(1-vol1):(value-vol);
          vol2+=(vol2+value-vol)>1?(1-vol2):(value-vol);
          vol3+=(vol3+value-vol)>1?(1-vol3):(value-vol);
          vol4+=(vol4+value-vol)>1?(1-vol4):(value-vol);

        });
      }
      vol=value;
    });
  }


  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.amber,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Text("Music 1",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                  ),),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton(onPressed: (){
                      setState((){
                        isPlaying=!isPlaying;
                        if(isPlaying)
                          {
                            playMusic();
                          }
                        else{
                          stopMusic();
                        }
                      });
                    }, icon: Icon(isPlaying?Icons.pause_circle:Icons.play_circle,size: 80),
                    ),
                  ),
                  Slider(
                    value: vol1,
                    activeColor: Colors.black,
                    inactiveColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        vol1=value;
                        audioPlayer1.setVolume(vol1);
                      });
                    },
                  ),

                ],
              ),
            ),
          )),
          Expanded(child: Container(
            width: double.infinity,
            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Spacer(flex: 1,),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text("    Music 2",style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),),
                        Slider(
                          value: vol2,
                          activeColor: Colors.black,
                          inactiveColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              vol2=value;
                              audioPlayer2.setVolume(vol2);

                            });
                          },
                        ),

                      ],
                    ),
                  ),

                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Text("    Music 3",style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),),
                        Slider(
                          value: vol3,
                          activeColor: Colors.black,
                          inactiveColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              vol3=value;
                              audioPlayer3.setVolume(vol3);
                            });
                          },
                        ),

                      ],
                    ),
                  ),


                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text("    Music 4",style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),),
                        Slider(
                          value: vol4,
                          activeColor: Colors.black,
                          inactiveColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              vol4=value;
                              audioPlayer4.setVolume(vol4);

                            });
                          },
                        ),

                      ],
                    ),
                  ),
                  Spacer(flex: 1,),

                ],
              ),
            ),
          )),
        ],
      ),
    );

  }

  playMusic(){
    audioPlayer1.play(AssetSource('Music1.mp3'));
    audioPlayer1.onPlayerComplete.listen((event) {
      audioPlayer1.play(AssetSource('Music1.mp3'));
    });
    audioPlayer2.play(AssetSource('Music2.mp3'));
    audioPlayer2.onPlayerComplete.listen((event) {
      audioPlayer2.play(AssetSource('Music2.mp3'));
    });
    audioPlayer3.play(AssetSource('Music3.mp3'));
    audioPlayer3.onPlayerComplete.listen((event) {
      audioPlayer3.play(AssetSource('Music3.mp3'));
    });
    audioPlayer4.play(AssetSource('Music4.mp3'));
    audioPlayer4.onPlayerComplete.listen((event) {
      audioPlayer4.play(AssetSource('Music4.mp3'));
    });
  }
  stopMusic()
  {// to pause the Audio
    audioPlayer1.pause();
    audioPlayer2.pause();
    audioPlayer3.pause();
    audioPlayer4.pause();
  }
}
