import 'dart:async';
import 'dart:convert';
 import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ramf2_app/core/api/api_links.dart';
import 'package:ramf2_app/models/return_sat_list_model.dart';
import 'package:ramf2_app/models/return_tp_list_model.dart';

class MainController {
  late StreamController<bool> streamController;
  bool loading = false;
  late Sink<bool> inputData;
  late Stream<bool> outPutData;
  late StreamController<int> streamControllerStatusCode;
  late Sink<int> inputStatusCode;
  late Stream<int> outPutStatusCode;
  late StreamController<int> streamCountList;
  late Sink<int> inputCountList;
  late Stream<int> outPutCountList;
  late StreamController<int> streamControllerValueReturnTpList;
  late Sink<int> inputValueReturnTpList;
  late Stream<int> outPutValueReturnTpList;
  late StreamController<List<ReturnSatListModel>> streamButtonList;
  late Sink<List<ReturnSatListModel>> inputButtonList;
  late Stream<List<ReturnSatListModel>> outPutButtonList;
  late StreamController<List<ReturnSatListModel>>
      streamControllerReturnSatListModel;
  late Sink<List<ReturnSatListModel>> inputReturnSatListModel;
  late Stream<List<ReturnSatListModel>> outPutReturnSatListModel;
  late TextEditingController controllerIp;
  List<ReturnSatListModel> listReturnSatListModel = [];
  List<ReturnTPListMode> listReturnTPListModel = [];
  int statusCode = 0;
  var valueReturnTpList = 0;
  late StreamController<List<ReturnTPListMode>> streamControllerReturnTPList;
  late Sink<List<ReturnTPListMode>> inputReturnTPList;
  late Stream<List<ReturnTPListMode>> outPutReturnTPList;

  // ===
  late StreamController<int> streamControllerCountReturnTPList;
  late Sink<int> inputReturnCountTPList;
  late Stream<int> outPutReturnCountTPList;

  void onDispose() {
    streamControllerReturnSatListModel.close();
    streamController.close();
    streamControllerStatusCode.close();
    inputData.close();
    inputStatusCode.close();
    inputReturnSatListModel.close();
    streamControllerReturnTPList.close();
    inputReturnTPList.close();
    streamControllerCountReturnTPList.close();
    inputReturnCountTPList.close();
    streamControllerValueReturnTpList.close();
    inputValueReturnTpList.close();
  }

  MainController() {
    streamController = StreamController();
    inputData = streamController.sink;
    outPutData = streamController.stream;
    streamControllerStatusCode = StreamController();
    inputStatusCode = streamControllerStatusCode.sink;
    outPutStatusCode = streamControllerStatusCode.stream;
    streamControllerReturnSatListModel = StreamController();
    inputReturnSatListModel = streamControllerReturnSatListModel.sink;
    outPutReturnSatListModel =
        streamControllerReturnSatListModel.stream.asBroadcastStream();
    streamCountList = StreamController();
    inputCountList = streamCountList.sink;
    outPutCountList = streamCountList.stream;
    //=////////////////////////////
    streamControllerReturnTPList = StreamController();
    inputReturnTPList = streamControllerReturnTPList.sink;
    outPutReturnTPList = streamControllerReturnTPList.stream;
    streamControllerCountReturnTPList = StreamController();
    inputReturnCountTPList = streamControllerCountReturnTPList.sink;
    outPutReturnCountTPList = streamControllerCountReturnTPList.stream;
    // ======================================
    streamButtonList = StreamController();
    inputButtonList = streamButtonList.sink;
    outPutButtonList = streamButtonList.stream;

    /// * --------------------------
    streamControllerValueReturnTpList = StreamController();
    inputValueReturnTpList = streamControllerValueReturnTpList.sink;
    outPutValueReturnTpList = streamControllerValueReturnTpList.stream;
    inputReturnSatListModel.add(listReturnSatListModel);
    inputButtonList.add(listReturnSatListModel);
    controllerIp = TextEditingController();
    controllerIp.text = '192.168.2.39';
    inputData.add(loading);
    inputStatusCode.add(statusCode);
    inputCountList.add(listReturnSatListModel.length);
    inputReturnTPList.add(listReturnTPListModel);
    inputReturnCountTPList.add(listReturnTPListModel.length);
    inputValueReturnTpList.add(valueReturnTpList);
  }

  //http://192.168.1.13/

  void getDataReturnSatList({required String ip}) async {
    try {
      loading = true;
      inputData.add(loading);

      var response = await http.get(Uri.parse(ApiLinks.returnSatListEndPoint));
      // Future.delayed(Duration(seconds: 10),() {
      // debugPrint(response.body,wrapWidth: 10000);

      inputStatusCode.add(response.statusCode);

      if (jsonDecode(response.body)['ret_code'] == "DB_NO_ERR") {
        listReturnSatListModel = (jsonDecode(response.body)['sat_list'] as List)
            .map((item) => ReturnSatListModel.fromJson(item))
            .toList();
        print(response.body);
        inputReturnSatListModel.add(listReturnSatListModel);
        inputCountList.add(listReturnSatListModel.length);
        inputButtonList.add(listReturnSatListModel);

        // ReturnSatListModel r =
        //     ReturnSatListModel.fromJson(jsonDecode(response.body));
        // for(SatList satList in r.satList!){
        // print(r.satList![0]);
        //   list=r.satList!;
        // }

        loading = false;
        inputData.add(loading);
        // },);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void getDataReturnTPList({required int satID}) async {
    try {
      var response =
          await http.get(Uri.parse(ApiLinks.returnTPListEndPoint(satID)));
      inputStatusCode.add(response.statusCode);
      print(response.body);
      if (jsonDecode(response.body)['ret_code'] == "DB_NO_ERR") {
        listReturnTPListModel = (jsonDecode(response.body)['tp_list'] as List)
            .map((item) => ReturnTPListMode.fromJson(item))
            .toList();
        inputReturnTPList.add(listReturnTPListModel);
        inputReturnCountTPList.add(listReturnTPListModel.length);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void changeValueReturnTpList(int value) {
    valueReturnTpList = value;
    inputValueReturnTpList.add(valueReturnTpList);
  }
}
