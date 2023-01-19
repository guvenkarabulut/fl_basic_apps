import 'package:flutter/material.dart';
import '/constants/app_constant.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int lessonCount;
  const ShowAverage(
      {Key? key, required this.average, required this.lessonCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          lessonCount > 0 ? '$lessonCount' : 'please select an grade',
          style: Constants.bodyTextStyle,
        ),
        CircleAvatar(
          backgroundColor: Constants.mainColor,
          radius: 45,
          child: Text(
            average >= 0 ? '${average.toStringAsFixed(1)}' : '0.0',
            style: TextStyle(fontSize: 40),
          ),
        ),
        Text(
          'Average',
          style: Constants.bodyTextStyle,
        ),
      ],
    );
  }
}
