// ignore_for_file: must_be_immutable

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/data_model/songs.dart';
import 'package:music_player/db_functions/db_functions.dart';
import 'package:music_player/functions/dialogbiox.dart';
import 'package:music_player/functions/favorites.dart';
import 'package:music_player/functions/recents.dart';
import 'package:music_player/screens/screen_nowplaying.dart';
import 'package:music_player/widget/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicListTile extends StatefulWidget {
  MusicListTile(
      {required this.songList,
      required this.index,
      super.key,
      required this.audioPlayer});
  final int index;
  List<Songs> songList = [];

  final AssetsAudioPlayer audioPlayer;

  @override
  State<MusicListTile> createState() => _MusicListTileState();
}

class _MusicListTileState extends State<MusicListTile> {
  Box<Songs> songBox = getSongBox();
  Box<List> playlistBox = getPlaylistBox();
  List<Audio> audioList = [];
  void convertsongtoaudio() {
    for (var song in widget.songList) {
      audioList.add(
        Audio.file(
          song.songPath,
          metas: Metas(
            id: song.id.toString(),
            title: song.title,
            artist: song.artist,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    convertsongtoaudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: QueryArtworkWidget(
        id: int.parse(widget.songList[widget.index].id),
        type: ArtworkType.AUDIO,
        nullArtworkWidget: const Icon(
          Icons.music_note,
          color: Colors.white,
        ),
      ),
      title: Text(
        widget.songList[widget.index].title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Text(
        widget.songList[widget.index].artist == "<unknown>"
            ? "Unknown Artist"
            : widget.songList[widget.index].artist,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: PopupMenuButton(
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        color: Colors.grey,
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Center(
              child: IconButton(
                onPressed: () {
                  FavFunction.addtoFavorites(
                      context: context, id: widget.songList[widget.index].id);
                  setState(() {
                    FavFunction.isFav(id: widget.songList[widget.index].id);
                  });
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  FavFunction.isFav(id: widget.songList[widget.index].id),
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          PopupMenuItem(
            child: InkWell(
              onTap: () => showAddtoplaylistBox(context),
              child: Center(
                child: Column(
                  children: const [
                    Icon(
                      Icons.playlist_add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        //FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
        Recents.addtoRecent(
            context: context, id: widget.songList[widget.index].id);
        showBottomSheet(
          enableDrag: false,
          context: context,
          builder: (context) {
            widget.audioPlayer.open(
                Playlist(
                  audios: audioList,
                  startIndex: widget.index,
                ),
                showNotification: true,
                autoStart: true);
            return Container(
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => NowPlaying(
                            songList: widget.songList,
                            index: widget.index,
                            audioPlayer: widget.audioPlayer,
                          )),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MiniplayerTile(
                      audioPlayer: widget.audioPlayer,
                      audioList: audioList,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
