import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bootpay_flutter_platform_interface.dart';

/// An implementation of [BootpayFlutterPlatform] that uses method channels.
class MethodChannelBootpayFlutter extends BootpayFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bootpay_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
