import 'package:flutter/material.dart';
import 'package:ramf2_app/models/return_sat_list_model.dart';
import 'package:ramf2_app/models/return_tp_list_model.dart';

import '../features/home/presentation/controller/main_controller.dart';

class Ramf2 extends StatefulWidget {
  const Ramf2({super.key});

  @override
  State<Ramf2> createState() => _Ramf2State();
}

class _Ramf2State extends State<Ramf2> {
  late MainController mainController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mainController.onDispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainController = MainController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomStatusAppBar(stream: mainController.outPutStatusCode),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              // Container(
              //   height: 50,
              //   child: ListView.builder(itemCount: 20,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) =>
              //         ElevatedButton(onPressed: () {}, child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Text("data"),
              //         )),
              //   ),
              // ),

              StreamBuilder(
                stream: mainController.outPutData,
                builder: (context, snapshot) =>
                    snapshot.data == null || snapshot.data == false
                        ? const SizedBox(
                            height: 40,
                          )
                        : const SizedBox(
                            height: 40, child: CircularProgressIndicator()),
              ),
              TextField(
                onSubmitted: (value) {
                  mainController.getDataReturnSatList(ip: value);
                },
                controller: mainController.controllerIp,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  mainController.getDataReturnSatList(
                      ip: mainController.controllerIp.text);
                },
                child: const Text("add"),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: StreamBuilder(
                          stream: mainController.outPutReturnSatListModel,
                          builder: (context, snapshot) {
                            return DropdownButton<int>(
                              value: 0,
                              items: [
                                for (int index = 0;
                                    index <
                                        ((snapshot.data == null)
                                            ? 0
                                            : snapshot.data!.length);
                                    index++)
                                  DropdownMenuItem(
                                      value: mainController
                                          .listReturnSatListModel[index].satID,
                                      child: CustomData2(
                                          returnSatListModel: mainController
                                              .listReturnSatListModel[index])),
                              ],
                              onChanged: (value) {
                                if (value != null) {
                                  print(value);
                                  mainController.getDataReturnTPList(
                                      satID: value);
                                }
                              },
                            );
                          }),
                    ),
                    StreamBuilder<int>(
                        stream: mainController.outPutCountList,
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data.toString(),
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          );
                        }),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: StreamBuilder(
                          stream: mainController.outPutReturnTPList,
                          builder: (context, snapshot) {
                            if (snapshot.data != null) print(snapshot.data);
                            return snapshot.data == null ||
                                    snapshot.data!.isEmpty
                                ? const SizedBox()
                                : StreamBuilder(
                                    stream:
                                        mainController.outPutValueReturnTpList,
                                    builder: (context, snapshotValue) =>
                                        DropdownButton<int>(
                                      value: (snapshotValue.data == null)
                                          ? 0
                                          : snapshotValue
                                              .data! /*snapshot.data![0].sr*/,
                                      items: [
                                        for (int index = 0;
                                            index <
                                                ((snapshot.data == null)
                                                    ? 0
                                                    : snapshot.data!.length);
                                            index++)
                                          DropdownMenuItem(
                                              value: snapshot.data![index].sr,
                                              child: CustomData3(
                                                  returnTPListMode:
                                                      snapshot.data![index])),
                                      ],
                                      onChanged: (value) {
                                        // if (value != null) {
                                        //   mainController.getDataReturnTPList(
                                        //       satID: value);
                                        // }
                                      },
                                    ),
                                  );
                          }),
                    ),
                    StreamBuilder<int>(
                        stream: mainController.outPutReturnCountTPList,
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data.toString(),
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          );
                        }),
                  ],
                ),
              ),
              // Row(
              //   children: [
              //     const Text(
              //       "Count : ",
              //       style: TextStyle(
              //           color: Colors.red,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 20),
              //     ),
              //     const Spacer(),
              //
              //   ],
              // ),
              // Expanded(
              //   child: StreamBuilder<List<ReturnSatListModel>>(
              //     stream: mainController.outPutReturnSatListModel,
              //     builder: (context, snapshot) => ListView.separated(
              //         itemBuilder: (context, index) => CustomData(
              //             returnSatListModel:
              //                 mainController.listReturnSatListModel[index]),
              //         separatorBuilder: (context, index) => const Divider(),
              //         itemCount:
              //             mainController.listReturnSatListModel.length),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomData extends StatelessWidget {
  const CustomData({super.key, required this.returnSatListModel});

  final ReturnSatListModel returnSatListModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('sat_degeree : ${returnSatListModel.satDegree}'),
        Text('direction : ${returnSatListModel.direction}'),
        Text('sat_name : ${returnSatListModel.satName}'),
      ],
    );
  }
}

class CustomData2 extends StatelessWidget {
  const CustomData2({super.key, required this.returnSatListModel});

  final ReturnSatListModel returnSatListModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
            ' ${returnSatListModel.satDegree}  ${returnSatListModel.direction} :  ${returnSatListModel.satName}'),
      ],
    );
  }
}

class CustomData3 extends StatelessWidget {
  const CustomData3({super.key, required this.returnTPListMode});

  final ReturnTPListMode returnTPListMode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
            ' ${returnTPListMode.freq}  ${returnTPListMode.polarity} :  ${returnTPListMode.sr}'),
      ],
    );
  }
}

class CustomStatusAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomStatusAppBar({super.key, required this.stream});

  final Stream stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) => AppBar(
          backgroundColor: snapshot.data == null || snapshot.data != 200
              ? Colors.red
              : Colors.green,
          actions: [
            Text(
              snapshot.data.toString(),
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(
              width: 30,
            ),
          ]),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(100, kTextTabBarHeight);
}
