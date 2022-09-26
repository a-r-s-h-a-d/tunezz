import 'package:flutter/material.dart';
import 'package:music_player/widget/music_tile.dart';

class MyMusic extends StatelessWidget {
  const MyMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView(
            children: [
              Column(
                children: const [
                  MusicListTile(
                    imagePath: 'asset/images/2002.jpeg',
                    song: '2002',
                    artist: 'Anne-Marie',
                  ),
                  MusicListTile(
                    imagePath: 'asset/images/21Guns.jpeg',
                    song: '21 Guns',
                    artist: 'Green Day',
                  ),
                  MusicListTile(
                    imagePath: 'asset/images/A thousand Years.jpg',
                    song: 'A thousand Years',
                    artist: 'Christina Perri',
                  ),
                  MusicListTile(
                    imagePath: 'asset/images/Arcade.jpeg',
                    song: 'Arcade',
                    artist: 'Duncan Laurence',
                  ),
                  MusicListTile(
                    imagePath: 'asset/images/As it was.jpeg',
                    song: 'As it was',
                    artist: 'Harry Styles',
                  ),
                  MusicListTile(
                    imagePath: 'asset/images/Blank space.jpeg',
                    song: 'Blank Space',
                    artist: 'Taylor Swift',
                  ),
                  MusicListTile(
                    imagePath: 'asset/images/blinding lights.png',
                    song: 'Binding Lights',
                    artist: 'The Weekend',
                  ),
                  MusicListTile(
                    imagePath: 'asset/images/can we kiss forever.jpeg',
                    song: 'C.W.K.F?',
                    artist: 'Kina,Adriana Horizon',
                  ),
                  MusicListTile(
                    imagePath: 'asset/images/Goosebumps.jpeg',
                    song: 'Goosebumps',
                    artist: 'Travis Scott,HVME',
                  ),
                  MusicListTile(
                    imagePath: 'asset/images/Happier.png',
                    song: 'Happier',
                    artist: 'Marshmello',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
