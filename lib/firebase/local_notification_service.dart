import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    InitializationSettings initializationSettings =
        const InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));

    _notificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? route) async {
        if (route != null) {
          Navigator.of(context).pushNamed(route);
        }
      },
    );
  }

  static void display(RemoteMessage message) async {
    try {
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          'wayToSuccess',
          'wayToSucess channel',
          importance: Importance.max,
          priority: Priority.high,
        ),
      );
      await _notificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data["route"],
      );
    } on Exception catch (e) {
      print('Exception - $e');
    }
  }
}
