import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tutorials_test/models/AudioToolsClass.dart';
import 'package:tutorials_test/widgets/customNavBar.dart';

class RelaxingMusic extends StatefulWidget {
  @override
  _RelaxingMusic createState() => _RelaxingMusic();
  // RelaxingMusic({Key: key}) : super(key: key);
}

class _RelaxingMusic extends State<RelaxingMusic> {
  AudioTools audioTools = new AudioTools(
      audioPlayer: new AudioPlayer(),
      isPlaying: false,
      firstTime: true,
      currentTime: "00:00",
      completeTime: "00:00");

  @override
  void initState() {
    super.initState();

    audioTools.audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        audioTools.currentTime = duration.toString().split(".")[0];
      });
    });

    audioTools.audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioTools.completeTime = duration.toString().split(".")[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Relaxing Music"),
        centerTitle: true,
      ),
      bottomNavigationBar: customNavBar(context, 0),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.orange[50],
                image: DecorationImage(
                  image: AssetImage("assets/images/relaxation-png-1.png"),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 80,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.65,
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.orange[100],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange[100].withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(
                            3,
                            0,
                          ), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(audioTools.isPlaying ? Icons.pause : Icons.play_arrow),
                        onPressed: () {
                          if (audioTools.isPlaying) {
                            audioTools.audioPlayer.pause();

                            setState(() {
                              audioTools.firstTime = false;
                              audioTools.isPlaying = false;
                            });
                          } else {
                            if (!audioTools.firstTime) {
                              audioTools.audioPlayer.resume();

                              setState(() {
                                audioTools.firstTime = false;
                                audioTools.isPlaying = true;
                              });
                            } else {
                              audioTools.startPlayingFromScratch(
                                  "audios/meditate.mp3");
                            }
                          }
                        },
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      IconButton(
                        icon: Icon(Icons.stop),
                        onPressed: () {
                          audioTools.audioPlayer.stop();

                          setState(() {
                            audioTools.isPlaying = false;
                          });
                        },
                      ),
                      Text(
                        audioTools.currentTime,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(" | "),
                      Text(
                        audioTools.completeTime,
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
