import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/api/spotifyApi.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';

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
  late Future<dynamic> playlist;
  @override
  void initState() {
    super.initState();
    playlist = spotifyGetSpecificPlayList(widget.playListID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: playlist,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              String description = snapshot.data['description'];
              String image = snapshot.data['images'][0]['url'];
              String name = snapshot.data['name'];
              int followers = snapshot.data['followers']['total'];
              List<dynamic> tracks = snapshot.data['tracks']['items'];
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      //image
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.greyish,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(10),
                        width: 295,
                        height: 335,
                        child: Column(children: [
                          Image.network(
                            image,
                            width: 263,
                            height: 263,
                          ),
                          Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 29,
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          description,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.greyish,
                              ),
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 32,
                              child: Container(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Text(
                                  '$followers  Followers',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                          width: 326,
                          height: 4,
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
                          )),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error fetching playlist data'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
