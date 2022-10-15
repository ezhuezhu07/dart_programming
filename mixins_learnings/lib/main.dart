import 'package:flutter/material.dart';
import 'dart:developer' as devvtools show log;

extension Log on Object {
  void log() => devvtools.log(toString());
}

abstract class Animal {
  const Animal();
}

mixin CanRun on Animal {
  int get speed;
  void run() {
    'Running at a speed of $speed'.log();
  }
}

class Cat extends Animal with CanRun {
  @override
  int speed = 10;
}

class Dog with CanRun {
  @override
  int get speed => throw UnimplementedError();
}

void testIt() {
  final cat = Cat();
  cat.run();
  cat.speed = 50;
  cat.run();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    testIt();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Container(),
    );
  }
}
