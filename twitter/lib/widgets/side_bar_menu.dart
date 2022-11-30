import 'package:flutter/material.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('User Name'),
            accountEmail: Text('0 Followers 0 Following'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/85411745?v=4'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Lists'),
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('Bookmarks'),
          ),
          ListTile(
            leading: Icon(Icons.bolt),
            title: Text('Moments'),
          ),
          Divider(
            height: 10,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
