import 'package:flutter/material.dart';

import '../colors.dart';

class PlayListItem extends StatefulWidget {
  final String name;
  final String imageUrl;
  const PlayListItem({super.key, required this.name, required this.imageUrl});

  @override
  State<PlayListItem> createState() => _PlayListItemState();
}

class _PlayListItemState extends State<PlayListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 250,
      decoration: const BoxDecoration(
        color: AppColors.greyish,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            //TODO need to round image
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: EdgeInsets.all(10),
            child: Image.network(
              widget.imageUrl,
              width: 200,
              height: 180,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: Text(
              widget.name,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
