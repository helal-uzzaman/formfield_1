import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  var _obscureText = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                ' User Login ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                // autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        label: Text('user Name'),
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Empty string can not be used.';
                        }
                        return null;
                      },
                      onEditingComplete: () => {
                        _emailFocus.requestFocus(),
                        print('onEditing complete Text form field'),
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        label: Text('user Email'),
                      ),
                      focusNode: _emailFocus,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => {
                        _passwordFocus.requestFocus(),
                        print('onEditing complete Text form field'),
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Empty string can not be used.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: const Icon(Icons.lock),
                          label: const Text('Your password'),
                          suffixIcon: IconButton(
                            onPressed: _toggleObscureText,
                            icon: const Icon(Icons.remove_red_eye),
                          )),
                      obscureText: _obscureText,
                      focusNode: _passwordFocus,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => {
                        print('onEditing complete Text form field'),
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      onPressed: () => {_formKey.currentState!.validate()},
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 54, 244, 155),
                              Color.fromARGB(255, 163, 255, 59)
                            ]),
                            borderRadius: BorderRadius.circular(16)),
                        child: Container(
                          height: 36,
                          alignment: Alignment.center,
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 24, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
