import 'package:flutter/material.dart';
import 'package:hms_sdk/hms_sdk.dart';
import 'package:hmssdk_flutter/hmssdk_flutter.dart';

class JoinAudioRoomScreen extends StatefulWidget {
  final String joiningLink;

  const JoinAudioRoomScreen({required this.joiningLink, Key? key})
      : super(key: key);

  @override
  _JoinAudioRoomScreenState createState() => _JoinAudioRoomScreenState();
}

class _JoinAudioRoomScreenState extends State<JoinAudioRoomScreen> {
  late HMSSDK hmsSdk;

  @override
  void initState() {
    super.initState();
    initializeSDK();
    joinAudioRoom();
  }

  @override
  void dispose() {
    hmsSdk.leave();
    super.dispose();
  }

  void initializeSDK() {
    // Initialize the SDK with your 100ms.live credentials
    hmsSdk = HMSSDK(
      appID: 'YOUR_APP_ID',
      token: 'https://prod-in2.100ms.live/hmsapi/manav-lukar-audioroom-1441.app.100ms.live/',
      userID: 'YOUR_USER_ID',
      roomID: '6497eed15892a6f3dcaae3c2',
    );

    // Add event listeners for room events
    hmsSdk.addHMSListener(
      onJoin: (HMSRoom room) {
      },
      onLeave: (HMSRoom room) {
      },
      onError: (HMSRoom room, HMSError error) {
      },
    );
  }

  void joinAudioRoom() {

    hmsSdk.join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joining Audio Room'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
