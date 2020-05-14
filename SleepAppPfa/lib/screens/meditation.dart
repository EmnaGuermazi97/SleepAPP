// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:audioplayers/audio_cache.dart';

import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

import '../widgets.dart';

class MeditationPage extends StatefulWidget {
  @override
  _MeditationState createState() => _MeditationState();
}

class _MeditationState extends State<MeditationPage> {
//   AssetsAudioPlayer _assetsAudioPlayer;

  
// @override
//   void initState() {
//     super.initState();
//     _assetsAudioPlayer = AssetsAudioPlayer();
//     _assetsAudioPlayer.open(
//       AssetsAudio(
//         asset: "song3.mp3",
//         folder: "assets/music/",
//       ),
//     );
//     _assetsAudioPlayer.playOrPause();
//   }

//   @override
//   void dispose() {
//     _assetsAudioPlayer = null;
//     super.dispose();
//   }
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: Container(),
              title: Text("Meditation"),
              centerTitle: true,
            ),
            bottomNavigationBar: customNavBar(context, 0),
            body: SingleChildScrollView(
                child: Container(
              height: size.height * .81,
              color: Colors.orange[100],
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      image: DecorationImage(
                        image: AssetImage("assets/images/relaxation-png-1.png"),
                        alignment: Alignment.topLeft,
                      ),
                    ),
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.8,
                  //   height: 80,
                  //   margin: EdgeInsets.only(
                  //       top: MediaQuery.of(context).size.height * 0.7,
                  //       left: MediaQuery.of(context).size.width * 0.1),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(50)),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: <Widget>[
                  //       IconButton(
                  //         icon:
                  //             Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  //         onPressed: () {
                  //           if (isPlaying) {
                  //             _audioPlayer.pause();

                  //             setState(() {
                  //               isPlaying = false;
                  //             });
                  //           } else {
                  //             _audioPlayer.resume();

                  //             setState(() {
                  //               isPlaying = true;
                  //             });
                  //           }
                  //         },
                  //       ),
                  //       SizedBox(
                  //         width: 16,
                  //       ),
                  //       IconButton(
                  //         icon: Icon(Icons.stop),
                  //         onPressed: () {
                  //           _audioPlayer.stop();

                  //           setState(() {
                  //             isPlaying = false;
                  //           });
                  //         },
                  //       ),
                  //       Text(
                  //         currentTime,
                  //         style: TextStyle(fontWeight: FontWeight.w700),
                  //       ),
                  //       Text(" | "),
                  //       Text(
                  //         completeTime,
                  //         style: TextStyle(fontWeight: FontWeight.w300),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // // FloatingActionButton(
                  //   child: Icon(Icons.audiotrack),
                  //   onPressed: () {
                  //     String filePath = "assets/audios/meditate.mp3";

                  //     _audioPlayer.play(filePath);

                  //     setState(() {
                  //       isPlaying = true;
                  //     });
              //       },
              //     ),
                ],
              ),
            ))));
  }
}
