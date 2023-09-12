import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DummyScreen extends StatefulWidget {
  const DummyScreen({super.key, required this.accessToken});
  final String accessToken;
  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Map? user;
  Future<Map> getUserProfile() async {
    Response res = await http.get(
      Uri.parse("https://api.spotify.com/v1/me"),
      headers: {"Authorization": 'Bearer ${widget.accessToken}'},
    );

    final data = jsonDecode(res.body);
    return data;
  }

  void displayUserProfile() async {
    final data = await getUserProfile();
    setState(() {
      user = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(user.toString() ?? "Loading..."),
            ElevatedButton(
                onPressed: displayUserProfile,
                child: const Text("get profile")),
          ],
        ),
      ),
    );
  }
}

class $ {}
