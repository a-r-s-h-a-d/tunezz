import 'package:flutter/material.dart';
import 'package:music_player/screens/screen_nowplaying.dart';

class FavoriteListTile extends StatelessWidget {
  const FavoriteListTile({
    super.key,
    required this.song,
    required this.artist,
    required this.imagePath,
  });
  final String song;
  final String artist;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
        radius: MediaQuery.of(context).size.width * 0.07,
      ),
      title: Text(song, style: const TextStyle(color: Colors.white)),
      subtitle: Text(artist, style: const TextStyle(color: Colors.white)),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.favorite,
          color: Colors.red,
          size: 35,
        ),
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
