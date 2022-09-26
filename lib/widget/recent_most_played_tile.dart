import 'package:flutter/material.dart';
import 'package:music_player/screens/screen_nowplaying.dart';

class RecentlyPlayedTile extends StatelessWidget {
  const RecentlyPlayedTile({
    super.key,
    required this.imagePath,
    required this.song,
    required this.artist,
  });
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

class MostPlayedTile extends StatelessWidget {
  const MostPlayedTile({
    super.key,
    required this.imagePath,
    required this.song,
    required this.artist,
  });
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
