import 'package:clubhouse_ui/widgets/user_photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomPhoto extends StatelessWidget {
  final String name;
  final String imageurl;
  final double size;
  final bool ismuted;
  final bool isnew;

  const RoomPhoto(
      {required this.name,
      required this.imageurl,
      this.size = 70,
      this.isnew = false,
      this.ismuted = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentUser;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myUserPhoto(image: imageurl, size: size),
              ),
              if (isnew)
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: .2,
                          ),
                        ],
                      ),
                      child: const Icon(
                          IconData(0xe149, fontFamily: 'MaterialIcons'))),
                ),
              if (ismuted)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: .2,
                        ),
                      ],
                    ),
                    child: Icon(
                      CupertinoIcons.mic_off,
                    ),
                  ),
                ),
            ],
          ),
        ),
        Flexible(
          child: Text(
            '${name}.',
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
