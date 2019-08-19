import 'package:flutter/material.dart';
import 'package:flutter_battery_alarm/battery_level_page.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Battery Alarm")),
      body: BatteryLevelPage(),
    ),
  ));
}
