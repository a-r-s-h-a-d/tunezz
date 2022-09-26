import 'package:flutter/material.dart';

//Playlist--->Add/create
showPlaylistAddAlertBox(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: const Text(
        'Create Playlist',
        style: TextStyle(color: Colors.white),
      ),
      content: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            // fillColor: Color.fromARGB(255, 68, 67, 67),
            // filled: true,
            hintText: 'New Playlist',
            hintStyle: TextStyle(color: Colors.grey[50])),
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
              onPressed: () {},
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

//Playlist---->Rename

showPlaylistRenameAlertBox(BuildContext context, playlistname) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: const Text(
        'Edit Playlist',
        style: TextStyle(color: Colors.white),
      ),
      content: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: playlistname,
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
              onPressed: () {},
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
  );
}

//Playlist---->Delete

showPlaylistDeleteAlertBox(BuildContext context, playlistname) {
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
              onPressed: () {},
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
      content: Container(
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
