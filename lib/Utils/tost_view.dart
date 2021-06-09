
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast extends StatefulWidget {
  _ShowToastState createState() => _ShowToastState();
}

class _ShowToastState extends State {
  void showToast() {
    Fluttertoast.showToast(
        msg: 'Clicked !!!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Click me'),
      onPressed: showToast,
    );
  }
}
