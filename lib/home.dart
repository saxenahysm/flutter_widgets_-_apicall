import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return getArrayListItems();
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text("Flutter Widgets"),
    //     ),
    //     body: getArrayListItems(),
    //     floatingActionButton: FloatingActionButton(
    //       onPressed: null,
    //       child: Icon(Icons.add),
    //     ),
    //   ),
    // );
  }

  Widget getListView() {
    var listView = ListView(
      children: [
        ListTile(
          title: Text("Item 1"),
          leading: Icon(Icons.landscape),
          subtitle: Text("item one subtitle"),
          trailing: Icon(Icons.ac_unit),
          onTap: () => debugPrint("???????????"),
        ),
        ListTile(
          title: Text("Item 2"),
          leading: Icon(Icons.youtube_searched_for_sharp),
          subtitle: Text("item two subtitle"),
          trailing: Icon(Icons.ac_unit),
          onTap: () => debugPrint("Item 2"),
        ),
        ListTile(
          title: Text("Call"),
          leading: Icon(Icons.call),
        ),
        ListTile(
          title: Text("Android"),
          leading: Icon(Icons.android),
        )
      ],
    );
    return listView;
  }

  List<String> getArrayList() {
    // generating source for list view
    var items = List<String>.generate(200, (index) => "ITEM $index");
    return items;
  }

  Widget getArrayListItems() {
    var listItems = getArrayList();

    var listView = ListView.builder(itemBuilder: (context, index) {
      return ListTile(
        leading: Icon(Icons.water_damage_outlined),
        title: Text(listItems[index]),
        onTap: () => showSnackBar(context),
      );
    });
    return listView;
  }

  void showSnackBar(BuildContext context) {
    var snackBar = SnackBar(
      content:    Text("This is SnackBar "),
      action: SnackBarAction(
          label: "UNDO",
          onPressed: ()=>debugPrint("Undo clicked")),
    );
    Scaffold.of(context).showSnackBar(snackBar);}
}
