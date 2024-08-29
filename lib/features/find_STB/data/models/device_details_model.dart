import 'dart:io';

import 'package:dart_ping/dart_ping.dart';
import 'package:equatable/equatable.dart';
import 'package:network_tools/network_tools.dart';
// import 'package:dart_ping/src/models/ping_data.dart';

class DeviceDetailsModel extends Equatable{
  final PingData pingData;

  final Future<MdnsInfo?> mdnsInfo;
  final Future<ARPData?> arpData;
  final InternetAddress internetAddress;
  final List<OpenPort> openPorts;
  final Future<String?> hostName;
  final Future<String> deviceName;
  final String hostId;
  final Future<Vendor?> vendor;
  final String weirdHostName;
  final String address;
  final String? stpName;
  final String? events;
  final String? serial;
  final String? streamingChannel;
  final Duration? responseTime;

  @override
  List<Object?> get props => [
        pingData,
        mdnsInfo,
        arpData,
        internetAddress,
        openPorts,
        hostName,
        deviceName,
        hostId,
        vendor,
        weirdHostName,
        address,
        responseTime,
      ];

  factory DeviceDetailsModel.fromNetworkTool(ActiveHost host) {
    return DeviceDetailsModel(
      internetAddress: host.internetAddress,
      openPorts: host.openPorts,
      deviceName: host.deviceName,
      hostId: host.hostId,
      weirdHostName: host.weirdHostName,
      address: host.address,
      responseTime: host.responseTime,
      arpData: host.arpData,
      mdnsInfo: host.mdnsInfo,
      vendor: host.vendor,
      hostName: host.hostName,
      pingData: host.pingData,
    );
  }

  const DeviceDetailsModel({
    required this.mdnsInfo,
    required this.pingData,
     this.stpName,
     this.serial,
     this.events,
     this.streamingChannel,
    required this.arpData,
    required this.internetAddress,
    required this.openPorts,
    required this.hostName,
    required this.deviceName,
    required this.hostId,
    required this.vendor,
    required this.weirdHostName,
    required this.address,
    this.responseTime,
  });
}
