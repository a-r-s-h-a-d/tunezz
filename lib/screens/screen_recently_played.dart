import 'package:flutter/material.dart';
import 'package:music_player/widget/backgroundcolor.dart';
import 'package:music_player/widget/recent_most_played_tile.dart';

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed({super.key});

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
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: bgColor(),
        ),
        child: ListView(
          children: const [
            RecentlyPlayedTile(
              imagePath: 'asset/images/2002.jpeg',
              song: '2002',
              artist: 'Anne-Marie',
            ),
            RecentlyPlayedTile(
              imagePath: 'asset/images/21Guns.jpeg',
              song: '21 Guns',
              artist: 'Green Day',
            ),
            RecentlyPlayedTile(
              imagePath: 'asset/images/Arcade.jpeg',
              song: 'Arcade',
              artist: 'Duncan Laurence',
            ),
          ],
        ),
      ),
    );
  }
}
