import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ryc_chat/core/services/notification/chat_notification_service.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ChatNotificationService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Notificações'),
      ),
      body: ListView.builder(
        itemCount: service.itemsCount,
        itemBuilder: (_, index) {
          return Container();
        },
      ),
    );
  }
}
