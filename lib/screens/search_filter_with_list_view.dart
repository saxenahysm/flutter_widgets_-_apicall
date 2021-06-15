import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CompanyDetails {
  final int id;
  final String name, email;

  CompanyDetails({required this.id, required this.name, required this.email});

  factory CompanyDetails.fromJson(Map<String, dynamic> json) {
    return CompanyDetails(
        id: json['id'], name: json['name'], email: json['email']);
  }
}

class SearchFilterScreenDemo extends StatefulWidget {
  const SearchFilterScreenDemo({Key? key}) : super(key: key);

  @override
  _SearchFilterScreenDemoState createState() => _SearchFilterScreenDemoState();
}

List<CompanyDetails> _searchResult = [];

List<CompanyDetails> _companyDetails = [];

class _SearchFilterScreenDemoState extends State<SearchFilterScreenDemo> {
  Future<CompanyDetails> fetchCompanyInfo() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    final jsonData = json.decode(response.body);
    setState(() {
      for (Map<String, dynamic> data in jsonData) {
        _companyDetails.add(CompanyDetails.fromJson(data));
      }
    });
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Filter"),
      ),
      body: FutureBuilder(
        future: fetchCompanyInfo(),
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
          return ListView.builder(itemBuilder: (context, i) {
            return ListTile(
              title: Text(_searchResult[i].name),
              subtitle: Text(_searchResult[i].email),
            );
          });.





        },
      ),
    );
  }
}
