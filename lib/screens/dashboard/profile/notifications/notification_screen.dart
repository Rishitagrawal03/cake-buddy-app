import 'package:flutter/material.dart';
import 'package:my_app/utils/app_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool orderNotifications = true;
  bool paymentNotifications = true;
  bool promotionalNotifications = false;

  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'New Delivery Request',
      'message': 'You have received a new delivery request.',
      'time': '10 minutes ago',
      'icon': Icons.delivery_dining,
      'read': false,
    },
    {
      'title': 'Payment Received',
      'message': 'Your payment of ₹250 has been credited.',
      'time': '1 hour ago',
      'icon': Icons.account_balance_wallet,
      'read': false,
    },
    {
      'title': 'Order Completed',
      'message': 'Your delivery CB1001 was completed successfully.',
      'time': 'Yesterday',
      'icon': Icons.check_circle,
      'read': true,
    },
    {
      'title': 'Welcome to CakeBuddy',
      'message': 'Welcome! Start accepting delivery requests.',
      'time': '2 days ago',
      'icon': Icons.celebration,
      'read': true,
    },
  ];

  void markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification['read'] = true;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All notifications marked as read.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: AppColors.yellow,
        foregroundColor: AppColors.black,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: markAllAsRead,
            child: const Text(
              'Mark all read',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Notification Settings',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),

          const SizedBox(height: 12),

          _NotificationSetting(
            title: 'Order Notifications',
            subtitle: 'Get updates about new and active deliveries',
            value: orderNotifications,
            onChanged: (value) {
              setState(() {
                orderNotifications = value;
              });
            },
          ),

          _NotificationSetting(
            title: 'Payment Notifications',
            subtitle: 'Get updates about payments and earnings',
            value: paymentNotifications,
            onChanged: (value) {
              setState(() {
                paymentNotifications = value;
              });
            },
          ),

          _NotificationSetting(
            title: 'Promotional Notifications',
            subtitle: 'Receive offers and announcements',
            value: promotionalNotifications,
            onChanged: (value) {
              setState(() {
                promotionalNotifications = value;
              });
            },
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Notifications',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              Text(
                '${notifications.where((n) => n['read'] == false).length} unread',
                style: const TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          if (notifications.isEmpty)
            const Padding(
              padding: EdgeInsets.all(30),
              child: Center(child: Text('No notifications available.')),
            ),

          ...notifications.map((notification) {
            final bool isRead = notification['read'];

            return Card(
              color: isRead
                  ? AppColors.white
                  : AppColors.yellow.withValues(alpha: 0.15),
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: CircleAvatar(
                  backgroundColor: AppColors.yellow,
                  child: Icon(notification['icon'], color: AppColors.black),
                ),
                title: Text(
                  notification['title'],
                  style: TextStyle(
                    fontWeight: isRead ? FontWeight.w500 : FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification['message']),
                      const SizedBox(height: 6),
                      Text(
                        notification['time'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: isRead
                    ? null
                    : const Icon(
                        Icons.circle,
                        size: 10,
                        color: AppColors.yellow,
                      ),
                onTap: () {
                  setState(() {
                    notification['read'] = true;
                  });
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _NotificationSetting extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _NotificationSetting({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: SwitchListTile(
        activeThumbColor: AppColors.yellow,
        activeTrackColor: AppColors.black,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: AppColors.grey, fontSize: 12),
        ),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
