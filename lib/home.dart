import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String type = "";

  @override
  void initState() {
    getText();
    super.initState();
  }

  void getText() async {
    String temp = await getTextFromDB();
    setState(() {
      type = temp;
    });
  }
  Future<String> getTextFromDB() async {
    CollectionReference refText =
    FirebaseFirestore.instance.collection("Contents");
    return refText.doc("1").get().then((value) {
      return value.data()?["type"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flavor App $type"),
      ),
      body: Center(
        child: Text(
          type == ""
              ? "Waiting..."
              : "Şu anda $type uygulamasını kullanıyorsunuz.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}


