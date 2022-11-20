// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/main.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/googleSignInProvider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 100,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                gradient: appLinearGradient,
              ),
              child: Text('Drawer Header'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: const Text('Edit'),
            onTap: () {
              Navigator.of(context).pushNamed("/editProfile");
            },
          ),
          ListTile(
            leading: Icon(Icons.newspaper),
            title: const Text('News'),
            onTap: () {
              Navigator.of(context).pushNamed("/NewsScreen");
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.of(context).pushReplacementNamed('/');
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogout();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
        ],
      ),
    );
  }
}














// Drawer(
//       child: Container(
//         child: Column(
//           children: [
//             AppBar(
//               title: Text("Hello Friend"),
//               automaticallyImplyLeading: false,
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.shop),
//               title: Text("Shop"),
//               onTap: () {
//                 Navigator.of(context).pushReplacementNamed("/");
//               },
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.login_outlined),
//               title: Text("Logout"),
//               onTap: () {
//                 final provider =
//                     Provider.of<GoogleSignInProvider>(context, listen: false);
//                 provider.googleLogout();
//               },
//             ),
//           ],
//         ),
//       ),
//     );