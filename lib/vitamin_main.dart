import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'constant.dart';

class VitaminMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VitainMainState();
}

class _VitainMainState extends State<VitaminMain> {
  final Set<String> _isEated = Set<String>();
  final Constant getC = Constant();

  final List<String> days = ['Morning', 'Afternoon', 'Evening'];
  Map<String, bool> _alarmSettingMap = Map<String, bool>();

  @override
  Widget build(BuildContext context) {

    _alarmSettingMap = {
      getC.MORNING : false,
      getC.AFTERNOON : false,
      getC.EVENING : false,
    };

    return Scaffold(
      appBar: AppBar(title: Text('My Vitamin')),
      body: Column(
        children: [
          Card(child: ListTile(title: Text(new DateFormat().add_yMMMEd().format(new DateTime.now()).toString(), textAlign: TextAlign.center))),
          Flexible(child: _buildDayList())],
      )
    );
  }

  Widget _buildDayList() {
    return ListView.builder(
      itemExtent: 150.0,
      itemCount: days.length,
      itemBuilder: (context, index) {
        return _buildRow(days[index]);
      },
    );
  }

  Widget _buildRow(String key) {
    final bool alreadyEated  = _isEated.contains(key);

    return Card(
      child: ListTile(
        title: Text(key, textScaleFactor: 1.3,),
        subtitle: Text('알람 설정'),
        trailing: Icon(alreadyEated? Icons.favorite : Icons.favorite_border, color: Colors.pink,),
        onTap: () {
          setState(() {
            setEated(key.toString());
          });
        },
        onLongPress: () {
          Future<TimeOfDay> selectedTime = showTimePicker(
            initialTime: TimeOfDay.now(),
            context: context,
          );

          print(selectedTime.then((value) => printTime(key.toString(), value)));
        },
      ),
    );
  }

  void printTime(String key, TimeOfDay now) {
    print(key);
    print(now.hour);
    print(now.minute);
  }

  void setEated(String key) {
    if (_isEated.contains(key)) {
      _isEated.remove(key);
    } else {
      _isEated.add(key);
    }

    print(_isEated.toList());
  }
}
