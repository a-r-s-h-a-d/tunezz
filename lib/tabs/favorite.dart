import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/data_model/songs.dart';
import 'package:music_player/db_functions/db_functions.dart';
import 'package:music_player/widget/music_tile.dart';

class Favorites extends StatelessWidget {
  Favorites({super.key});
  final Box<List> playlistBox = getPlaylistBox();
  final Box<Songs> songBox = getSongBox();
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: playlistBox.listenable(),
      builder: (BuildContext context, Box<List> value, Widget? child) {
        List<Songs> songList = playlistBox.get('Favorites')!.toList().cast();
        return (songList.isEmpty)
            ? Center(
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
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return MusicListTile(
                    audioPlayer: audioPlayer,
                    index: index,
                    songList: songList,
                  );
                },
                itemCount: songList.length,
              );
      },
    );
  }
}
