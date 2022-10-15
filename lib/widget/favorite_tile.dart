// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:music_player/data_model/songs.dart';
// import 'package:music_player/functions/favorites.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// // ignore: must_be_immutable
// class FavoriteListTile extends StatefulWidget {
//   const FavoriteListTile({
//     super.key,
//     required this.audioPlayer,
//     required this.index,
//     required this.songList,
//   });
//   final AssetsAudioPlayer audioPlayer;
//   final int index;
//   final List<Songs> songList;

//   @override
//   State<FavoriteListTile> createState() => _FavoriteListTileState();
// }

// class _FavoriteListTileState extends State<FavoriteListTile> {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: QueryArtworkWidget(
//         id: int.parse(widget.songList[widget.index].id),
//         type: ArtworkType.AUDIO,
//         nullArtworkWidget: const Icon(
//           Icons.music_note,
//           color: Colors.white,
//         ),
//       ),
//       title: Text(
//         widget.songList[widget.index].title,
//         style: const TextStyle(
//           color: Colors.white,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//       subtitle: Text(
//         widget.songList[widget.index].artist,
//         style: const TextStyle(
//           color: Colors.white,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//       trailing: IconButton(
//         onPressed: () {
//           FavFunction.addtoFavorites(
//               context: context, id: widget.songList[widget.index].id);
//           setState(() {
//             FavFunction.isFav(id: widget.songList[widget.index].id);
//           });
//         },
//         icon: Icon(
//           FavFunction.isFav(id: widget.songList[widget.index].id),
//           size: 35,
//           color: Colors.red,
//         ),
//       ),
//       // trailing: IconButton(
//       //   onPressed: () {
//       //     setState(() {
//       //       widget.isfav = !widget.isfav;
//       //     });
//       //   },
//       //   icon: widget.isfav
//       //       ? const Icon(
//       //           Icons.favorite,
//       //           color: Colors.red,
//       //           size: 35,
//       //         )
//       //       : const Icon(
//       //           Icons.favorite_border,
//       //           color: Colors.white,
//       //           size: 35,
//       //         ),
//       // ),
//       // onTap: () => Navigator.of(context).push(
//       //   MaterialPageRoute(
//       //     builder: (ctx) => MiniplayerTile(
//       //       audioList: ,
//       //       audioPlayer: widget.audioPlayer,
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }
