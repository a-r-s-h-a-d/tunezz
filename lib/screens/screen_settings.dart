import 'package:flutter/material.dart';
import 'package:music_player/widget/backgroundcolor.dart';
import 'package:music_player/widget/settings_tile.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: bgColor()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SettingsListTile(
                      labelText: 'About Me', icon: Icons.person),
                  const SettingsListTile(
                      labelText: 'Share App', icon: Icons.share),
                  SettingsListTile(
                    labelText: 'Notification',
                    icon: Icons.notifications,
                    trailingwidget: Switch(
                      activeColor: Colors.blue,
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                  ),
                  const SettingsListTile(
                      labelText: 'Terms & Conditions',
                      icon: Icons.warning_amber_outlined),
                  const SettingsListTile(
                      labelText: 'Privacy Policy', icon: Icons.policy_outlined),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: const [
                    Text(
                      'Version 1.1.2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
