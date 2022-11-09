import 'package:flutter/material.dart';
import 'package:slider_captcha/slider_capchar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SliderController controller = SliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: SliderCaptcha(
            controller: controller,
            image: Image.asset(
              'assets/image.jpeg',
              fit: BoxFit.fitWidth,
            ),
            title: "",
            sliderOffsetY: 20,
            sliderButtonSize: 45,
            sliderSize: 32,
            sliderCircular: 999,
            colorBar: const Color(0xfff1f2fc),
            colorButton: Colors.white,
            colorArrow: const Color(0xff6c55fb),
            colorCaptChar: Colors.blue,
            onConfirm: (value) async {
              debugPrint(value.toString());
              return await Future.delayed(const Duration(seconds: 5)).then(
                (value) {
                  controller.create.call();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
