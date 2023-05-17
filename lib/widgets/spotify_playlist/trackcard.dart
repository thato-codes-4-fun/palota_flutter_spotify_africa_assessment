import 'package:flutter/material.dart';

Widget trackCard(
  String trackName,
  String imageUrl,
  int trackDuration,
  String trackArtist,
) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.only(left: 16, right: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //image
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 50,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  trackName.length > 14
                      ? '${trackName.substring(0, 13)}...'
                      : trackName,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  trackArtist,
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ],
        ),

        Text(
          formatTime(trackDuration),
        ),
      ],
    ),
  );
}

String formatTime(int totalMilliseconds) {
  int totalSeconds =
      (totalMilliseconds ~/ 1000) % 60; // Calculate total seconds
  int totalMinutes =
      (totalMilliseconds ~/ (1000 * 60)) % 60; // Calculate total minutes

  String formattedMinutes = totalMinutes.toString().padLeft(2, '0');
  String formattedSeconds = totalSeconds.toString().padLeft(2, '0');

  return '$formattedMinutes:$formattedSeconds';
}
