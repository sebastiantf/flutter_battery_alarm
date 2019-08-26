import 'package:flutter/material.dart';
import 'package:battery/battery.dart';
import 'package:ringtone/ringtone.dart';

class BatteryLevelPage extends StatefulWidget {
  @override
  _BatteryLevelPageState createState() => _BatteryLevelPageState();
}

class _BatteryLevelPageState extends State<BatteryLevelPage> {
  final Battery _battery = Battery();

  String _batteryState;
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
        _batteryState = _parseBatteryState(state);
      });
      if (state == BatteryState.full) {
        Ringtone.play();
      } else {
        Ringtone.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _getBatteryLevel();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _batteryLevel.toString() + "%",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            _batteryState.toString(),
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }

  String _parseBatteryState(BatteryState state) {
    var stateString;
    switch (state) {
      case BatteryState.charging:
        stateString = "Charging";
        break;
      case BatteryState.discharging:
        stateString = "Discharging";
        break;
      case BatteryState.full:
        stateString = "Fully Charged";
        break;
    }
    return stateString;
  }
}
