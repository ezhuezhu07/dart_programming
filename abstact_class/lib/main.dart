import 'package:flutter/material.dart';
import 'dart:developer' as devvtools show log;

extension Log on Object {
  void log() => devvtools.log(toString());
}

enum Type { cat, dog }

abstract class CanRun {
  final Type clsType;
  const CanRun({required this.clsType});
  String get type {
    if (this is Cat) {
      return 'cat';
    } else {
      return 'some other animal';
    }
  }

  // abstract method
  @mustCallSuper
  void run() {
    "CanRun's run function is called".log();
  }
}
// Any class that extends this absract class should implement the abstract method (run method should be implemented)

class Cat extends CanRun {
  const Cat() : super(clsType: Type.cat);
  @override
  void run() {
    // TODO super.run(); if we want to call the the abstract method of CanRun class
    super.run();
    'Cat is running'.log();
  }
}

class Dog extends CanRun {
  const Dog() : super(clsType: Type.dog);
}

// ! extends - inherit from particular class (max 1)
// ! with - The with keyword allow you to mix a "mixin" with your class. [inherit more than 1 class]
// ! Abstract class can have a constructor
// ! Abstract class without constructor can act as mixins
// ! Abstract class with constructor cannot be a mixin
void testIt() {
  'testit called'.log();
  final cat = Cat();
  cat.clsType.log();
  final dog = Dog();
  dog.clsType.log();
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
