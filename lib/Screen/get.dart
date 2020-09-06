import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyGet extends StatefulWidget {
  @override
  _MyGetState createState() => _MyGetState();
}

class _MyGetState extends State<MyGet> {
  var cmd;
  var webdata;

  myweb(cmd) async {
    var url = "http://192.168.43.54/cgi-bin/web.py?x=${cmd}";
    var r = await http.get(url);

    setState(() {
      webdata = r.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Command Page"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Container(
              alignment: Alignment.center,
              child: Text("Red Hat 8 Commands",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 24))),
          TextField(
            onChanged: (value) {
              cmd = value;
            },
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            autocorrect: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your linux command",
              prefix: Icon(Icons.laptop_windows),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              await myweb(cmd);
              var fsconnect = FirebaseFirestore.instance;
              fsconnect.collection("linux_commands").add({
                "command_name": cmd,
                "output": webdata,
              });
            },
            textColor: Colors.white,
            color: Colors.red,
            child: Text("Click Here"),
          ),
          Text(
            webdata ?? "output is coming.....",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
