import 'package:flutter/material.dart';


class Body extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<Body> {
  final List<Message> messages = [];
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Simulate receiving messages
    _receiveMessage("Hello!", "User 1");
    _receiveMessage("Hi there! How may i help you", "User 2");
  }

  void _sendMessage(String text) {
    final newMessage = Message(sender: "User", text: text, timestamp: DateTime.now());
    setState(() {
      messages.add(newMessage);
    });
    textController.clear();
    _scrollToBottom();
  }

  void _receiveMessage(String text, String sender) {
    final newMessage = Message(sender: sender, text: text, timestamp: DateTime.now());
    setState(() {
      messages.add(newMessage);
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support Chat"),
        backgroundColor: Color(0xFF3C8ED3),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return MessageWidget(message: message);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      prefixIcon: IconButton(
                        icon: Icon(Icons.photo_library),
                        onPressed: () {
                          // Handle opening the gallery here
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final text = textController.text;
                    if (text.isNotEmpty) {
                      _sendMessage(text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;
  final DateTime timestamp;

  Message({required this.sender, required this.text, required this.timestamp});
}

class MessageWidget extends StatelessWidget {
  final Message message;

  MessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.sender == 'User' ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: message.sender == 'User' ? Color(0xFF3C8ED3) : Colors.orangeAccent,
          borderRadius: BorderRadius.circular(18.0),
        ),
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
        child: Text(
          message.text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
