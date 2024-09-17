import 'package:flutter/material.dart';
import 'package:genshinlist_r/screen/WeaponScreen.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Aether'), 
            accountEmail: Text('aether@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://cdn.wanderer.moe/genshin-impact/character-icons/ui-avataricon-playerboy.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
              image: DecorationImage(
                image: NetworkImage(
                  'https://techstory.in/wp-content/uploads/2023/03/GenshinMondstadtAlphaCoders.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.handyman),
            title: Text('Building'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.token_outlined),
            title: Text('Weapon'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeaponScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
