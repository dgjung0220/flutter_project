import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {

  const CustomListItem({
    this.title,
    this.alarmSet,
    this.description
  });

  final String title;
  final String alarmSet;
  final String description;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

        ],
      )
    );
  }

}