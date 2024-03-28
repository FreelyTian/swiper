import 'package:flutter/material.dart';

class SwipeArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SomeSwipe();
}

class SomeSwipe extends State<SwipeArea> {
  int screenID = 0;
  int favoriteID = 0;
  late int totalScreens;

  @override
  void initState() {
    setMaxScreens(7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              setState(() {
                setFavorite(screenID);
              });
            },
            onDoubleTap: () {
              setState(() {
                loadFavorite();
              });
            },
            onPanEnd: (details) {
              print(details.velocity.pixelsPerSecond.dx);
              if (details.velocity.pixelsPerSecond.dx >= 0) {
                setState(() {
                  increaseScreenCount();
                });
              } else {
                setState(() {
                  decreaseScreenCount();
                });
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text(
                screenID.toString(),
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ))
        ]),
      ),
    );
  }

  void setMaxScreens(int newValue) {
    totalScreens = newValue;
  }

  void increaseScreenCount() {
    screenID++;
    print("aumentou pra $screenID");
  }

  void decreaseScreenCount() {
    screenID -= 1;
    print("diminuiu pra $screenID");
  }

  void setFavorite(int value) {
    favoriteID = value;
  }

  void loadFavorite() {
    screenID = favoriteID;
  }
}
