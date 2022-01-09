import 'dart:math';

import 'package:clubhouse_ui/data.dart';
import 'package:clubhouse_ui/models/room.dart';
import 'package:clubhouse_ui/widgets/room_card.dart';
import 'package:clubhouse_ui/widgets/room_photo.dart';
import 'package:clubhouse_ui/widgets/user_photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomPage extends StatelessWidget {
  Room room;

  RoomPage({required this.room, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 130,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            CupertinoIcons.chevron_down,
            color: Colors.black,
          ),
          label: const Text(
            'Hallway',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.doc,
              color: Colors.black,
              size: 32,
            ),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: myUserPhoto(image: currentUser.imageURL, size: 35),
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${room.club} 🏠',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const Icon(
                          CupertinoIcons.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Text(
                    room.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                children: room.speakers
                    .map((e) => RoomPhoto(
                          name: e.firstName,
                          imageurl: e.imageURL,
                          size: 66,
                          ismuted: Random().nextBool(),
                          isnew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: const Text(
                ' Followed by Speakers',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontSize: 14,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                childAspectRatio: .7,
                children: room.followedBySpeakers
                    .map((e) => RoomPhoto(
                          name: e.firstName,
                          imageurl: e.imageURL,
                          size: 66,
                          ismuted: false,
                          isnew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: const Text(
                ' Others',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontSize: 14,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                childAspectRatio: .7,
                children: room.others
                    .map((e) => RoomPhoto(
                          name: e.firstName,
                          imageurl: e.imageURL,
                          size: 66,
                          ismuted: false,
                          isnew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverPadding(padding: EdgeInsets.all(50))
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                '✌🏽 Leave Quietly',
              ),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.all(12),
                  primary: Colors.red,
                  backgroundColor: Colors.grey[100],
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
            ),
            Row(
              children: [
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20)),
                    child: const Icon(
                      CupertinoIcons.add,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20)),
                    child: const Icon(
                      CupertinoIcons.hand_raised,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
