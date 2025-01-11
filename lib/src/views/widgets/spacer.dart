import 'package:flutter/material.dart';

class Height extends StatelessWidget {
  const Height({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height * height;
    return SizedBox(height: deviceHeight);
  }
}

class Width extends StatelessWidget {
  const Width({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width * width;
    return SizedBox(width: deviceWidth);
  }
}

class Height5 extends StatelessWidget {
  const Height5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 5);
  }
}

class Height10 extends StatelessWidget {
  const Height10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.01);
  }
}

class Height15 extends StatelessWidget {
  const Height15({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.015);
  }
}

class Height20 extends StatelessWidget {
  const Height20({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.02);
  }
}

class Height30 extends StatelessWidget {
  const Height30({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.03);
  }
}

class Height50 extends StatelessWidget {
  const Height50({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.05);
  }
}

// Width Spacers
class Width3 extends StatelessWidget {
  const Width3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: MediaQuery.of(context).size.width * 0.003);
  }
}

class Width5 extends StatelessWidget {
  const Width5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: MediaQuery.of(context).size.width * 0.005);
  }
}

class Width10 extends StatelessWidget {
  const Width10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: MediaQuery.of(context).size.width * 0.010);
  }
}

class Width15 extends StatelessWidget {
  const Width15({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: MediaQuery.of(context).size.width * 0.015);
  }
}

class Width20 extends StatelessWidget {
  const Width20({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 20);
  }
}

class Width24 extends StatelessWidget {
  const Width24({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 24);
  }
}

class Width30 extends StatelessWidget {
  const Width30({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 30);
  }
}

class Width145 extends StatelessWidget {
  const Width145({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 145);
  }
}
