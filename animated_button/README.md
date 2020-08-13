# animatedbutton
This class enables developers to button animations with simple widgets.
<br><br>
##  :four_leaf_clover: Showcase
<img width = "200" src = "https://user-images.githubusercontent.com/55150540/90021821-b7aa3800-dcec-11ea-83e2-54096f0038fa.gif">

<br><br>

## :wrench: Usage

Need to include the import the package to the dart file where it will be used, refer the below command
```dart
import 'package:yourPackage/animated_button.dart';
```

### Basic Widget 
```dart
  AnimatedButton(
                  containerHeight: 50,
                  containerWidth: 300,
                  buttonDecoration: ButtonDecoration(
                    curves: Curves.fastOutSlowIn,
                    duration: Duration(milliseconds: 500),
                    beginningColor: exampleColorCode[index],
                    completionColor: Colors.grey.shade300,
                  ),
                  beginningWidget: Container(),
                  completionWidget: Container(),
                ),

```



### Complete example
```dart
  List<Color> exampleColorCode = [
    Colors.green[200],
    Colors.deepPurpleAccent,
    Colors.redAccent,
    Colors.brown,
    Colors.indigoAccent,
  ];


  Scaffold(
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

```

