import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animated_widgets/widgets/opacity_animated.dart';
import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Container(
            height: 30,
            child: LinearProgressIndicator(
              backgroundColor: Colors.purple,
              valueColor:
                  new AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
              //minHeight: 30,
              value: 0.5,
            ),
            color: Colors.green),
        Expanded(
            child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: ShakeAnimatedWidget(
                        enabled: true,
                        duration: const Duration(milliseconds: 500),
                        shakeAngle: Rotation.deg(z: 40),
                        curve: Curves.linear,
                        child: Container(
                          color: Colors.white,
                          child: Image.asset('assets/images/down.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: OpacityAnimatedWidget.tween(
                        opacityEnabled: 1, //define start value
                        opacityDisabled: 0, //and end value
                        enabled: true, //bind with the boolean
                        child: Container(
                          color: Colors.grey,
                          child: Image.asset('assets/images/up.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.white)),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              width: width,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'xxx のこうげき！！\n9999のダメージ！！！\nyyyyはしっしんした！！！！\nわあああああああああああ！！！！！！！\n助けてええええええええええ',
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  totalRepeatCount: 4,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ),
            ),
          ),
        ),
        //Expanded(child: Container(color: Colors.white))
      ]),
    ));
  }
}
