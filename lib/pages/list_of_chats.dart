import 'package:flutter/material.dart';
import 'package:trial_evaluation_chatt_app/components/my_drawer.dart';
import 'package:trial_evaluation_chatt_app/components/my_textfield.dart';
import 'package:trial_evaluation_chatt_app/components/user_tile.dart';
import 'package:trial_evaluation_chatt_app/pages/chat_page.dart';

class ListOfChats extends StatelessWidget {
  ListOfChats({super.key});

  // text editing controller to search for chats
  final TextEditingController searchChatController = TextEditingController();

  // empty method to handle when the user would like to go to the camera
  void goToCamera() {}

  // empty method to handle when the user would like to make a new chat
  void addNewChat() {}

  // empty method to handle when the user would like to go to the settings page
  void goToSettings() {}

  // empty method to handle when the user would like to logout
  void logout() {}

  // empty method to handle when the user would like to search for a chat
  void searchForChat() {}

  // list of users to chat with
  final List<String> names = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eve',
    'Frank',
    'Grace',
    'Hank',
    'Ivy',
    'Jack',
    'Bob',
    'Jose',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("C H A T S"),
        actions: [
          // camera button
          IconButton(onPressed: goToCamera, icon: const Icon(Icons.camera_alt)),

          // add new chat button
          IconButton(onPressed: addNewChat, icon: const Icon(Icons.add)),
        ],
      ),
      drawer: MyDrawer(
        goToSettings: goToSettings,
        logout: logout,
      ),
      body: Column(
        children: [
          // add a divider
          Divider(height: 1, color: Colors.grey.shade400),
          const SizedBox(height: 25,),

          // search bar to see existing chats
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextField(
                hintText: "Search Chats",
                controller: searchChatController,
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: IconButton(
                  onPressed: searchForChat,
                  icon: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black, // Set circle color to white
                    ),
                    padding: const EdgeInsets.all(8), // Adjust padding as needed
                    child: const Icon(Icons.search, color: Colors.white), // Set icon color to black
                  ),
                ),
              ),
            ],
          ),

          // add a divider
          Divider(height: 1, color: Colors.grey.shade400),

          // chats with the 10 existing ones
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return UserTile(
                  text: names[index], 
                  onTap: () {
                    // tapped on a user, go to chat page
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                          receiver: names[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),


    );
  }
}
