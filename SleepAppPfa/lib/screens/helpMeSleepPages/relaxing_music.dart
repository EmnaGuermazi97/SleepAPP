import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tutorials_test/models/AudioToolsClass.dart';
import 'package:tutorials_test/widgets/customNavBar.dart';

class RelaxingMusic extends StatefulWidget {
  @override
  _RelaxingMusic createState() => _RelaxingMusic();
  AudioTools audioTools = AudioTools();
  RelaxingMusic(AudioTools audioTools);
}

class _RelaxingMusic extends State<RelaxingMusic> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool firstTime = true;
  String currentTime = "00:00";
  String completeTime = "00:00";
  @override
  Widget build(BuildContext context) {
    widget.audioTools = new AudioTools(
      audioPlayer: audioPlayer,
      isPlaying: isPlaying,
      firstTime: firstTime,
      currentTime: currentTime,
      completeTime: completeTime,
    );
    widget.audioTools.initState();
    widget.audioTools.dispose();
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
                        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                        onPressed: () {
                          if (widget.audioTools.isPlaying) {
                            widget.audioTools.audioPlayer.pause();

                            setState(() {
                              firstTime = false;
                              isPlaying = false;
                            });
                          } else {
                            if (!firstTime) {
                              widget.audioTools.audioPlayer.resume();

                              setState(() {
                                firstTime = false;
                                isPlaying = true;
                              });
                            } else {
                              widget.audioTools.startPlayingFromScratch("audios/meditate.mp3");
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
                          widget.audioTools.audioPlayer.stop();

                          setState(() {
                            widget.audioTools.isPlaying = false;
                          });
                        },
                      ),
                      Text(
                        widget.audioTools.currentTime,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(" | "),
                      Text(
                        widget.audioTools.completeTime,
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
