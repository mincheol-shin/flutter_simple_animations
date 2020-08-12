import 'package:animatedbutton/animated_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
          iconTheme: IconThemeData(
        size: 24.0,
      )),
      home: AnimatedButtonExample()));
}

// ignore: must_be_immutable
class AnimatedButtonExample extends StatelessWidget {
  List<Color> exampleColorCode = [
    Colors.green[200],
    Colors.deepPurpleAccent,
    Colors.redAccent,
    Colors.brown,
    Colors.indigoAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Button Example"),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedButton(
                containerHeight: 50,
                containerWidth: 300,
                buttonDecoration: ButtonDecoration(
                  curves: Curves.fastOutSlowIn,
                  duration: Duration(milliseconds: 500),
                  beginningColor: exampleColorCode[index],
                  completionColor: Colors.grey.shade300,
                ),
                beginningWidget: Container(
                    alignment: Alignment.center,
                    child: Container(
                      child: Text(
                        "CheckList $index",
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
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: 0, color: Colors.transparent);
        },
        itemCount: 5,
      ),
    );
  }
}
