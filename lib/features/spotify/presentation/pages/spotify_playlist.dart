import 'package:flutter/material.dart';

//TODO: complete this page - you may choose to change it to a stateful widget if necessary
class SpotifyPlaylist extends StatefulWidget {
  final String playListID;

  const SpotifyPlaylist({
    Key? key,
    required this.playListID,
  }) : super(key: key);

  @override
  State<SpotifyPlaylist> createState() => _SpotifyPlaylistState();
}

class _SpotifyPlaylistState extends State<SpotifyPlaylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Center(
          child: Text(widget.playListID),
        ),
      ),
    );
  }
}
