import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/screens/screen_settings.dart';
import 'package:music_player/tabs/favorite.dart';
import 'package:music_player/tabs/mymusic.dart';
import 'package:music_player/tabs/playlist.dart';
import 'package:music_player/widget/backgroundcolor.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'tunezz',
                  style: TextStyle(
                    fontSize: width * 0.07,
                    fontFamily: "Alegreya Sans",
                    color: const Color.fromARGB(227, 18, 179, 219),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: ((context) => ScreenSearch(
                  //           audioPlayer: audioPlayer,
                  //         )),
                  //   ),
                  // );
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const ScreenSettings())));
                },
                icon: const Icon(Icons.settings)),
          ],
          bottom: const TabBar(
            labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontSize: 14),
            tabs: [
              Tab(
                child: Text(
                  'My Music',
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ),
              Tab(
                child: Text(
                  'Favorites',
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ),
              Tab(
                child: Text(
                  'Playlist',
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: bgColor(),
          ),
          child: Column(
            children: [
              Expanded(
                child: SafeArea(
                  child: TabBarView(
                    children: [
                      MyMusic(audioPlayer: audioPlayer),
                      Favorites(),
                      PlaylistTab(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
