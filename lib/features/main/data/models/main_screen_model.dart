import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MainScreenModel extends Equatable {
  final IconData icon;
  final String label;
  final Widget screenWidget;

  @override
  List<Object> get props => [icon, label, screenWidget];

  const MainScreenModel({
    required this.icon,
    required this.label,
    required this.screenWidget,
  });
}
