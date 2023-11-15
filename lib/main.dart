import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Room {
  String name;
  bool hasItem;

  Room({required this.name, required this.hasItem});
}

class Item {
  String name;

  Item({required this.name});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Room with Item',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RoomScreen(),
    );
  }
}

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  Room currentRoom = Room(name: 'Living Room', hasItem: true);
  Item? pickedItem;

  void pickUpItem() {
    setState(() {
      pickedItem = Item(name: 'Key');
      currentRoom.hasItem = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room with Item'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Current Room: ${currentRoom.name}'),
            SizedBox(height: 20),
            Text(currentRoom.hasItem
                ? 'Item in the Room: Key'
                : 'No item in the room'),
            SizedBox(height: 20),
            pickedItem != null
                ? Text('You picked up the ${pickedItem!.name}!')
                : ElevatedButton(
              onPressed: currentRoom.hasItem ? pickUpItem : null,
              child: Text('Pick up item'),
            ),
          ],
        ),
      ),
    );
  }
}
