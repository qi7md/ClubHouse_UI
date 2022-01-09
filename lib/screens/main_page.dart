// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:clubhouse_ui/data.dart';
import 'package:clubhouse_ui/models/room.dart';
import 'package:clubhouse_ui/widgets/room_card.dart';
import 'package:clubhouse_ui/widgets/user_photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class main_page extends StatelessWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.search,
            size: 32,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.envelope_open,
              color: Colors.black,
              size: 32,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.calendar,
              color: Colors.black,
              size: 32,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.bell,
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
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(20),
            children: [
              ...roomList.map((e) => RoomCard(
                    room: e,
                  )),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  colors: <Color>[
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 50,
            right: 50,
            child: Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
                label: const Text(
                  'Start a Room',
                ),
                style: ElevatedButton.styleFrom(
                    onPrimary: Theme.of(context).primaryColor,
                    primary: Theme.of(context).accentColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
