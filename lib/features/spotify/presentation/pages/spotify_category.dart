import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';
import 'package:flutter_spotify_africa_assessment/routes.dart';
import 'package:flutter_spotify_africa_assessment/widgets/header.dart';
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
    Future<dynamic> data = spotifyApi();
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
              String name = snapshot.data['name'];
              String imageUrl = snapshot.data['icons'][0]['url'];
              return Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  //category row
                  PlaylistHeader(imageUrl: imageUrl, name: name),
                ],
              );
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
