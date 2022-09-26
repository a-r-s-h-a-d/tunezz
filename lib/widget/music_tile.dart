import 'package:flutter/material.dart';
import 'package:music_player/functions/dialogbiox.dart';
import 'package:music_player/screens/screen_nowplaying.dart';

class MusicListTile extends StatelessWidget {
  const MusicListTile(
      {required this.imagePath,
      required this.song,
      required this.artist,
      super.key});
  final String imagePath;
  final String song;
  final String artist;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
        radius: MediaQuery.of(context).size.width * 0.07,
      ),
      title: Text(
        song,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      subtitle: Text(
        artist,
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
      trailing: PopupMenuButton(
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        color: Colors.grey,
        itemBuilder: (context) => [
          PopupMenuItem(
            child: InkWell(
              onTap: (() {
                var snackdemo = SnackBar(
                  content: Text('$song added to favorites'),
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 1),
                  elevation: 10,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackdemo);
              }),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Add to Favorites',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
          PopupMenuItem(
            child: InkWell(
              onTap: () => showAddtoplaylistBox(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Add to Playlist',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  Icon(
                    Icons.playlist_add,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => NowPlaying(
            song: song,
            artist: artist,
            imagePath: imagePath,
          ),
        ),
      ),
    );
  }
}
