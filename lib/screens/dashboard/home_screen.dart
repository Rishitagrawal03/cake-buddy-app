import 'package:flutter/material.dart';
import 'profile/profile_screen.dart';
import 'profile/personal_info/personal_info_screen.dart';
import 'profile/vehicle_info/vehicle_info_screen.dart';
import 'profile/bank_details/bank_details_screen.dart';
import 'profile/verification/verification_status_screen.dart';
import 'profile/notifications/notification_screen.dart';
import 'profile/support/help_support_screen.dart';

class HomeScreen extends StatelessWidget {
  final Widget onlineToggleCard;
  final Widget statsRow;
  final Widget offlineState;
  final Widget? activeOrderCard;
  final Widget availableOrders;
  final bool isOnline;

  const HomeScreen({
    super.key,
    required this.onlineToggleCard,
    required this.statsRow,
    required this.offlineState,
    required this.activeOrderCard,
    required this.availableOrders,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          onlineToggleCard,
          const SizedBox(height: 16),
          statsRow,
          const SizedBox(height: 20),
          if (!isOnline)
            offlineState
          else if (activeOrderCard != null)
            activeOrderCard!
          else
            availableOrders,
        ],
      ),
    );
  }
}
