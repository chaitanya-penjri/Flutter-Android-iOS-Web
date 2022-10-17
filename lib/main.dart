import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_aiw/views/login_page.dart';
import 'dart:io' show Platform;
import 'package:universal_io/io.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Login Page',
      debugShowCheckedModeBanner: false,
      home: commonScaffold(),
    );
  }

  // common scaffold for android and ios
  Widget commonScaffold() {
    if (Platform.isAndroid) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Sample Login Page'),
        ),
        body: const SingleChildScrollView(child: LoginPage()),
      );
    } else if (Platform.isIOS) {
      return const CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Sample Login Page'),
          ),
          child: SafeArea(child: SingleChildScrollView(child: LoginPage(),))
      );
    } else if (kIsWeb) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Sample Login Page'),
        ),
        body: const SingleChildScrollView(child: LoginPage(),),
      );
    } else {
      return const Text('');
    }
  }
}
