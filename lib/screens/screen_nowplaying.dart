import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:music_player/data_model/songs.dart';
import 'package:music_player/functions/dialogbiox.dart';
import 'package:music_player/functions/favorites.dart';
import 'package:music_player/functions/recents.dart';
import 'package:music_player/widget/backgroundcolor.dart';
import 'package:music_player/widget/iconbutton.dart';
import 'package:on_audio_query/on_audio_query.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({
    super.key,
    //required this.imagePath,
    required this.songList,
    required this.index,
    required this.audioPlayer,
  });
  //final int imagePath;
  final List<Songs> songList;
  final int index;

  final AssetsAudioPlayer audioPlayer;
  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  List<Audio> audioList = [];
  bool isRepeat = false;
  bool isShuffle = false;

  void repeat() {
    if (isRepeat == true) {
      widget.audioPlayer.setLoopMode(LoopMode.single);
    } else {
      widget.audioPlayer.setLoopMode(LoopMode.playlist);
    }
    setState(() {
      isRepeat = !isRepeat;
    });
  }
  //convert uri to Audio

  void converturitoaudio() {
    for (var song in widget.songList) {
      audioList.add(
        Audio.file(song.songPath,
            metas: Metas(
              id: song.id.toString(),
            )),
      );
    }
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) {
      return element.path == fromPath;
    });
  }

  @override
  void initState() {
    converturitoaudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text(
          'Now Playing',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: widget.audioPlayer.builderCurrent(
        builder: (context, playing) {
          final myAudio = find(audioList, playing.audio.assetAudioPath);
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: nowplayingColor(),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                    QueryArtworkWidget(
                      id: int.parse(myAudio.metas.id!),
                      type: ArtworkType.AUDIO,
                      artworkHeight: MediaQuery.of(context).size.height * 0.3,
                      artworkWidth: MediaQuery.of(context).size.width * 0.6,
                      artworkFit: BoxFit.fill,
                      nullArtworkWidget: Icon(
                        Icons.music_note,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.height * 0.3,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: widget.audioPlayer.builderRealtimePlayingInfos(
                            builder: (context, infos) {
                          // Recents.addtoRecent(
                          //     context: context,
                          //     id: widget.songList[widget.index].id);
                          Duration currentposition = infos.currentPosition;
                          Duration totalduration = infos.duration;
                          return ProgressBar(
                            timeLabelTextStyle: const TextStyle(
                                color: Colors.white, fontSize: 16),
                            thumbColor: Colors.white,
                            baseBarColor: Colors.white,
                            progressBarColor: Colors.green,
                            thumbRadius: 7,
                            barHeight: 4,
                            progress: currentposition,
                            total: totalduration,
                            onSeek: (newPosition) {
                              Recents.addtoRecent(
                                  context: context,
                                  id: myAudio.metas.id.toString());
                              widget.audioPlayer.seek(newPosition);
                            },
                          );
                        })),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIconButton(
                            icon: widget.audioPlayer.isShuffling.value
                                ? Icons.shuffle_on_outlined
                                : Icons.shuffle,
                            onPressed: () {
                              setState(() {
                                widget.audioPlayer.toggleShuffle();
                              });
                            },
                            size: 35,
                          ),
                          CustomIconButton(
                              size: 35,
                              icon: Icons.skip_previous,
                              onPressed: () {
                                Recents.addtoRecent(
                                    context: context,
                                    id: myAudio.metas.id.toString());
                                widget.audioPlayer.previous();
                              }),
                          PlayerBuilder.isPlaying(
                              player: widget.audioPlayer,
                              builder: (context, isPlaying) {
                                return GestureDetector(
                                  onTap: () async {
                                    await widget.audioPlayer.playOrPause();
                                  },
                                  child: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                );
                              }),
                          CustomIconButton(
                              size: 35,
                              icon: Icons.skip_next,
                              onPressed: () {
                                Recents.addtoRecent(
                                    context: context,
                                    id: myAudio.metas.id.toString());
                                widget.audioPlayer.next(
                                  keepLoopMode: true,
                                  stopIfLast: true,
                                );
                              }),
                          CustomIconButton(
                              size: 35,
                              icon: isRepeat ? Icons.repeat_one : Icons.repeat,
                              onPressed: () {
                                setState(() {
                                  repeat();
                                });
                                widget.audioPlayer.toggleLoop();
                              }),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: IconButton(
                          icon: Icon(
                            FavFunction.isFav(id: myAudio.metas.id.toString()),
                            size: 40,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            FavFunction.addtoFavorites(
                                context: context,
                                id: myAudio.metas.id.toString());
                            setState(() {
                              FavFunction.isFav(
                                  id: myAudio.metas.id.toString());
                            });
                          }),
                      title: Center(
                        child: Text(
                          widget.audioPlayer.getCurrentAudioTitle,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      subtitle: Center(
                        child: Text(
                          widget.audioPlayer.getCurrentAudioArtist,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showAddtoplaylistBox(context);
                        },
                        icon: const Icon(Icons.add_box_outlined),
                        iconSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
