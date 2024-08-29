import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HomeIconsModel extends Equatable {
  final IconData icon;
  final String text;
  final String desc;

  const HomeIconsModel(
      {required this.icon, required this.text, required this.desc});

  @override
  List<Object> get props => [icon, text, desc];
}
