import 'package:audiocall/zegocloudscree.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final String id;
  final String name;
  const RoomCard({super.key , required this.id,required this.name});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LivePage(roomID: id,)),
  );
    },
    
     child:Text(name,style: TextStyle(
      fontWeight: FontWeight.bold,
     ),) 
     );
  }
}