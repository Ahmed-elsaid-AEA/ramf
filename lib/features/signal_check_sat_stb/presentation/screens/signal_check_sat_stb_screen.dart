import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramf2_app/core/resources/const_values.dart';

class SignalCheckSatSTBScreen extends StatelessWidget {
  const SignalCheckSatSTBScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var ip = Get.arguments[ConstValues.kIp];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(ip),
      ),
    );
  }
}
