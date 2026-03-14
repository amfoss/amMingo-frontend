
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Friendverification extends StatefulWidget {
  const Friendverification({super.key});

  @override
  State<Friendverification> createState() => _FriendVerification();
}

class _FriendVerification extends State<Friendverification>{
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        title: Column(

          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: height*0.013),
            Text(
              "Verify Friend",
              style: TextStyle(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Tile A verification",
              style: TextStyle(
                color: colorScheme.primary,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: height*0.02),
                Text(
                  "Friend's Name",
                  style: TextStyle(
                    color: colorScheme.surface,
                    fontSize: 15
                  ),
                ),
              ],
            ),
          ),
    ),
    );
  }
  
}