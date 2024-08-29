import 'dart:developer';
import 'dart:io';
import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:network_tools/network_tools.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ramf2_app/app/ramf2_app.dart';
import 'package:ramf2_app/core/services/my_services.dart';
import 'package:ramf2_app/features/find_STB/data/models/ip_data_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // // readDataFromFiles();
  await initialServices();
  // testPing();
//    dns();
// ping();
   // pingAddress();
//   pingUsingDartPingPackage();
//   tcpPing('192.168.1.10', 80); // Example usage with Google's public server
//   print(ipRange('10.5.1.1/12'));
//   print(ipRange('192.168.0.1/25'));

  runApp(const RAMF2App());
  // getPublicIp();
  // getLanScanner();
}

int ip2int(String ipAddr) {
  final parts = ipAddr.split('.').map((str) => int.parse(str)).toList();

  return (parts[0] << 24) + (parts[1] << 16) + (parts[2] << 8) + (parts[3]);
}

String int2ip(int ipAddr) {
  return [
    (ipAddr >> 24).toString(),
    ((ipAddr & 0xff0000) >> 16).toString(),
    ((ipAddr & 0xff00) >> 8).toString(),
    (ipAddr & 0xff).toString()
  ].join('.');
}

List<String> ipRange(String cidr) {
  final range = ['', ''];
  final cidrSplit = cidr.split('/');

  range[0] =
      int2ip((ip2int(cidrSplit[0])) & ((-1 << (32 - int.parse(cidrSplit[1])))));
  range[1] = int2ip(
      (ip2int(range[0])) + (1 << (32 - int.parse(cidrSplit[1]))).toInt() - 1);

  return range;
}

Future<void> tcpPing(String host, int port) async {
  try {
    // Record the time before attempting to connect
    final Stopwatch stopwatch = Stopwatch()..start();

    // Try to connect to the specified host and port
    final Socket socket =
        await Socket.connect(host, port, timeout: const Duration(seconds: 5));

    // Stop the stopwatch as soon as the connection is successful
    stopwatch.stop();

    // Print the connection time in milliseconds
    print('Connected to $host:$port in ${stopwatch.elapsedMilliseconds}ms');

    // Close the socket
    socket.destroy();
  } on SocketException catch (e) {
    print('Failed to connect to $host:$port - $e');
  }
}

void testPing() async {
  // String address = '192.168.1.12';
  // or You can also get address using network_info_plus package
  final String? address = await (NetworkInfo().getWifiIP());
  if (address != null) {
    final String subnet = address.substring(0, address.lastIndexOf('.'));
    final stream = HostScannerService.instance
        .getAllPingableDevicesAsync(subnet, firstHostId: 1, lastHostId: 50,
            progressCallback: (progress) {
      print('Progress for host discovery : $progress');
    });

    stream.listen((host) {
      //Same host can be emitted multiple times
      //Use Set<ActiveHost> instead of List<ActiveHost>
      print('Found device: $host');
    }, onDone: () {
      print('Scan completed');
    }); // Don't forget to cancel the stream when not in use.}
  }
}

// void wifiScan() async {
//   final can =
//       await WiFiScan.instance.canGetScannedResults(askPermissions: true);
//   print(can);
// }
//
// void getLanScanner() async {
//   final scanner = LanScanner();
//
//   final List<Host> hosts = await scanner.quickIcmpScanAsync('192.168.0');
//   log(hosts.toString());
//
//   final info = NetworkInfo();
//   //
//   final String? wifiName = await info.getWifiName(); // "FooNetwork"
//   final String? wifiBSSID = await info.getWifiBSSID(); // 11:22:33:44:55:66
//   final wifiIP = await info.getWifiIP(); // 192.168.1.43
//   final wifiIPv6 =
//       await info.getWifiIPv6(); // 2001:0db8:85a3:0000:0000:8a2e:0370:7334
//   final wifiSubmask = await info.getWifiSubmask(); // 255.255.255.0
//   final wifiBroadcastwifiBroadcast =
//       await info.getWifiBroadcast(); // 192.168.1.255
//   final wifiGateway = await info.getWifiGatewayIP(); // 192.168.1.1
//   print(wifiName);
//   print(wifiBSSID);
//   print(wifiIP);
//   print(wifiIPv6);
//   print(wifiSubmask);
//   print(wifiGateway);
//   print(wifiBroadcastwifiBroadcast);
//   print("++++++++++++++++++++++++++");
// //   // 192.168.0.1
//   var wifiIP2 = await NetworkInfo().getWifiIP();
// // //
//   print(wifiIP2);
// // // // 192.168.0
//   if (wifiIP != null) {
//     var subnet = ipToCSubnet(wifiIP);
//     print(subnet);
//    }
// }
void pingAddress() {
  final ping = Ping('8.8.8.8'); // Replace with the desired IP or hostname

  ping.stream.listen((event) {
    if (event.response != null) {
      print(
          'Response from ${event.response!.time}: ${event.response!.time} ms');
    } else {
      print('Request timed out');
    }
  });
}

void pingUsingDartPingPackage() {
  // Create ping object with desired args
  final ping = Ping('192.168.1.20', count: 5);

  // Begin ping process and listen for output
  ping.stream.listen((event) {
    print(event);
    // print(event.response!.ttl!);
  });
}

void ping() async {
  final result = await Process.run('ping', ['-c', '4', '192.168.1.1']);
  print(result.exitCode.toString());
  print(result.pid.toString());
  print(result.stderr.toString());
  print(result.stdout.toString());
  print("sd");
}

void dns() async {
  for (final ActiveHost activeHost
      in await MdnsScannerService.instance.searchMdnsDevices()) {
    final MdnsInfo? mdnsInfo = await activeHost.mdnsInfo;
    print('''
    Address: ${activeHost.address}
    Port: ${mdnsInfo!.mdnsPort}
    ServiceType: ${mdnsInfo.mdnsServiceType}
    MdnsName: ${mdnsInfo.getOnlyTheStartOfMdnsName()}
    ''');
  }
}
// //
// // void readDataFromFiles() async {
// //   String filePath = 'assets/fr.text';
// //   String data = await rootBundle.loadString(filePath);
// //   print(data);
// // }
// //
// // void getPublicIp() async {
// //   final ipv4 = await Ipify.ipv4();
// //   print(ipv4); // 98.207.254.136
// //
// //   final ipv6 = await Ipify.ipv64();
// //   print(ipv6); // 98.207.254.136 or 2a00:1450:400f:80d::200e
// //
// //   final ipv4json = await Ipify.ipv64(format: Format.JSON);
// //   print(ipv4json); //{"ip":"98.207.254.136"} or {"ip":"2a00:1450:400f:80d::200e
// // }
//url = "jdbc:mysql://localhost:3306/maker?useUnicode=yes&characterEncoding=UTF-8"
