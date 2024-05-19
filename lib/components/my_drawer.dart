import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? goToSettings;
  final void Function()? logout;

  const MyDrawer({
    super.key,
    required this.goToSettings,
    required this.logout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // logo
              DrawerHeader(
                child: Icon(
                  Icons.message,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 40,
                ),
              ),

              // settings list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  leading: const Icon(Icons.settings),
                  onTap: goToSettings,
                ),
              ),
            ],
          ),

          // logout list tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout_outlined),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
