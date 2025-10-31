import 'package:flutter/material.dart';
import 'package:users_pagination_task/app/core/di/service_locator.dart';
import 'package:users_pagination_task/app/core/service/network_service.dart';
import 'package:flutter/material.dart';
import 'package:users_pagination_task/app/core/service/network_service.dart';
import 'package:users_pagination_task/app/core/utils/utils_exporter.dart';

class NetworkStatusIndicator extends StatelessWidget {
  const NetworkStatusIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final networkService = serviceLocator<NetworkService>();

    return StreamBuilder<bool>(
      stream: networkService.onStatusChange.distinct(),
      initialData: networkService.isOnline,
      builder: (context, snapshot) {
        final isOnline = snapshot.data ?? true;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isOnline ? AppColors.success : AppColors.error,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isOnline ? Icons.wifi_rounded : Icons.wifi_off_rounded,
                color: AppColors.textOnPrimary,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                isOnline ? AppStrings.online : AppStrings.offline,
                style: const TextStyle(
                  color: AppColors.textOnPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
