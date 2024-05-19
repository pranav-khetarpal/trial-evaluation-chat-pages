import 'package:flutter/material.dart';
import 'package:trial_evaluation_chatt_app/components/my_textfield.dart';

class ChatPage extends StatelessWidget {
  final String receiver;

  ChatPage({
    super.key,
    required this.receiver,
  });

  // text editing controller
  final TextEditingController messageController = TextEditingController();

  Widget _buildMessage(String message, BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }

  // build message input
  Widget _buildUserInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        children: [

          // adding a plus icon
          ClipOval(
            child: Material(
              color: Theme.of(context).colorScheme.primary, // Button color
              child: InkWell(
                splashColor: Theme.of(context).colorScheme.onPrimary, // Splash color
                onTap: addContent,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // textfield should take up most of the space
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: MyTextField(
                controller: messageController,
                hintText: "Type a message",
              ),
            ),
          ),

          const SizedBox(width: 10),

          // this is the send icon
          ClipOval(
            child: Material(
              color: Theme.of(context).colorScheme.primary, // Button color
              child: InkWell(
                splashColor: Theme.of(context).colorScheme.onPrimary, // Splash color
                onTap: sendMessage,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.arrow_upward,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // empty method for when to send messages
  void sendMessage() {

  }

  // empty method for when to make a phone call
  void addContent() {

  }

  // empty method for when to do a video call
  void videoCall() {

  }

  // empty method for when to make a phone call
  void phoneCall() {

  }

  @override
  Widget build(BuildContext context) {

    List<String> givenMessages = [
      "This",
      "is",
      "the",
      "given",
      "message",
      "stream",
      "with",
      receiver,
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // adding user image
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/icons/wp4471357-1024x1024-wallpapers.jpg'),
                  radius: 20.0,
                ),
                
                const SizedBox(width: 20,),
                
                // displaying messager name
                Text(
                  receiver,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // make a video call
            Row(
              children: [
                IconButton(
                  onPressed: videoCall,
                  icon: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black, // Set circle color to white
                    ),
                    padding: const EdgeInsets.all(8), // Adjust padding as needed
                    child: const Icon(Icons.video_call, color: Colors.white), // Set icon color to black
                  ),
                ),
                IconButton(
                  onPressed: phoneCall,
                  icon: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black, // Set circle color to white
                    ),
                    padding: const EdgeInsets.all(8), // Adjust padding as needed
                    child: const Icon(Icons.phone, color: Colors.white), // Set icon color to black
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // display all messages
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemCount: givenMessages.length,
                itemBuilder: (context, index) {
                  return _buildMessage(givenMessages[index], context);
                },
              ), // need to display givenMessages as a list,
            ),
          ),

          // get message input
          Container(
            height: 100,
            color: Theme.of(context).colorScheme.inversePrimary,
            child: _buildUserInput(context),
          ),
        ],
      ),
    );
  }
}
