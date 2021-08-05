import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String error;
  const ErrorDialog({this.title = "Error", required this.error, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Container(
        //Theme.of(context).primaryColorDark
        color: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.sentiment_dissatisfied,
                color: Colors.grey,
              ),
            ),
            ...error.split("\n").map((line) => lineWidget(line)).toList()
          ],
        ),
      ),
    );
  }

  Widget lineWidget(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          text,
          style: TextStyle(color: Colors.grey),
        ),
      );
}
