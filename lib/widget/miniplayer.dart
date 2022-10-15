import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:music_player/functions/recents.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MiniplayerTile extends StatefulWidget {
  const MiniplayerTile({
    super.key,
    required this.audioPlayer,
    required this.audioList,
  });
  final AssetsAudioPlayer audioPlayer;
  final List<Audio> audioList;
  @override
  State<MiniplayerTile> createState() => _MiniplayerTileState();
}

class _MiniplayerTileState extends State<MiniplayerTile> {
  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) {
      return element.path == fromPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.audioPlayer.builderCurrent(
      builder: (context, playing) {
        final myAudio = find(widget.audioList, playing.audio.assetAudioPath);
        return ListTile(
          leading: QueryArtworkWidget(
            id: int.parse(myAudio.metas.id!),
            type: ArtworkType.AUDIO,
            nullArtworkWidget: const Icon(
              Icons.music_note,
              color: Colors.white,
            ),
          ),
          title: Marquee(
            pauseDuration: const Duration(milliseconds: 100),
            direction: Axis.horizontal,
            textDirection: TextDirection.ltr,
            autoRepeat: true,
            child: Text(
              widget.audioPlayer.getCurrentAudioTitle,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //previous
              IconButton(
                onPressed: () async {
                  await widget.audioPlayer.previous();
                  Recents.addtoRecent(
                      context: context, id: myAudio.metas.id.toString());
                },
                icon: const Icon(Icons.skip_previous),
                color: Colors.white,
              ),
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
              //next
              IconButton(
                onPressed: () async {
                  await widget.audioPlayer.next(stopIfLast: true);
                  Recents.addtoRecent(
                      context: context, id: myAudio.metas.id.toString());
                },
                icon: const Icon(Icons.skip_next),
                color: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
