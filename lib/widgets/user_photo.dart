import 'package:flutter/material.dart';

class myUserPhoto extends StatelessWidget {
  final String image;
  final double size;

  const myUserPhoto({
    required this.image,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2 - (size / 10)),
      child: Image(
        image: NetworkImage(image),
        height: size,
        width: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
