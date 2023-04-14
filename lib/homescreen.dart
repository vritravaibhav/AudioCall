import 'package:audiocall/roomcard.dart';
import 'package:audiocall/zegocloudscree.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController input = TextEditingController();
  TextEditingController roomIdinput = TextEditingController();
  TextEditingController roomName = TextEditingController();
  List<RoomCard> v = [];

  show(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              TextField(
                controller: roomName,
                decoration: InputDecoration(
                  hintText: "Enter your Custom room name",
                  // enabledBorder: OutlineInputBorder(borderSide: Divider.createBorderSide()); ,
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
              TextField(
                controller: roomIdinput,
                decoration: InputDecoration(
                  hintText: "Enter id seprated by ,",
                  // enabledBorder: OutlineInputBorder(borderSide: Divider.createBorderSide()); ,
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
              TextButton(
                  onPressed: () {
                    v.add(RoomCard(id: roomIdinput.text, name: roomName.text));
                    roomIdinput.clear();
                    roomName.clear();

                    setState(() {});

                    Navigator.pop(context);
                  },
                  child: Text('Create my room'))
            ],
          );
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final InputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return Scaffold(
      appBar: AppBar(
        title: Text('Audiocall'),
        leading: Icon(Icons.call),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: v.length,
              itemBuilder: (context, index) => v[index]),
          Flexible(
            child: Container(),
            flex: 2,
          ),
          TextField(
            controller: input,
            decoration: InputDecoration(
              hintText: "Enter id seprated by ,",
              focusedBorder: InputBorder,
              enabledBorder: InputBorder,
              contentPadding: EdgeInsets.all(20),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LivePage(
                            roomID: input.text,
                          )),
                );
              },
              child: Text(
                'Join call',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Flexible(
            child: Container(),
            flex: 2,
          ),
          InkWell(
            onTap: () {
              show(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: const Text("Create  Rooms"),
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: ShapeDecoration(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
