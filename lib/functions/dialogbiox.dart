import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/data_model/songs.dart';
import 'package:music_player/db_functions/db_functions.dart';

//Playlist--->Add/create
showPlaylistAddAlertBox(BuildContext context) {
  TextEditingController textController = TextEditingController();
  Box<List> playlistBox = getPlaylistBox();

  Future<void> createNewPlaylist() async {
    List<Songs> songList = [];
    final String playlistName = textController.text.trim();
    if (playlistName.isEmpty) {
      return;
    } else {
      await playlistBox.put(playlistName, songList);
    }
  }

  return showDialog(
      context: context,
      builder: (context) {
        final formKey = GlobalKey<FormState>();
        return Form(
          key: formKey,
          child: AlertDialog(
            backgroundColor: const Color.fromARGB(255, 41, 40, 40),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: const Text(
              'Create Playlist',
              style: TextStyle(color: Colors.white),
            ),
            content: TextFormField(
              autofocus: true,
              style: const TextStyle(color: Colors.white),
              controller: textController,
              validator: (value) {
                final key = getPlaylistBox().keys.toList();
                if (value == null || value.isEmpty) {
                  return 'Field is Empty';
                }
                if (key.contains(value)) {
                  return '$value is Already existed';
                }
                return null;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                //fillColor: Color.fromARGB(255, 68, 67, 67),
                //filled: true,
                hintText: 'New Playlist',
                hintStyle: TextStyle(color: Colors.grey[50]),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                    label: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await createNewPlaylist();
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                      }
                    },
                    icon: const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    label: const Text(
                      'OK',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      });
}

//Playlist---->Rename

// class PlaylistRenameAlertBox extends StatefulWidget {
//   const PlaylistRenameAlertBox({super.key});

//   @override
//   State<PlaylistRenameAlertBox> createState() => _PlaylistRenameAlertBoxState();
// }

// class _PlaylistRenameAlertBoxState extends State<PlaylistRenameAlertBox> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

showPlaylistRenameAlertBox(BuildContext context, playlistname) {
  TextEditingController textController =
      TextEditingController(text: playlistname);
  String newPlaylistName = playlistname;
  Box<List> playlistBox = getPlaylistBox();
  List<Songs> songList = [];
  final keys = playlistBox.keys.toList();
  final formKey = GlobalKey<FormState>();
  return showDialog(
    context: context,
    builder: (context) => Form(
      key: formKey,
      child: AlertDialog(
        backgroundColor: const Color.fromARGB(255, 41, 40, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text(
          'Edit Playlist',
          style: TextStyle(color: Colors.white),
        ),
        content: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'field is empty';
            }
            if (keys.contains(keys)) {
              return '$value is already existed in playlist';
            }
            return null;
          },
          autofocus: true,
          controller: textController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            //hintText: playlistname,
            hintStyle: TextStyle(color: Colors.grey[50]),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                label: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    newPlaylistName = textController.text.trim();
                  }
                  playlistBox.put(newPlaylistName, songList);
                  playlistBox.delete(playlistname);
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                label: const Text(
                  'Rename',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

//Playlist---->Delete

showPlaylistDeleteAlertBox(BuildContext context, playlistname) {
  final playlistBox = getPlaylistBox();
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: const Text(
        'Delete Playlist',
        style: TextStyle(color: Colors.white),
      ),
      content: Text(
        'Are you sure you want to delete $playlistname',
        style: const TextStyle(color: Colors.grey, fontSize: 14),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              ),
              label: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                playlistBox.delete(playlistname);
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.check,
                color: Colors.green,
              ),
              label: const Text(
                'OK',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

//playlist---->add to playlist(now playing)
showAddtoplaylistBox(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      contentPadding: const EdgeInsets.only(left: 25, right: 25),
      title: const Center(
        child: Text(
          "Add to Playlist",
          style: TextStyle(color: Colors.white),
        ),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: SizedBox(
        height: 110,
        width: 200,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 5),
              Center(
                child: TextButton(
                  child: const Text(
                    'Happy Pills',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                  ),
                  onPressed: () {},
                ),
              ),
              Center(
                child: TextButton(
                  child: const Text(
                    'Drive',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                  ),
                  onPressed: () {},
                ),
              ),
              Center(
                child: TextButton(
                  child: const Text(
                    'Broken',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Create Playlist',
                style: TextStyle(color: Colors.green, fontSize: 18)),
            IconButton(
              onPressed: () {
                showPlaylistAddAlertBox(context);
              },
              icon: const Icon(
                Icons.playlist_add,
                color: Colors.green,
                size: 30,
              ),
            )
          ],
        )
      ],
    ),
  );
}
