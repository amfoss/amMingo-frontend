import 'package:flutter/material.dart';
import 'dart:async';

class GameMonitorScreen extends StatefulWidget {
  final String eventName;
  final int time;
  final String maxParticipants;
  const GameMonitorScreen({
    super.key,
    required this.eventName,
    required this.time,
    required this.maxParticipants,
  });
  @override
  State<GameMonitorScreen> createState() => _GameMonitorScreenState();
}

class _GameMonitorScreenState extends State<GameMonitorScreen> {
  int remainingSeconds = 0;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.time * 60;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0');
  int get hours => remainingSeconds ~/ 3600;
  int get minutes => (remainingSeconds % 3600) ~/ 60;
  int get seconds => remainingSeconds % 60;

  Widget timeBlock(String value, String label) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: colorScheme.outline, fontSize: 10)),
      ],
    );
  }

  Widget colon() {
    return Text(":", style: TextStyle(fontSize: 22, color: Colors.grey));
  }

  Widget activityCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorScheme.outline, width: width * 0.003),
        color: colorScheme.surface,
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 6, backgroundColor: colorScheme.primary),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Player activity update",
              style: TextStyle(
                color: colorScheme.onSurface,
                fontSize: width * 0.035,
              ),
            ),
          ),
          Text(
            "now",
            style: TextStyle(color: Colors.grey, fontSize: width * 0.03),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "AMINGO",
          style: TextStyle(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    widget.eventName.toUpperCase(),
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "EVENT DASHBOARD",
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: width * 0.03,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "GAME MONIT0R",
                    style: TextStyle(
                      color: colorScheme.onSurface,
                      fontSize: width * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: height * 0.15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: colorScheme.outline,
                      width: width * 0.005,
                    ),
                    color: colorScheme.surface,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "TIME LEFT",
                        style: TextStyle(color: colorScheme.onSurface),
                      ),
                      SizedBox(height: height * 0.01),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            timeBlock(twoDigits(hours), "HRS"),
                            colon(),
                            timeBlock(twoDigits(minutes), "MIN"),
                            colon(),
                            timeBlock(twoDigits(seconds), "SEC"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.01),
                Row(
                  children: [
                    Container(
                      height: height * 0.13,
                      width: width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: colorScheme.outline,
                          width: width * 0.005,
                        ),
                        color: colorScheme.surface,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "TILES DONE",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: width * 0.035,
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              "142",
                              style: TextStyle(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.05,
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              "--%",
                              style: TextStyle(
                                color: colorScheme.primary,
                                fontSize: width * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.07),
                    Container(
                      height: height * 0.13,
                      width: width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: colorScheme.outline,
                          width: width * 0.005,
                        ),
                        color: colorScheme.surface,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ACTIVE",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: width * 0.035,
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              "32",
                              style: TextStyle(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.05,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.07),
                    Container(
                      height: height * 0.13,
                      width: width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: colorScheme.outline,
                          width: width * 0.005,
                        ),
                        color: colorScheme.surface,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "MAX CAP",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: width * 0.035,
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              widget.maxParticipants.toString(),
                              style: TextStyle(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.05,
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              "LIMIT",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: width * 0.03,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Row(
                  children: [
                    Text(
                      "Live Activity Feed",
                      style: TextStyle(
                        color: colorScheme.onSurface,
                        fontSize: width * 0.05,
                      ),
                    ),
                    SizedBox(width: width * 0.17),
                    Text(
                      "LAST UPDATE: JUST NOW",
                      style: TextStyle(
                        fontSize: width * 0.025,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                activityCard(context),
                activityCard(context),
                activityCard(context),
                activityCard(context),
                activityCard(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
