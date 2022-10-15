import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:developer' as devvtools show log;
// import 'dart:io';
import 'package:meta/meta.dart';
import 'dart:convert';

extension Log on Object {
  void log() => devvtools.log(toString());
}

extension GetonUri on Object {
  Future<HttpClientResponse> getUrl(String url) =>
      HttpClient().getUrl(Uri.parse(url)).then(
            (req) => req.close(),
          );
}

mixin GetMethod {
  String get url;
  @useResult
  Future<String> getResponseString() => getUrl(url).then(
        (res) => res
            .transform(
              utf8.decoder,
            )
            .join(),
      );
}

@immutable
class Friends with GetMethod {
  const Friends();

  @override
  String get url => 'http://127.0.0.1:5555/mixins_learnings/lib/apis/data.json';
}

void testIt() async {
  final frnd = await const Friends().getResponseString();
  frnd.log();
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
