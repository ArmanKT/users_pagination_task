import 'package:flutter/material.dart';
import 'package:users_pagination_task/app/components/clippers/diagonal_clipper.dart';
import 'package:users_pagination_task/app/components/image/my_network_image_widget.dart';
import 'package:users_pagination_task/app/core/utils/utils_exporter.dart';
import 'package:users_pagination_task/app/features/user_list/data/models/user_model.dart';

class UserDetailPage extends StatelessWidget {
  final UserModel user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.fullName)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top header with image
            ClipPath(
              clipper: DiagonalClipper(),
              child: Container(
                width: double.infinity,
                height: 320,
                color: context.primaryColor,
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.paddingLarge),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'user_${user.id}',
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.paddingExtraSmall),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            shape: BoxShape.circle,
                          ),
                          child: MyNetworkImageWidget(
                            imageUrl: user.image,
                            width: Dimensions.avatarHuge,
                            height: Dimensions.avatarHuge,
                            radius: Dimensions.radiusMax,
                            isProfile: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: Dimensions.padding),
                      Text(
                        user.fullName,
                        style: context.titleLarge.copyWith(
                          color: AppColors.surface,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Details section
            Transform.translate(
              offset: const Offset(0, -40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.padding),
                child: Column(
                  children: [
                    _buildBadge(context),
                    const SizedBox(height: Dimensions.paddingLarge),
                    // Personal Info
                    _buildInfoTile(icon: Icons.person, title: AppStrings.fullName, value: user.fullName, context: context),
                    _buildInfoTile(icon: Icons.person, title: AppStrings.firstName, value: user.firstName, context: context),
                    _buildInfoTile(icon: Icons.person, title: AppStrings.lastName, value: user.lastName, context: context),
                    _buildInfoTile(icon: Icons.cake, title: AppStrings.maidenName, value: user.maidenName, context: context),
                    _buildInfoTile(icon: Icons.calendar_today, title: AppStrings.age, value: user.age.toString(), context: context),
                    _buildInfoTile(icon: Icons.male, title: AppStrings.gender, value: user.gender, context: context),
                    _buildInfoTile(icon: Icons.email, title: AppStrings.email, value: user.email, context: context),
                    _buildInfoTile(icon: Icons.phone, title: AppStrings.phone, value: user.phone, context: context),
                    _buildInfoTile(icon: Icons.account_circle, title: AppStrings.username, value: user.username, context: context),
                    _buildInfoTile(icon: Icons.calendar_month, title: AppStrings.birthDate, value: user.birthDate, context: context),
                    _buildInfoTile(icon: Icons.bloodtype, title: AppStrings.bloodGroup, value: user.bloodGroup, context: context),
                    _buildInfoTile(icon: Icons.height, title: AppStrings.height, value: '${user.height} cm', context: context),
                    _buildInfoTile(icon: Icons.monitor_weight, title: AppStrings.weight, value: '${user.weight} kg', context: context),
                    _buildInfoTile(icon: Icons.remove_red_eye, title: AppStrings.eyeColor, value: user.eyeColor, context: context),
                    _buildInfoTile(icon: Icons.style, title: AppStrings.hair, value: '${user.hair.color} (${user.hair.type})', context: context),
                    _buildInfoTile(icon: Icons.router, title: AppStrings.ip, value: user.ip, context: context),
                    _buildInfoTile(icon: Icons.map, title: AppStrings.address, value: '${user.address.address}, ${user.address.city}, ${user.address.state}, ${user.address.country}', context: context),
                    _buildInfoTile(icon: Icons.device_hub, title: AppStrings.macAddress, value: user.macAddress, context: context),
                    _buildInfoTile(icon: Icons.school, title: AppStrings.university, value: user.university, context: context),
                    _buildInfoTile(icon: Icons.account_balance, title: AppStrings.bank, value: '${user.bank.cardType} ${user.bank.cardNumber}', context: context),
                    _buildInfoTile(icon: Icons.business, title: AppStrings.company, value: '${user.company.name} (${user.company.title})', context: context),
                    _buildInfoTile(icon: Icons.numbers, title: AppStrings.ein, value: user.ein, context: context),
                    _buildInfoTile(icon: Icons.security, title: AppStrings.ssn, value: user.ssn, context: context),
                    _buildInfoTile(icon: Icons.device_unknown, title: AppStrings.userAgent, value: user.userAgent, context: context),
                    _buildInfoTile(icon: Icons.currency_bitcoin, title: AppStrings.crypto, value: '${user.crypto.coin} (${user.crypto.network})', context: context),
                    _buildInfoTile(icon: Icons.verified_user, title: AppStrings.role, value: user.role, context: context),

                    const SizedBox(height: Dimensions.paddingLarge),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.padding, vertical: Dimensions.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.badge, color: context.primaryColor, size: Dimensions.iconSmall),
          const SizedBox(width: Dimensions.paddingSmall),
          Text('${AppStrings.userID}: #${user.id}', style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600, color: context.primaryColor)),
        ],
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String value,
    required BuildContext context,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Dimensions.paddingSmall / 2),
      padding: const EdgeInsets.all(Dimensions.padding),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(Dimensions.radius),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: context.primaryColor,
            radius: Dimensions.paddingLarge,
            child: Icon(icon, color: AppColors.surface, size: Dimensions.iconSmall),
          ),
          const SizedBox(width: Dimensions.padding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.bodySmall.copyWith(color: AppColors.textSecondary)),
                const SizedBox(height: Dimensions.paddingSmall),
                Text(value, style: context.titleMedium.copyWith(fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
