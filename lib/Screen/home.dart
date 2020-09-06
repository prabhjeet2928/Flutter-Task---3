import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

lanuchURL() async {
  var url =
      "https://console.firebase.google.com/u/0/project/task3flutter-e6a24/firestore/data~2Flinux_commands~2F6Q84puUHhd67ypUpzftP";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not find this url is $url';
  }
}

class MyHome extends StatelessWidget {
  var url =
      "https://pbs.twimg.com/profile_images/1123557710191001600/oMQc_xqN_400x400.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task 3 of Flutter"),
        backgroundColor: Colors.red,
        leading: Image.network(url),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 300,
              alignment: Alignment.bottomCenter,
              //color: Colors.red,
              child: Text(
                'Red Hat 8 Enterprise',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    width: 5,
                    color: Colors.red,
                  ),
                  image: DecorationImage(
                      image: NetworkImage(url), fit: BoxFit.cover)),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "getdata");
              },
              color: Colors.red,
              textColor: Colors.white,
              hoverColor: Colors.white,
              child: Text("Write the commands"),
            ),
            RaisedButton(
              onPressed: () {
                lanuchURL();
              },
              color: Colors.red,
              textColor: Colors.white,
              hoverColor: Colors.redAccent,
              child: Text("Show the all commands"),
            ),
          ],
        ),
      ),
    );
  }
}
