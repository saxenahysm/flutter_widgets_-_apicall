import 'package:flutter/material.dart';
import 'package:flutter_widgets/Utils/tost_view.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountEmail: Text("user@gmail.com"),
          accountName: Text("UserName"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage("https://i.pcmag.com/imagery/reviews/03aizylUVApdyLAIku1AvRV-39.1605559903.fit_scale.size_760x427.png"),
          ),
        ),
        ListTile(
            title: Text("Email"),
            leading: Icon(Icons.email),
            subtitle: Text("shyam@gmail.com"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              ShowToast();
            }),
        ListTile(
          title: Text("Call"),
          leading: Icon(Icons.call),
          subtitle: Text("7896541235"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ShowToast();
          },
        ),
      ],
    ));
  }
}
