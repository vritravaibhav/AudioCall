import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

class LivePage extends StatelessWidget {
  final String roomID;
  final bool isHost;

  const LivePage({Key? key, required this.roomID, this.isHost = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveAudioRoom(
        appID: 1076165878, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: 'd9271f1918600c5d7b49da37f4f62d1e64dce59935fab5981180a3e0b9346477', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: FirebaseAuth.instance.currentUser!.uid,
        userName: 'Anonymous',
        roomID: roomID,
        config: isHost
            ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
            : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience(),
      ),
    );
  }
}