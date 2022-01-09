import 'package:clubhouse_ui/models/room.dart';
import 'package:clubhouse_ui/screens/room_page.dart';
import 'package:clubhouse_ui/widgets/user_photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clubhouse_ui/data.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({
    required this.room,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => RoomPage(room: room),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' ${room.club} 🏠'.toUpperCase(),
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                ),
                Text(
                  ' ${room.name}'.toUpperCase(),
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 120,
                        child: Stack(
                          children: [
                            myUserPhoto(
                              image: room.speakers[0].imageURL,
                              size: 65,
                            ),
                            Positioned(
                              left: 25,
                              top: 30,
                              child: myUserPhoto(
                                image: room.speakers[1].imageURL,
                                size: 60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers.map((e) => Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    '${e.firstName}  ${e.lastName} 💬',
                                    style: Theme.of(context)
                                        .textTheme
                                        .overline!
                                        .copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1,
                                        ),
                                  ),
                                )),
                            Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                  text:
                                      ('${room.speakers.length + room.followedBySpeakers.length + room.others.length} '),
                                ),
                                const WidgetSpan(
                                  child: Icon(
                                    CupertinoIcons.person_2_fill,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                ),
                                const TextSpan(text: ('  / ')),
                                TextSpan(
                                  text: (' ${room.speakers.length} '),
                                ),
                                const WidgetSpan(
                                  child: Icon(
                                    CupertinoIcons.chat_bubble_fill,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
