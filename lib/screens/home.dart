// ignore_for_file: unused_element, avoid_print

import 'package:flutter/material.dart';

import '../models/post_models.dart';
import '../services/api_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<UserModel>? userModel = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      userModel = (await ApiService().getUsers());
      Future.delayed(const Duration(seconds: 1))
          .then((value) => setState(() {}));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Example 2'),
      ),
      body: userModel == null || userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: userModel!.length,
              // itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  // title: Text(userModel![index].title),
                  title: Text(
                    userModel![index].title!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: Text('${userModel![index].userId}'),
                  // Text(
                  //     'they are or do repels provide blacked out except the option criticizes'),
                  subtitle: Text(userModel![index].body!),
                  //  Text(
                  // 'because it receives it takes the consequences of refusing to be expedient and when He blames the whole trouble for what it is "Ours is the matter of things, but they are the things that will happen to the architect.'),
                );
              },
            ),
    );
  }
}
