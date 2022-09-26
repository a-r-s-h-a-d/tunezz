import 'package:flutter/material.dart';
import 'package:music_player/functions/dialogbiox.dart';
import 'package:music_player/screens/screen_view_playlist.dart';

class PlaylistTile extends StatelessWidget {
  const PlaylistTile({super.key, required this.playlistname});
  final String playlistname;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ViewPlaylist(playlistname: playlistname))),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF3F9EA4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                //contentPadding: EdgeInsets.zero,
                leading: Text(
                  playlistname,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white),
                        onPressed: () =>
                            showPlaylistRenameAlertBox(context, playlistname)),
                    // icon: const Icon(Icons.edit, color: Colors.white)),
                    IconButton(
                        icon: const Icon(Icons.delete, color: Colors.white),
                        onPressed: () =>
                            showPlaylistDeleteAlertBox(context, playlistname)),
                  ],
                ),
              ),
              const ListTile(
                leading: Text(
                  '6 Songs',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
