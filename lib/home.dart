import 'package:flutter/material.dart';
import 'package:flutter_widgets/Utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = "";
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
        title: Text("Widgets and http call"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: data != null
            ? _createListView()
            : Center(
                child: SizedBox(child: CircularProgressIndicator()),
                heightFactor: 56.0,
                widthFactor: 56.0,
              ),
      ),
      drawer: MyDrawer(),
    );
  }

  Widget _createListView() {
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
