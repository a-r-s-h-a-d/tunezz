import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/data_model/songs.dart';
import 'package:music_player/db_functions/db_functions.dart';
import 'package:music_player/functions/dialogbiox.dart';
import 'package:music_player/screens/screen_most_played.dart';
import 'package:music_player/screens/screen_recently_played.dart';
import 'package:music_player/widget/playlist_tile.dart';

class PlaylistTab extends StatelessWidget {
  PlaylistTab({super.key});

  Box<List> playlistBox = getPlaylistBox();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 70),
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
                        image: AssetImage('asset/images/recentlyplayed.jpeg'),
                        fit: BoxFit.fill),
                  ),
                  child: const Center(
                    child: Text(
                      'Recently Played',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.08,
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const MostlyPlayed())),
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
                          color: Colors.white, fontWeight: FontWeight.bold),
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
          ValueListenableBuilder(
            valueListenable: playlistBox.listenable(),
            builder: (context, value, child) {
              List keys = playlistBox.keys.toList();
              keys.remove('Favorites');
              keys.remove('MostPlayed');
              keys.remove('Recents');
              List playListName = [];
              playListName = playlistBox.values.toList();
              return ListView.builder(
                itemCount: playListName.length - 3,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  final String playlistName = keys[index];
                  List<Songs> songList =
                      playlistBox.get(playlistName)!.toList().cast<Songs>();
                  return PlaylistTile(
                      playlistname: playlistName, songlength: songList.length);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
