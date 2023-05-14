import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';
import 'package:flutter_spotify_africa_assessment/routes.dart';
import 'package:flutter_spotify_africa_assessment/widgets/header.dart';
import 'package:flutter_spotify_africa_assessment/widgets/playlist_item.dart';
import '../../../../api/spotify.dart';

// TODO: fetch and populate playlist info and allow for click-through to detail
// Feel free to change this to a stateful widget if necessary
class SpotifyCategory extends StatelessWidget {
  final String categoryId;

  const SpotifyCategory({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<dynamic> data = spotifyGetPlayLists();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Afro"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.about),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                AppColors.blue,
                AppColors.cyan,
                AppColors.green,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
          future: data,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              String name = 'Afro';
              String imageUrl =
                  'https://t.scdn.co/images/b505b01bbe0e490cbe43b07f16212892.jpeg';
              String playlistImage =
                  snapshot.data['playlists']['items'][1]['images'][0]['url'];
              String playlistName =
                  snapshot.data['playlists']['items'][1]['name'];
              return GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                    snapshot.data['playlists']['items'].length,
                    (index) {
                      // return
                      return PlayListItem(
                          name: snapshot.data['playlists']['items'][index]
                              ['name'],
                          imageUrl: snapshot.data['playlists']['items'][index]
                              ['images'][0]['url']);
                    },
                  ));
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Failed to load data'),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
