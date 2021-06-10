import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'drawer.dart';

void main() {
  runApp(MaterialApp(
    title: "StateFull Widgets",
    home: FavoriteCity(),
  ));
}

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteCity();
  }
}

class _FavoriteCity extends State<FavoriteCity> {
  String cityName = "";
  var _currency = ['Rupees', 'Dollar', 'Pounds', 'others'];
  var _currentItemSelected = 'Rupees';
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
        backgroundColor: Colors.lightBlue,
        title: Text("Widgets"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: data != null
            ? ListView.builder(
            itemBuilder:
            (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(data[index]["title"]),
                  subtitle: Text("Id ${data[index]["id"]}"),
                  leading: Image.network(data[index]["url"]),
                ),
              );
            })
            : Center(
                child: CircularProgressIndicator(),
              ),
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

  void getData() async {
    var res = await http.get(Uri.parse(url));
    print(res.body);
    data = jsonDecode(res.body);
    setState(() {});
  }
}