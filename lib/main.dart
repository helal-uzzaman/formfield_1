import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      // hintText: 'Name',
                      label: Text('user Name'),
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => {
                      print('onEditing complete Text form field'),
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      // hintText: 'Name',
                      label: Text('user Email'),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => {
                      print('onEditing complete Text form field'),
                    },
                  ),
                  TextFormField(),
                ],
              ),
              onChanged: () {
                print('form onchanged.');
              },
            ),
          ),
        ),
      ),
    );
  }
}
