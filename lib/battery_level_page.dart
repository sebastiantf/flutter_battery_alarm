import 'package:flutter/material.dart';
import 'package:battery/battery.dart';

class BatteryLevelPage extends StatefulWidget {
  @override
  _BatteryLevelPageState createState() => _BatteryLevelPageState();
}

class _BatteryLevelPageState extends State<BatteryLevelPage> {
  final Battery _battery = Battery();

  BatteryState _batteryState;
  int _batteryLevel;

  void _getBatteryLevel() async {
    var level;

    level = await _battery.batteryLevel;

    this.setState(() {
      _batteryLevel = level;
    });

    _battery.onBatteryStateChanged.listen((BatteryState state) async {
      level = await _battery.batteryLevel;
      this.setState(() {
        _batteryLevel = level;
        _batteryState = state;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _getBatteryLevel();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(_batteryLevel.toString())],
      ),
    );
  }
}
