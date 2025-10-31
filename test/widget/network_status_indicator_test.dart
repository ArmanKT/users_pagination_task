import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:users_pagination_task/app/core/di/service_locator.dart';
import 'package:users_pagination_task/app/core/service/network_service.dart';
import 'package:users_pagination_task/app/features/user_list/presentation/screens/widgets/network_status_indicator.dart';
import 'package:users_pagination_task/app/core/utils/utils_exporter.dart';

class FakeNetworkService implements NetworkService {
  final StreamController<bool> _controller = StreamController<bool>.broadcast();
  bool _isOnline;

  FakeNetworkService({bool initialOnline = true}) : _isOnline = initialOnline;

  @override
  Stream<bool> get onStatusChange => _controller.stream;

  @override
  bool get isOnline => _isOnline;

  void setOnline(bool value) {
    _isOnline = value;
    _controller.add(value);
  }

  @override
  void dispose() => _controller.close();
}

void main() {
  late FakeNetworkService fakeNetworkService;

  setUp(() async {
    // Reset and register a fake network service (await reset to ensure clean state)
    await serviceLocator.reset();
    fakeNetworkService = FakeNetworkService(initialOnline: true);
    serviceLocator.registerSingleton<NetworkService>(fakeNetworkService);
  });

  tearDown(() async {
    fakeNetworkService.dispose();
    await serviceLocator.reset();
  });

  testWidgets('shows Online when network is online and updates to Offline', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(child: NetworkStatusIndicator()),
        ),
      ),
    );

    // Initial state should be online
    await tester.pumpAndSettle();
    expect(find.text(AppStrings.online), findsOneWidget);

    // Simulate offline
    fakeNetworkService.setOnline(false);
    await tester.pumpAndSettle(const Duration(milliseconds: 400));

    expect(find.text(AppStrings.offline), findsOneWidget);
  });
}
