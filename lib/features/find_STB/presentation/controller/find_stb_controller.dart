import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:network_tools/network_tools.dart';
import 'package:ramf2_app/core/api/api_links.dart';
import 'package:ramf2_app/core/error/StatusRequest.dart';
import 'package:ramf2_app/core/resources/const_values.dart';
import 'package:ramf2_app/core/translation/trans_keys.dart';
import 'package:ramf2_app/features/find_STB/data/models/device_details_model.dart';
import 'package:ramf2_app/features/find_STB/data/models/ip_data_model.dart';
import 'package:ramf2_app/features/find_STB/presentation/controller/find_stb_controller_imp.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:ramf2_app/features/home/data/models/stb_data_model.dart';

class FindSTBControllerScreen extends GetxController
    implements FindSTBControllerScreenImp {
  List<String?> listActiveHost = [];
  int countRamfDevice = 0;
  StatusRequest statusRequestAutoApi = StatusRequest.none;
  List<DeviceDetailsModel> listDeviceDetailsModel = [];
  List<DeviceDetailsModel> listRamfDevice = [];
  late STBDataModel stbData;

  late IpModelData ipModelData = IpModelData(
      wifiIp: "wifiIp",
      wifiSubMask: "wifiSubMask",
      wifiGatewayIP: "wifiGatewayIP");
  bool selectedRamf = false;

  FindSTBControllerScreen() {

    start();
    update();
  }

  void searchIp() async {
    listDeviceDetailsModel.clear();
    listRamfDevice.clear();
    countRamfDevice = 0;
    update();
    await getMacAddressAndName();
  }

  start() async {
    ipModelData = await getData();
    update();
  }

  @override
  void onTapAtRamfSelected() async {
    selectedRamf = !selectedRamf;
    filterRamfDevice();
    update();
  }

  void filterRamfDevice() async {
    listRamfDevice.length = 0;
    for (int i = 0; i < listDeviceDetailsModel.length; i++) {
      String? name = await listDeviceDetailsModel[i].hostName;
      if (name != null && name == ConstValues.kLwip) {
        listRamfDevice.add(listDeviceDetailsModel[i]);
      }
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    print("onInit");
    getMacAddressAndName();
  }

  Future<void> getMacAddressAndName() async {
    /// ======================== get path of application Directory ===================
    final appDocDirectory = await getApplicationDocumentsDirectory();
    IpModelData ipModelData = await getData();
    print(ipModelData);
    // ipModelData.wifiIp='192.168.1.2';
    /// TODO:: TO CHANGE WIFI IP MANUALLY
    await configureNetworkTools(appDocDirectory.path, enableDebugging: true);
    await getDevicesDetails(ipModelData);
    update();

  }

  double progress = 0;
  bool startProgress = false;

  Future<void> getDevicesDetails(IpModelData ipModelData) async {
    try {
      if (ipModelData.wifiIp != null) {
        startProgress = true;
        update();

        String subnet = ipModelData.wifiIp!
            .substring(0, ipModelData.wifiIp!.lastIndexOf('.'));
        String lastHostId = ipModelData.lastIp!.split('.').last;
        // final Stream<ActiveHost> stream =
        //     HostScannerService.instance.getAllPingableDevices(
        //   subnet,
        //   firstHostId: 1,
        //   lastHostId: 2,
        //   progressCallback: (progress) {
        //     print('Progress for host discovery : $progress');
        //   },
        //   resultsInAddressAscendingOrder: false,
        // ) ;
        final Stream<ActiveHost> stream =
            HostScannerService.instance.getAllPingableDevicesAsync(
          subnet,
          firstHostId: 1,
          lastHostId: int.parse(lastHostId) - 1,
          progressCallback: (progress) {
            this.progress = progress;
            update();
            print('Progress for host discovery : $progress');
          },
          // resultsInAddressAscendingOrder: false,
        );

        //
        listActiveHost.clear();
        stream.listen(
          cancelOnError: true,
          (ActiveHost host) async {
            var hostName = await host.hostName;
            String address = host.internetAddress.address.toString();
            if (listActiveHost.contains(address) == false) {
              if (hostName == 'lwip') {
                countRamfDevice++;
                if (selectedRamf) {
                  filterRamfDevice();
                }
              }
              listActiveHost.add(hostName);
              update();
               await makeConnectionStreaming(
                  DeviceDetailsModel.fromNetworkTool(host));
              listDeviceDetailsModel
                  .add(DeviceDetailsModel.fromNetworkTool(host));
              // print(listDeviceDetailsModel);
            }

            // print('mdnsInfo device: ${await host.mdnsInfo}');
            // print('arpData device: ${await host.arpData}');
            // print('internetAddress device: ${host.internetAddress}');
            // print('address device: ${host.internetAddress.address}');
            // print('type device: ${host.internetAddress.type}');
            // print('host device: ${host.internetAddress.host}');
            // print('isLinkLocal device: ${host.internetAddress.isLinkLocal}');
            // print('isLoopback device: ${host.internetAddress.isLoopback}');
            // print('isMulticast device: ${host.internetAddress.isMulticast}');
            // print('rawAddress device: ${host.internetAddress.rawAddress}');
            // print('openPorts device: ${host.openPorts}');
            print('hostName device: ${await host.hostName}');
            // print('deviceName device: ${await host.deviceName}');
            // print('number device: ${host.hostId}');
            // print('vendor device: ${await host.vendor}');
            // print('weirdHostName device: ${host.weirdHostName}');
            // print('getMacAddress device: ${await host.getMacAddress()}');
            // print('address device: ${host.address}');
            // print('pingData device: ${host.pingData}');
            // print('responseTime device: ${host.responseTime}');
          },

          // onDone: () {
          //   print('Scan completed');
          // },
        ); // Don't forget to cancel the stream when not in use.
      }
      startProgress = false;
    } catch (ex) {
      print(
          "error=======================================================================");
      print(ex.toString());
    }
  }

  Future<IpModelData> getData() async {
    final info = NetworkInfo();
    final lastIp = await info.getWifiBroadcast(); // 192.168.1.255
    final wifiIp = await info.getWifiIP(); // 192.168.1.255
    final wifiSubMask = await info.getWifiSubmask(); // 192.168.1.255
    final wifiName = await info.getWifiName(); // 192.168.1.255
    final wifiGatewayIP = await info.getWifiGatewayIP(); // 192.168.1.255
    print("last ip : $lastIp");
    print("wifi ip : $wifiIp");
    print("wifi name : $wifiName");
    print("wifi SubMask : $wifiSubMask");
    print("wifi Gateway Ip : $wifiGatewayIP");
    return IpModelData(
        wifiIp: wifiIp,
        wifiSubMask: wifiSubMask,
        wifiGatewayIP: wifiGatewayIP,
        lastIp: lastIp,
        wifiName: wifiName);
  }

  void onTapAtTabBar({required int index}) {
    switch (index) {
      case 0:

        /// auto (api )
        startAutoApi();
    }
  }

  late Timer t;
  String secondTick = "0";

  Future<bool> makeConnectionToBox(int index) async {
    try {
      statusRequestAutoApi = StatusRequest.loading;
      update();
      var response = await http
          .get(
            Uri.parse(
              ApiLinks.stbVersionEndPointUrl(
                  listDeviceDetailsModel[index].address),
            ),
          )
          .timeout(const Duration(seconds: 1));
      if (jsonDecode(response.body)['ret_code'] == "NO_ERR") {
        stbData = STBDataModel.fromJson(jsonDecode(response.body));
        statusRequestAutoApi = StatusRequest.sucess;
        listRamfDevice[index].streamingChannel!=stbData.streamingChannel;
        listRamfDevice[index].events!=stbData.streamingChannel;
        listRamfDevice[index].stpName!=stbData.stbName;
        listRamfDevice[index].serial!=stbData.serial;
        update();return true;
      }
      update();
      return false;
    } catch (e) {
      update();
      return false;
    }
  }

  Future<bool> makeConnectionStreaming(DeviceDetailsModel device) async {
    try {
      statusRequestAutoApi = StatusRequest.loading;
      update();

      var response = await http
          .get(
            Uri.parse(
              ApiLinks.stbVersionEndPointUrl(device.address),
            ),
          )
          .timeout(const Duration(seconds: 1));
       if (jsonDecode(response.body)['ret_code'] == "NO_ERR") {
        stbData = STBDataModel.fromJson(jsonDecode(response.body));
        statusRequestAutoApi = StatusRequest.sucess;
        print("i found it " + device.address);
        listRamfDevice.add(device);
        update();
        return true;
      } else {
        print("not connected");
      }
      update();
      return false;
    } catch (e) {
      update();
      print("not connected  and exception");

      return false;
    }
  }

  startAutoApi() async {
    startProgress=true;
    update();
    for (int i = 0; i < listDeviceDetailsModel.length; i++) {
      bool connected = await makeConnectionToBox(i);
      if (connected) {
         String? host = await listDeviceDetailsModel[i].hostName;
        print(host);
        print(listDeviceDetailsModel[i].internetAddress);
      } else
        print("not found");
    }
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    print(connectivityResult);
    print(connectivityResult.contains(ConnectivityResult.wifi));
    startProgress=false;
    update();
  }
}
//TODO :: connections mode not maked
