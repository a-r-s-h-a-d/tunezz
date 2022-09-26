import 'package:flutter/material.dart';
import 'package:music_player/widget/favorite_tile.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Column(
                children: const [
                  FavoriteListTile(
                    imagePath: 'asset/images/2002.jpeg',
                    song: '2002',
                    artist: 'Anne-Marie',
                  ),
                  FavoriteListTile(
                    imagePath: 'asset/images/21Guns.jpeg',
                    song: '21 Guns',
                    artist: 'Green Day',
                  ),
                  FavoriteListTile(
                    imagePath: 'asset/images/A thousand Years.jpg',
                    song: 'A thousand Years',
                    artist: 'Christina Perri',
                  ),
                  FavoriteListTile(
                    imagePath: 'asset/images/Arcade.jpeg',
                    song: 'Arcade',
                    artist: 'Duncan Laurence',
                  ),
                  FavoriteListTile(
                    imagePath: 'asset/images/As it was.jpeg',
                    song: 'As it was',
                    artist: 'Harry Styles',
                  ),
                  FavoriteListTile(
                    imagePath: 'asset/images/Blank space.jpeg',
                    song: 'Blank Space',
                    artist: 'Taylor Swift',
                  ),
                  FavoriteListTile(
                    imagePath: 'asset/images/blinding lights.png',
                    song: 'Binding Lights',
                    artist: 'The Weekend',
                  ),
                  FavoriteListTile(
                    imagePath: 'asset/images/can we kiss forever.jpeg',
                    song: 'C.W.K.F?',
                    artist: 'Kina,Adriana Horizon',
                  ),
                  FavoriteListTile(
                    imagePath: 'asset/images/Goosebumps.jpeg',
                    song: 'Goosebumps',
                    artist: 'Travis Scott,HVME',
                  ),
                  FavoriteListTile(
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
