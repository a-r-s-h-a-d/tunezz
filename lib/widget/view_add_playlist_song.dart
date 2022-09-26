import 'package:flutter/material.dart';

class ViewPlaylistTile extends StatelessWidget {
  const ViewPlaylistTile(
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
      trailing: IconButton(
        icon: const Icon(
          Icons.remove,
          color: Colors.red,
        ),
        onPressed: () {
          var snackdemo = SnackBar(
            content: Text('$song removed from playlist'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 1),
            elevation: 10,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackdemo);
        },
      ),
    );
  }
}

//Add songs to the current playlist
class AddSongCurrentPlaylist extends StatefulWidget {
  const AddSongCurrentPlaylist(
      {required this.imagePath,
      required this.song,
      required this.artist,
      super.key});
  final String imagePath;
  final String song;
  final String artist;

  @override
  State<AddSongCurrentPlaylist> createState() => _AddSongCurrentPlaylistState();
}

class _AddSongCurrentPlaylistState extends State<AddSongCurrentPlaylist> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(widget.imagePath),
        radius: MediaQuery.of(context).size.width * 0.07,
      ),
      title: Text(
        widget.song,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      subtitle: Text(
        widget.artist,
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
      trailing: IconButton(
          icon: toggle
              ? const Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red,
                  size: 35,
                )
              : const Icon(
                  Icons.add_circle_outline,
                  color: Colors.green,
                  size: 35,
                ),
          onPressed: () {
            setState(() {
              // Here we changing the icon.
              toggle = !toggle;
            });
          }),
    );
  }
}
