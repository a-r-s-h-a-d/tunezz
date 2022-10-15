// ignore_for_file: use_build_context_synchronously

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/data_model/songs.dart';
import 'package:music_player/db_functions/db_functions.dart';
import 'package:music_player/screens/screen_home.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  Box<Songs> songBox = getSongBox();
  Box<List> playlistBox = getPlaylistBox();
  List<SongModel> deviceSongs = [];
  List<SongModel> sortedSongs = [];

  List<Songs> favSongs = [];
  List<Songs> recentSongs = [];
  List<Songs> mostPlayedSongs = [];
  @override
  void initState() {
    requestPermission();
    fetchSongs();
    gotoScreenHome();

    super.initState();
  }

  void requestPermission() {
    Permission.storage.request();
  }

  Future<void> fetchSongs() async {
    deviceSongs = await _audioQuery.querySongs(
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );
    for (var song in deviceSongs) {
      if (song.fileExtension == 'mp3' ||
          song.fileExtension == 'AAC' ||
          song.fileExtension == 'FLAC' ||
          song.fileExtension == 'WAV') {
        sortedSongs.add(song);
      }
    }
    for (var audio in sortedSongs) {
      final song = Songs(
          id: audio.id.toString(),
          title: audio.displayNameWOExt,
          artist: audio.artist!,
          songPath: audio.uri!);
      await songBox.put(audio.id, song);
    }
    //create a Favorite songs if it is not created
    getFavSongs();
    //create recently played key if it is not created
    getRecentSong();
    //create most played key if it is not created
    getMostplayedSong();
  }

  Future getFavSongs() async {
    if (!playlistBox.keys.contains('Favorites')) {
      await playlistBox.put('Favorites', favSongs);
    }
  }

  Future getRecentSong() async {
    if (!playlistBox.keys.contains('Recents')) {
      await playlistBox.put('Recents', recentSongs);
    }
  }

  Future getMostplayedSong() async {
    if (!playlistBox.keys.contains('MostPlayed')) {
      await playlistBox.put('MostPlayed', mostPlayedSongs);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: TextLiquidFill(
          text: 'tunezz',
          waveColor: const Color.fromARGB(227, 18, 179, 219),
          boxBackgroundColor: Colors.black,
          textStyle: TextStyle(
            fontSize: width * 0.23,
            fontFamily: "Alegreya Sans",
          ),
        ),
      ),
    );
  }

  Future<void> gotoScreenHome() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ScreenHome()));
  }
}
