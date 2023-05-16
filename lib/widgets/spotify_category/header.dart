import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';

class PlaylistHeader extends StatefulWidget {
  final String imageUrl;
  final String name;
  const PlaylistHeader({super.key, required this.imageUrl, required this.name});

  @override
  State<PlaylistHeader> createState() => _PlaylistHeaderState();
}

class _PlaylistHeaderState extends State<PlaylistHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.greyish,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                    widget.imageUrl,
                  ),
                ),
                const SizedBox(
                  width: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Playlists',
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
