import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/data_model/songs.dart';
import 'package:music_player/db_functions/db_functions.dart';
import 'package:music_player/functions/recents.dart';
import 'package:music_player/widget/backgroundcolor.dart';
import 'package:music_player/widget/recent_most_played_tile.dart';

class RecentlyPlayed extends StatefulWidget {
  const RecentlyPlayed({super.key});

  @override
  State<RecentlyPlayed> createState() => _RecentlyPlayedState();
}

class _RecentlyPlayedState extends State<RecentlyPlayed> {
  Box<List> playlistBox = getPlaylistBox();
  Box<Songs> songBox = getSongBox();
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Recently Played',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Recents.removefromrecentSongsList();
              },
              icon: const Icon(Icons.delete)),
        ],
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: bgColor(),
          ),
          child: ValueListenableBuilder(
            valueListenable: playlistBox.listenable(),
            builder: (
              BuildContext context,
              Box<List> value,
              Widget? child,
            ) {
              List<Songs> songList =
                  playlistBox.get('Recents')!.toList().cast<Songs>();
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
                      itemCount: songList.length,
                      itemBuilder: (context, index) {
                        return RecentTile(
                          songList: songList,
                          index: index,
                          audioPlayer: audioPlayer,
                        );
                      },
                    );
            },
          )),
    );
  }
}
