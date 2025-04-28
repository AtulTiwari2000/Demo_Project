import 'package:demo_project/DatabasePage.dart';
import 'package:demo_project/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<DartModel> dataList = [];

  // @override
  // void initState() {
  //   super.initState();
  //   loadData();
  // }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    loadData();
  }

  void loadData() async {
    dataList = await DatabaseHelper.instance.getPosts();
    if (dataList.isEmpty) {
      await fetchAndStoreData();
    }
    setState(() {});
  }

  Future<void> fetchAndStoreData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      dataList = jsonData.map((e) => DartModel.fromJson(e)).toList();
      await DatabaseHelper.instance.clearPosts();
      for (var post in dataList) {
        await DatabaseHelper.instance.insertPost(post);
      }
    } else {
      print('Failed to fetch data from API');
    }
  }

  Future<void> _handleRefresh() async {
    await fetchAndStoreData();
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data Refreshed')),
    );
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Data', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(onPressed: (){
            logout();
          }, icon: Icon(Icons.logout,color: Colors.white,))
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: dataList.isEmpty ? const Center(child: CircularProgressIndicator()) : RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            final item = dataList[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin:  EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding:  EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title ?? 'No Title', style:  TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                     SizedBox(height: 8),
                    Text(item.body ?? 'No Body', style:  TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
