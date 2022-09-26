import 'package:flutter/material.dart';
import 'package:music_player/functions/dialogbiox.dart';
import 'package:music_player/screens/screen_most_played.dart';
import 'package:music_player/screens/screen_recently_played.dart';
import 'package:music_player/widget/playlist_tile.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const RecentlyPlayed())),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage(
                                  'asset/images/recentlyplayed.jpeg'),
                              fit: BoxFit.fill),
                        ),
                        child: const Center(
                          child: Text(
                            'Recently Played',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const MostlyPlayed())),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage('asset/images/mostplayed.jpeg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Most Played',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Playlists',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () => showPlaylistAddAlertBox(context),
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                      iconSize: 30,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const PlaylistTile(playlistname: 'Happy Pills'),
                const PlaylistTile(playlistname: 'Drive'),
                const PlaylistTile(playlistname: 'Broken'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
