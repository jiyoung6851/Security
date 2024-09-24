import 'package:flutter_test/flutter_test.dart';
import 'package:bootpay_flutter/bootpay_flutter.dart';
import 'package:bootpay_flutter/bootpay_flutter_platform_interface.dart';
import 'package:bootpay_flutter/bootpay_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBootpayFlutterPlatform
    with MockPlatformInterfaceMixin
    implements BootpayFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BootpayFlutterPlatform initialPlatform = BootpayFlutterPlatform.instance;

  test('$MethodChannelBootpayFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBootpayFlutter>());
  });

  test('getPlatformVersion', () async {
    BootpayFlutter bootpayFlutterPlugin = BootpayFlutter();
    MockBootpayFlutterPlatform fakePlatform = MockBootpayFlutterPlatform();
    BootpayFlutterPlatform.instance = fakePlatform;

    expect(await bootpayFlutterPlugin.getPlatformVersion(), '42');
  });
}
