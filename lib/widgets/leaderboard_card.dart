import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget leaderboardCard(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;
  final width = MediaQuery.of(context).size.width;
  return Container(
    padding: EdgeInsets.all(12),
    margin: EdgeInsets.symmetric(vertical: 6),
    decoration: BoxDecoration(
      color: colorScheme.surface,
      border: Border.all(color: colorScheme.outline, width: width * 0.001),
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      children: [
        Text(
          "1",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
