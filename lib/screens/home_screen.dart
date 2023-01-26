import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json_dart/data/model/user.dart';
import 'package:flutter_json_dart/screens/user_profile_screen.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var result = '...';
  // User? user;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SpinKitSquareCircle(
                  color: Colors.black12,
                  size: 100.0,
                ),
              ),
              // Container(width: double.infinity),
              // SizedBox(height: 60.0),
              // ElevatedButton(
              //   onPressed: (() {
              //     // getData();
              //     if (user == null) {
              //       return;
              //     }
              //   }),
              //   child: Text('click to get data'),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: Text(
              //     result,
              //     style: TextStyle(
              //       fontSize: 18.0,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void getData() async {
    // with http
    // var uri = Uri.parse('https://jsonplaceholder.typicode.com/users/1');
    // Response response = await get(uri);

    // int id = jsonDecode(response.body)['id'];
    // String name = jsonDecode(response.body)['name'];
    // String username = jsonDecode(response.body)['username'];
    // String city = jsonDecode(response.body)['address']['city'];
    // String phone = jsonDecode(response.body)['phone'];

    // User user = User(id, name, username, city, phone);

    // with Dio
    var response =
        await Dio().get('https://jsonplaceholder.typicode.com/users');
    // var jsonMapObject = response.data;
    // print(jsonMapObject.runtimeType);
    // var user = User.fromMapJson(jsonMapObject);

    List<User> userList = response.data
        .map<User>((jsonMapObject) => User.fromMapJson(jsonMapObject))
        .toList();
    // .cast<User>();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UserProfileScreen(userData: userList),
      ),
    );

    // var resResult = jsonDecode(response.body)[2]['name'];
    // for (var i = 0; i < 10; i++) {
    //   print(jsonDecode(response.body)[i]['name']);
    // }
    // setState(() {
    // result = resResult;
    // });
  }
}
