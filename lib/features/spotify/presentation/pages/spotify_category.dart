import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';
import 'package:flutter_spotify_africa_assessment/routes.dart';
import 'package:flutter_spotify_africa_assessment/widgets/spotify_category/header.dart';
import 'package:flutter_spotify_africa_assessment/widgets/spotify_category/playlist_item.dart';
import '../../../../api/spotifyApi.dart';

class SpotifyCategory extends StatefulWidget {
  final String categoryId;

  const SpotifyCategory({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  State<SpotifyCategory> createState() => _SpotifyCategoryState();
}

class _SpotifyCategoryState extends State<SpotifyCategory> {
  int offset = 0;
  int limit = 10;
  List data = [];
  bool isLoading = false;
  String name = 'Afro';
  String imageUrl =
      'https://t.scdn.co/images/b505b01bbe0e490cbe43b07f16212892.jpeg';

  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    fetchData();
  }

  Future<void> fetchData() async {
    var playList = await spotifyGetPlayLists(offset, limit);
    setState(() {
      data += playList;
    });
  }

  void _scrollListener() async {
    if (isLoading) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
      });
      offset += 10;
      await fetchData();
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                toolbarHeight: 80,
                title:
                    PlaylistHeader(imageUrl: imageUrl, name: widget.categoryId),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 30),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 0.8,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (index < data.length) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                AppRoutes.spotifyPlaylist,
                                arguments: data[index]['id']);
                          },
                          child: PlayListItem(
                              name: data[index]['name'],
                              imageUrl: data[index]['images'][0]['url']),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                    childCount: isLoading ? data.length + 1 : data.length,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
