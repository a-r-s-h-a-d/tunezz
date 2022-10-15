// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:music_player/data_model/songs.dart';
// import 'package:music_player/db_functions/db_functions.dart';
// import 'package:music_player/widget/backgroundcolor.dart';
// import 'package:music_player/widget/music_tile.dart';

// class ScreenSearch extends StatefulWidget {
//   const ScreenSearch({
//     required this.audioPlayer,
//     super.key,
//   });
//   final AssetsAudioPlayer audioPlayer;
//   @override
//   State<ScreenSearch> createState() => _ScreenSearchState();
// }

// class _ScreenSearchState extends State<ScreenSearch> {
//   Box<Songs> songBox = getSongBox();
//   List<Songs> deviceSongs = [];
//   List<Songs> searchedSongs = [];

//   @override
//   void initState() {
//     super.initState();
//     deviceSongs = songBox.values.toList().cast<Songs>();
//     searchedSongs = List.from(deviceSongs);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () => Navigator.of(context).pop(),
//           icon: const Icon(Icons.arrow_back_ios_new),
//           color: Colors.white,
//         ),
//         title: const Text(
//           'Search',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: bgColor(),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding:
//                 const EdgeInsets.only(bottom: 70, top: 10, left: 10, right: 10),
//             child: Column(
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.08,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     border: Border.all(color: Colors.white),
//                     borderRadius: const BorderRadius.all(Radius.circular(15)),
//                   ),
//                   child: Center(
//                     child: TextField(
//                       onChanged: (value) => searchSongfomDb(value),
//                       decoration: const InputDecoration(
//                         prefixIcon: Icon(
//                           Icons.search,
//                           color: Colors.black,
//                         ),
//                         hintText: ' Search Songs',
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: (searchedSongs.isEmpty)
//                       ? const Center(
//                           child: Text('No Songs Found'),
//                         )
//                       : ListView.builder(
//                           itemBuilder: (context, index) {
//                             return MusicListTile(
//                               songList: searchedSongs,
//                               index: index,
//                               audioPlayer: widget.audioPlayer,
//                             );
//                           },
//                           itemCount: searchedSongs.length,
//                         ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // void searchSongs(String value) {
//   //   setState(() {
//   //     searchedSongs = deviceSongs
//   //         .where(
//   //             (song) => song.title.toLowerCase().contains(value.toLowerCase()))
//   //         .toList();
//   //   });
//   // }

//   searchSongfomDb(String searchSong) {
//     setState(() {
//       searchedSongs = deviceSongs
//           .where((song) =>
//               song.title.toLowerCase().contains(searchSong.toLowerCase()))
//           .toList();
//     });
//   }
// }
