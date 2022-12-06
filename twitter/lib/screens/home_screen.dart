import 'package:flutter/material.dart';
import '../providers/auth_state.dart';
import 'all_screens.dart';
import '../widgets/all_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignIn(),
                  ),
                );
                AuthState().logout();
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
        drawer: const SideBarMenu(),
        body: const SizedBox(
          child: PostWidget(),
        ),
        //add bottom bar menu,
        bottomNavigationBar: const BottomBarMenu(
            // selectedMenu: MenuState.home,
            ));
  }
}
