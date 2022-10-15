import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/data_model/songs.dart';
import 'package:music_player/db_functions/db_functions.dart';
import 'package:music_player/functions/mostplayed.dart';

class Recents {
  static Box<Songs> songBox = getSongBox();
  static Box<List> playlistBox = getPlaylistBox();

  static addtoRecent({required context, required String id}) async {
    List<Songs> deviceSong = songBox.values.toList().cast();
    List<Songs> recentSongsList =
        playlistBox.get('Recents')!.toList().cast<Songs>();
    Songs recentSong = deviceSong.firstWhere((song) => song.id.contains(id));
    // <--------------------------------------------------------------------->
    //                      Counting for MostPlayed
    recentSong.playedCount = recentSong.playedCount! + 1;
    //                      Calling MostPlayed
    MostPlayed.addtoMostPlayed(context: context, id: id);
    // <--------------------------------------------------------------------->
    if (recentSongsList.length > 10) {
      recentSongsList.removeLast();
    }
    if (recentSongsList.where((song) => song.id == recentSong.id).isEmpty) {
      recentSongsList.insert(0, recentSong);
      await playlistBox.put('Recents', recentSongsList);
    } else {
      recentSongsList.removeWhere((song) => song.id == recentSong.id);
      recentSongsList.insert(0, recentSong);
      await playlistBox.put('Recents', recentSongsList);
    }
  }

  static removefromrecentSongsList() async {
    List<Songs> recentSongsList =
        playlistBox.get('Recents')!.toList().cast<Songs>();
    recentSongsList.clear();
    await playlistBox.put('Recents', recentSongsList);
  }
}
