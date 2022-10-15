import 'package:flutter/material.dart';
import 'package:music_player/widget/backgroundcolor.dart';
import 'package:music_player/widget/view_add_playlist_song.dart';

class ViewPlaylist extends StatelessWidget {
  const ViewPlaylist({
    super.key,
    required this.playlistname,
  });
  final String playlistname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(playlistname,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: bgColor(),
        ),
        child: ListView(
          children: const [
            // ViewPlaylistTile(
            //   imagePath: 'asset/images/Arcade.jpeg',
            //   song: 'Arcade',
            //   artist: 'Duncan Laurence',
            // ),
            // ViewPlaylistTile(
            //   imagePath: 'asset/images/As it was.jpeg',
            //   song: 'As it was',
            //   artist: 'Harry Styles',
            // ),
            // ViewPlaylistTile(
            //   imagePath: 'asset/images/Blank space.jpeg',
            //   song: 'Blank Space',
            //   artist: 'Taylor Swift',
            // ),
            // ViewPlaylistTile(
            //   imagePath: 'asset/images/blinding lights.png',
            //   song: 'Binding Lights',
            //   artist: 'The Weekend',
            // ),
            // ViewPlaylistTile(
            //   imagePath: 'asset/images/Goosebumps.jpeg',
            //   song: 'Goosebumps',
            //   artist: 'Travis Scott,HVME',
            // ),
            // ViewPlaylistTile(
            //   imagePath: 'asset/images/Happier.png',
            //   song: 'Happier',
            //   artist: 'Marshmello',
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (builder) {
                return Container(
                  color: Colors.transparent,
                  height: 350.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0))),
                        child: ListView(
                          children: const [
                            AddSongCurrentPlaylist(
                              imagePath: 'asset/images/2002.jpeg',
                              song: '2002',
                              artist: 'Anne-Marie',
                            ),
                            // AddSongCurrentPlaylist(
                            //   imagePath: 'asset/images/21Guns.jpeg',
                            //   song: '21 Guns',
                            //   artist: 'Green Day',
                            // ),
                            // AddSongCurrentPlaylist(
                            //   imagePath: 'asset/images/A thousand Years.jpg',
                            //   song: 'A thousand Years',
                            //   artist: 'Christina Perri',
                            // ),
                            // AddSongCurrentPlaylist(
                            //   imagePath: 'asset/images/Arcade.jpeg',
                            //   song: 'Arcade',
                            //   artist: 'Duncan Laurence',
                            // ),
                            // AddSongCurrentPlaylist(
                            //   imagePath: 'asset/images/As it was.jpeg',
                            //   song: 'As it was',
                            //   artist: 'Harry Styles',
                            // ),
                            // AddSongCurrentPlaylist(
                            //   imagePath: 'asset/images/Blank space.jpeg',
                            //   song: 'Blank Space',
                            //   artist: 'Taylor Swift',
                            // ),
                            // AddSongCurrentPlaylist(
                            //   imagePath: 'asset/images/blinding lights.png',
                            //   song: 'Binding Lights',
                            //   artist: 'The Weekend',
                            // ),
                            // AddSongCurrentPlaylist(
                            //   imagePath:
                            //       'asset/images/can we kiss forever.jpeg',
                            //   song: 'C.W.K.F?',
                            //   artist: 'Kina,Adriana Horizon',
                            // ),
                            // AddSongCurrentPlaylist(
                            //   imagePath: 'asset/images/Goosebumps.jpeg',
                            //   song: 'Goosebumps',
                            //   artist: 'Travis Scott,HVME',
                            // ),
                            // AddSongCurrentPlaylist(
                            //   imagePath: 'asset/images/Happier.png',
                            //   song: 'Happier',
                            //   artist: 'Marshmello',
                            // ),
                          ],
                        )),
                  ),
                );
              });
        },
        child: const Icon(Icons.queue_music_rounded),
      ),
    );
  }
}
