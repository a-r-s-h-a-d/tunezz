import 'package:flutter/material.dart';
import 'package:music_player/screens/screen_nowplaying.dart';

class Miniplayer extends StatelessWidget {
  const Miniplayer({
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
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) =>
              NowPlaying(song: song, artist: artist, imagePath: imagePath))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
          ),
          height: MediaQuery.of(context).size.height * 0.1,
          width: double.infinity,
          child: Center(
            child: ListTile(
              leading: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.07,
                backgroundImage: AssetImage(imagePath),
              ),
              title: Text(
                song,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                artist,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_previous),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.pause),
                    iconSize: 40,
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_next),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
