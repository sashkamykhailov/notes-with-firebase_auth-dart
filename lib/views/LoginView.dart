import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 20),
      TextField(
        enableSuggestions: false,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        controller: _email,
        decoration: const InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.only(left: 5.0),
        ),
      ),
      TextField(
        controller: _password,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: const InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.only(left: 5.0),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: ElevatedButton(
          onPressed: () async {
            final email = _email.text;
            final password = _password.text;
            try {
              final userCredentials =
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: email,
                password: password,
              );
              _email.text = '';
              _password.text = '';
              print(userCredentials);
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                print('User not found');
              } else if (e.code == 'wrong-password') {
                print('Wrond passwrod provided');
              } else {
                print('Something else happened');
              }
            }
          },
          child: const Text('Login'),
        ),
      ),
    ]);
  }
}
