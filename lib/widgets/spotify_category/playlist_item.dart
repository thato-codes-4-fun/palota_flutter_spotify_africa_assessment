import 'package:flutter/material.dart';

import '../../colors.dart';

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
      padding: const EdgeInsets.all(5),
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
        color: AppColors.greyish,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 170,
              fit: BoxFit.fill,
            ),
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Text(
                widget.name,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
