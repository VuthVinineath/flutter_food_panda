
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              UserAccountsDrawerHeader(

                  currentAccountPicture: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: Image.network(''),
                  ),
                  accountName: Text('Vuth Vinineath'),
                  accountEmail: Text('vinineathvini@gmail.com')
              ),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.favorite),
                title: Text('Favourites'),
              ),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.favorite),
                title: Text('Favourites'),
              ),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.favorite),
                title: Text('Favourites'),
              ),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.favorite),
                title: Text('Favourites'),
              ),
            ],
          )
      ),
    );
  }
}