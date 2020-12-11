import 'package:chatroom/widgets/chat/messages.dart';
import 'package:chatroom/widgets/chat/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    final fbm = FirebaseMessaging();
    fbm.requestNotificationPermissions(); //needed for ios
    fbm.configure(
        //app running on foreground
        onMessage: (msg) {
      print(msg);
      return;
    },
        //app terminated or not running
        onLaunch: (msg) {
      print(msg);
      return;
    },
        //app running in background
        onResume: (msg) {
      print(msg);
      return;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatroom'),
        actions: [
          DropdownButton(
              items: [
                DropdownMenuItem(
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Logout')
                      ],
                    ),
                  ),
                  value: 'logout',
                )
              ],
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'logout') {
                  FirebaseAuth.instance.signOut();
                }
              })
        ],
      ),
      body: Container(
        child: Column(
          children: [
            //expanded sorts out child widget taking up much space ish vs its parent; textfield vs row in this case
            Expanded(child: Messages()),
            NewMessage()
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.add),
      //     onPressed: () async {
      //       FirebaseFirestore.instance
      //           .collection('chats/sEJazA42bMU3oyLpO3Rs/messages')
      //           .add({'text': 'This was added by clicking the button'});
      //     }),
    );
  }
}
