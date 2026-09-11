import 'package:flutter/material.dart';

import 'app_theme.dart';

class MessagePreview {
  final String name;
  final String location;
  final String message;
  final String time;
  final int unread;
  final Color avatarColor;

  const MessagePreview({
    required this.name,
    required this.location,
    required this.message,
    required this.time,
    required this.unread,
    required this.avatarColor,
  });
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  static const List<MessagePreview> conversations = [
    MessagePreview(
      name: 'Mia Thompson',
      location: 'Rio de Janeiro',
      message: 'The apartment is ready for your arrival.',
      time: '10:42 AM',
      unread: 2,
      avatarColor: AppColors.coral,
    ),
    MessagePreview(
      name: 'Noah Williams',
      location: 'Tokyo',
      message: 'Would you like restaurant recommendations?',
      time: 'Yesterday',
      unread: 0,
      avatarColor: AppColors.teal,
    ),
    MessagePreview(
      name: 'Sofia James',
      location: 'Paris',
      message: 'Your check-in details are here.',
      time: 'Mon',
      unread: 1,
      avatarColor: Color(0xFF8C9BC3),
    ),
    MessagePreview(
      name: 'James Wilson',
      location: 'Cape Town',
      message: 'Thanks for staying with us!',
      time: 'Sun',
      unread: 0,
      avatarColor: Color(0xFFD3A05F),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: ListView(
        padding: AppColors.pagePadding,
        children: [
          const Text('Your conversations', style: AppColors.heading),
          const SizedBox(height: 6),
          const Text(
            'Stay connected with hosts and travel friends.',
            style: AppColors.muted,
          ),
          const SizedBox(height: 20),
          ...conversations.map(
            (conversation) => _MessageTile(conversation: conversation),
          ),
        ],
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  final MessagePreview conversation;
  const _MessageTile({required this.conversation});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () =>
          openPage(context, ConversationScreen(conversation: conversation)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 11),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: conversation.avatarColor,
              child: Text(
                conversation.name[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    conversation.name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    conversation.location,
                    style: const TextStyle(color: AppColors.teal, fontSize: 11),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    conversation.message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black54, fontSize: 11),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  conversation.time,
                  style: const TextStyle(color: Colors.black45, fontSize: 10),
                ),
                const SizedBox(height: 8),
                if (conversation.unread > 0)
                  Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.coral,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${conversation.unread}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ConversationScreen extends StatefulWidget {
  final MessagePreview conversation;
  const ConversationScreen({super.key, required this.conversation});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final _controller = TextEditingController();
  final _messages = <String>[];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(text);
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.conversation.name)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _bubble(widget.conversation.message, false),
                const SizedBox(height: 12),
                _bubble(
                  'Hi! Thanks for reaching out. I will get back to you shortly.',
                  false,
                ),
                ..._messages.map(
                  (message) => Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: _bubble(message, true),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Write a message...',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: _send,
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.dark,
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.arrow_upward),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bubble(String text, bool mine) {
    return Align(
      alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 290),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
        decoration: BoxDecoration(
          color: mine ? AppColors.dark : Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: mine ? Colors.white : Colors.black87,
            fontSize: 12,
            height: 1.35,
          ),
        ),
      ),
    );
  }
}
