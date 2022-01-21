import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:way_to_success/common/variables/app_variables.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    InitializationSettings initializationSettings =
        const InitializationSettings(
            android: AndroidInitializationSettings(AppVariables.iconPath));

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
          AppVariables.success,
          AppVariables.succesChannel,
          importance: Importance.max,
          priority: Priority.high,
        ),
      );
      await _notificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data[AppVariables.route],
      );
    } on Exception catch (e) {
      return log('$e');
    }
  }
}
