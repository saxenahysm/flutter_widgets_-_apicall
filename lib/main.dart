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
        child: data!=null?
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "User Name",
                        hintText: "Enter User Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                  ),
                  SizedBox(height: 12.0),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                  ),
                  Container(
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    height: 48.0,
                    width: 120,
                    color: Colors.lightBlue,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 12.0),
                  )
                ],
              ),
            ),
          ),
        ):Center(child: CircularProgressIndicator(),),
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
    var res=await http.get(url);
    print(res.body);
  }
}