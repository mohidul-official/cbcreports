import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../api_connection/api_connection.dart';

class HomeFragmentsScreen extends StatefulWidget {
  const HomeFragmentsScreen({super.key});

  @override
  State<HomeFragmentsScreen> createState() => _HomeFragmentsScreenState();
}

class _HomeFragmentsScreenState extends State<HomeFragmentsScreen> {
  List purchaseRecord = [];

  Future<void> getRecord() async {
    try {
      var responce = await http.get(Uri.parse(API.viewprepurchasereport));
      setState(() {
        purchaseRecord = jsonDecode(responce.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getRecord();
    //super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Reports'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Pre Purchase Inspection Reports',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: purchaseRecord.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(purchaseRecord[index]["id"]),
                      subtitle: Text(purchaseRecord[index]["invoiceno"]),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Pest & Termite Inspection Reports',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: purchaseRecord.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(purchaseRecord[index]["id"]),
                      subtitle: Text(purchaseRecord[index]["invoiceno"]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
