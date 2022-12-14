import 'dart:core';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/all_providers.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import '../screens/all_screens.dart';
// import '../models/user.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  late String username;
  late int followers;
  late int following;

  @override
  initState() {
    super.initState();
    username = 'username';
    followers = 0;
    following = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var activeUserData = Provider.of<AuthState>(context).activeUserData;
    print('activeUserData: $activeUserData');
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        children: [
          SizedBox(
            height: 200,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/85411745?v=4'),
                ),
                const SizedBox(height: 20),
                Text(
                  activeUserData!.userName,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${activeUserData.followers} Followers',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${activeUserData.following} Following',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.list),
            title: const Text('Lists'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.bookmark),
            title: const Text('Bookmarks'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.bolt),
            title: const Text('Moments'),
          ),
          const Divider(
            height: 10,
            thickness: 2,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.settings),
            title: const Text('Settings and privacy'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.help),
            title: const Text('Help Center'),
          ),
          const Divider(
            height: 10,
            thickness: 2,
          ),
          ListTile(
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              Provider.of<AuthState>(context, listen: false).logout();
            },
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}
