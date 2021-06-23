import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.cyan,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //TODO: Manta Ray here
            Container(
                decoration: BoxDecoration(
              color: Colors.cyan,
            )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("Loading..."),
            )
          ],
        ),
      ),
    );
  }
}
