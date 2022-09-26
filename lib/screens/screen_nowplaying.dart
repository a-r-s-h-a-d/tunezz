import 'package:flutter/material.dart';
import 'package:music_player/functions/dialogbiox.dart';
import 'package:music_player/widget/backgroundcolor.dart';
import 'package:music_player/widget/iconButton.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({
    super.key,
    required this.song,
    required this.artist,
    required this.imagePath,
  });
  final String song;
  final String artist;
  final String imagePath;

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  double _currentvalue = 0;
  bool toggle = true;
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
      body: Container(
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
                Image(
                  image: AssetImage(widget.imagePath),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.height * 0.25,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                ListTile(
                    leading: IconButton(
                        icon: toggle
                            ? const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 35,
                              )
                            : const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 35,
                              ),
                        onPressed: () {
                          setState(() {
                            // Here we changing the icon.
                            toggle = !toggle;
                          });
                        }),
                    // leading: const Icon(Icons.favorite_border,
                    //     color: Colors.white, size: 35),
                    title: Center(
                      child: Text(
                        widget.song,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    subtitle: Center(
                      child: Text(
                        widget.artist,
                        style: const TextStyle(
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
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Slider(
                  activeColor: const Color.fromARGB(255, 145, 135, 135),
                  inactiveColor: Colors.white,
                  thumbColor: const Color.fromARGB(255, 145, 135, 135),
                  min: 0,
                  max: 1,
                  value: _currentvalue,
                  onChanged: (value) {
                    setState(() {
                      _currentvalue = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '0:00',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '4:30',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(icon: Icons.shuffle, onPressed: () {}),
                      CustomIconButton(
                          icon: Icons.skip_previous, onPressed: () {}),
                      CustomIconButton(icon: Icons.pause, onPressed: () {}),
                      CustomIconButton(icon: Icons.skip_next, onPressed: () {}),
                      CustomIconButton(icon: Icons.repeat, onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
