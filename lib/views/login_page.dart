import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var switchState = false;

  void updateSwitchState() {
    setState(() {
      switchState = !switchState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const DefaultTextStyle(
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
                child: Text(
                  'Flutter Login',
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const DefaultTextStyle(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                child: Text(
                  'Sign in',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Builder(builder: (_) {
                if (Platform.isAndroid) {
                  return TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'UserName',
                    ),
                  );
                } else if (Platform.isIOS) {
                  return CupertinoTextField(
                    padding: const EdgeInsets.fromLTRB(12.0, 16.0, 0.0, 16.0),
                    placeholder: 'UserName',
                    controller: nameController,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Builder(builder: (_) {
                if (Platform.isAndroid) {
                  return TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  );
                } else if (Platform.isIOS) {
                  return CupertinoTextField(
                    padding: const EdgeInsets.fromLTRB(12.0, 16.0, 0.0, 16.0),
                    obscureText: true,
                    placeholder: 'Password',
                    controller: passwordController,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.red[300],
                    fontSize: 16,
                  ),
                  child: const Text('Remember Credentials?'),
                ),
                Builder(builder: (_) {
                  if (Platform.isAndroid) {
                    return Switch(
                        value: switchState,
                        onChanged: (_) {
                          updateSwitchState();
                        });
                  } else if (Platform.isIOS) {
                    return CupertinoSwitch(
                        value: switchState,
                        onChanged: (_) {
                          updateSwitchState();
                        });
                  } else {
                    return Container();
                  }
                }),
              ],
            ),
            Container(
              height: 40,
              width: 100,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Builder(
                builder: (_) {
                  if (Platform.isAndroid) {
                    return ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    );
                  } else if (Platform.isIOS) {
                    return CupertinoButton.filled(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      child: const Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            Container(
              height: 12.0,
            ),
            Builder(builder: (_) {
              if (Platform.isAndroid) {
                return const CircularProgressIndicator();
              } else if (Platform.isIOS) {
                return const CupertinoActivityIndicator();
              } else {
                return Container();
              }
            }),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DefaultTextStyle(
                  style: TextStyle(color: Colors.black),
                  child: Text('Does not have account?'),
                ),
                TextButton(
                  child: const DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Sign in',
                    ),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
            ),
          ],
        ));
  }
}
