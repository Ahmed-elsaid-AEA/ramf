import 'package:equatable/equatable.dart';

class IpModelData extends Equatable {
  final String? lastIp;
  final String? wifiIp;
  final String? wifiName;
  final String? wifiSubMask;
  final String? wifiGatewayIP;

  @override
  String toString() {
    return 'IpModelData{lastIp: $lastIp, wifiIp: $wifiIp, wifiName: $wifiName, wifiSubMask: $wifiSubMask, wifiGatewayIP: $wifiGatewayIP}';
  }

  const IpModelData({
    this.lastIp,
    required this.wifiIp,
    this.wifiName,
    required this.wifiSubMask,
    required this.wifiGatewayIP,
  });

  @override
  List<Object?> get props => [
        lastIp,
        wifiIp,
        wifiName,
        wifiSubMask,
        wifiGatewayIP,
      ];
}
