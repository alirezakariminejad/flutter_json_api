import 'package:flutter/material.dart';
import 'package:flutter_json_dart/data/model/user.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({super.key, this.userData});
  User? userData;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  User? userData;

  @override
  void initState() {
    super.initState();
    userData = widget.userData;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('second page'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(userData!.city),
          ),
        ),
      ),
    );
  }
}
