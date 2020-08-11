import 'package:animatedbutton/animated_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AnimatedButtonExample());
}

// ignore: must_be_immutable
class AnimatedButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          iconTheme: IconThemeData(
        size: 24.0,
      )),
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: AnimatedButton(
            containerHeight: 100,
            containerWidth: 300,
            buttonDecoration: ButtonDecoration(
              curves: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 1000),
              beginningColor: Colors.blue,
              completionColor: Colors.orange,
            ),
            beginningWidget: Container(
                alignment: Alignment.center,
                child: Container(
                  child: Text(
                    "Beginning",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )),
            completionWidget: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      )),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Completion",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
