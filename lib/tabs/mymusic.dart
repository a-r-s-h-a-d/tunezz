import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/data_model/songs.dart';
import 'package:music_player/db_functions/db_functions.dart';
import 'package:music_player/widget/music_tile.dart';

class MyMusic extends StatefulWidget {
  const MyMusic({
    required this.audioPlayer,
    Key? key,
  }) : super(key: key);
  final AssetsAudioPlayer audioPlayer;
  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  Box<Songs> songBox = getSongBox();
  // AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 70),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: songBox.listenable(),
            builder: (BuildContext context, Box<Songs> songBox, Widget? child) {
              //final List<int> keys = songBox.keys.toList().cast<int>();
              List<Songs> songList = [];
              // for (var key in keys) {
              //   songList.add(songBox.get(key)!);
              // }
              songList = songBox.values.toList().cast<Songs>();
              if (songBox.values.isEmpty) {
                return Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ScaleAnimatedText(
                        'No Songs Found',
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                    repeatForever: true,
                  ),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) => MusicListTile(
                  audioPlayer: widget.audioPlayer,
                  index: index,
                  songList: songList,
                ),
                itemCount: songList.length,
              );
            },
          ),
        ),
      ]),
    );
  }
}
