import 'package:flutter/material.dart';
import 'package:Battery_Alarm/battery_level_page.dart';

void main() {
  return runApp(MaterialApp(
    title: "Battery Alarm",
    home: Scaffold(
      appBar: AppBar(title: Text("Battery Alarm")),
      body: BatteryLevelPage(),
    ),
  ));
}
