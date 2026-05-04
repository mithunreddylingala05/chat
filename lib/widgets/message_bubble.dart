import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String senderEmail;
  final dynamic timestamp;
  final bool isMe;

  const MessageBubble({
    super.key,
    required this.message,
    required this.senderEmail,
    required this.timestamp,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    String time = '';

    if (timestamp is Timestamp) {
      time = DateFormat('hh:mm a').format(timestamp.toDate());
    }

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.78,
        ),
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFF4F46E5) : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(isMe ? 18 : 4),
            bottomRight: Radius.circular(isMe ? 4 : 18),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (!isMe)
              Text(
                senderEmail,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            if (!isMe) const SizedBox(height: 4),
            Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color: isMe ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              time,
              style: TextStyle(
                fontSize: 11,
                color: isMe ? Colors.white70 : Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
