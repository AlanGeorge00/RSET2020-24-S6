import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_database/firebase_database.dart';

//final databaseRef = FirebaseDatabase.instance.ref();

final GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId:
      '589961041390-u1bnevpi4o2r5kobvp42jkm2faccrmer.apps.googleusercontent.com', // Replace with your own Client ID
);
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  return await _auth.signInWithCredential(credential);
}

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username == 'admin' && password == 'rset') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecondScreen()),
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Invalid username or password',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      final UserCredential userCredential = await signInWithGoogle();
      // Handle the signed-in user
      print('User signed in with Google: ${userCredential.user?.displayName}');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecondScreen()),
      );
    } catch (e) {
      // Handle the sign-in error
      print('Failed to sign in with Google: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: _signInWithGoogle,
              icon: Icon(Icons.login),
              label: const Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String _selectedOption = 'Ajoe';
  final TextEditingController _textFieldController = TextEditingController();

  void _showSelectedOption() {
    Fluttertoast.showToast(
      msg: 'Selected Option: $_selectedOption',
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  /*void _submitText() async {
    String text = _textFieldController.text.trim();
    Fluttertoast.showToast(
      msg: 'Submitted Text: $text',
      toastLength: Toast.LENGTH_SHORT,
    );
    // Store the text in the Firebase Realtime Database
    databaseRef.child('text').set(text);
    String url;
    if (_selectedOption == 'Ajoe') {
      url =
          'https://colab.research.google.com/drive/1Mmt-j43A8swKNxVnbZGB0sNx0DNLPejC?usp=drive_link&string=$text';
    } else if (_selectedOption == 'Alan') {
      url =
          'https://colab.research.google.com/drive/1XXYRuBUr2-2vXCT7C7-DhYdPPBn-SMZa?usp=drive_link&string=$text';
    } else {
      // Handle other options if needed
      return;
    }*/

  void _submitText() async {
    String text = _textFieldController.text.trim();
    Fluttertoast.showToast(
      msg: 'Submitted Text: $text',
      toastLength: Toast.LENGTH_SHORT,
    );
    // Store the text in the Firebase Realtime Database
    //databaseRef.child('text').set(text);
    String url;
    if (_selectedOption == 'Ajoe') {
      url =
          'https://colab.research.google.com/drive/1Mmt-j43A8swKNxVnbZGB0sNx0DNLPejC?usp=drive_link';
    } else if (_selectedOption == 'Alan') {
      url =
          'https://colab.research.google.com/drive/1XXYRuBUr2-2vXCT7C7-DhYdPPBn-SMZa?usp=drive_link';
    } else {
      // Handle other options if needed
      return;
    }

    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedOption,
              items: ['Ajoe', 'Alan']
                  .map((option) => DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
            ),
            const SizedBox(height: 20.0),
            /*extField(
              controller: _textFieldController,
              decoration: const InputDecoration(labelText: 'Text'),
            ),
            const SizedBox(height: 20.0),*/
            ElevatedButton(
              onPressed: _submitText,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _showSelectedOption,
              child: const Text('Show Selected Option'),
            ),
          ],
        ),
      ),
    );
  }
}