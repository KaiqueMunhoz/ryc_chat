import 'package:flutter/material.dart';
import 'package:ryc_chat/core/models/chat_notification.dart';

class PushNotificationService with ChangeNotifier {
  List<ChatNotification> _items = [];

  List<ChatNotification> get items {
    return [..._items];
  }

  void add(ChatNotification notification) {
    _items.add(notification);
    notifyListeners();
  }

  void remove(int index) {
    _items.removeAt(index);
  }
}
