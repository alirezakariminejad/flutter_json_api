import 'package:flutter/material.dart';
import 'package:flutter_json_dart/data/model/user.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({super.key, this.userData});
  List<User>? userData;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  List<User>? userData;

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
          child: ListView.builder(
            itemCount: userData!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100.0,
                  color: Colors.black26,
                  child: Center(
                    child: Text(userData![index].name),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
