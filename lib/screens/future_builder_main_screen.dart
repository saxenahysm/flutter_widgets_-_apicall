import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/Utils/constants.dart';
import 'package:http/http.dart' as http;

import 'drawer.dart';

class HomeScreenFutureBuilder extends StatefulWidget {
  @override
  _HomeScreenFutureBuilderState createState() =>
      _HomeScreenFutureBuilderState();
}

class _HomeScreenFutureBuilderState extends State<HomeScreenFutureBuilder> {
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Constants.prefs.setBool("LoggedIn", false);
                Navigator.pushReplacementNamed(context, "/login");
              },
              icon: Icon(Icons.logout))
        ],
        title: Text("Future Builder"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("Oops ! there is nothing to show");
              break;
            case ConnectionState.waiting:
              CircularProgressIndicator();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text("An Error occurred");
              }
              break;
          }
          return ListView.builder(itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(data[index]["title"]),
                subtitle: Text("Id ${data[index]["id"]}"),
                leading: Image.network(data[index]["url"]),
                onTap: () {
                  showSnackBar(context);
                },
              ),
            );
          });
        },
      ),
      drawer: MyDrawer(),
    );
  }

  void showSnackBar(BuildContext context) {
    var snackBar = SnackBar(
      content: Text("This is SnackBar "),
      action: SnackBarAction(
          label: "UNDO", onPressed: () => debugPrint("Undo clicked")),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  Future getData() async {
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    return data;
  }
}
