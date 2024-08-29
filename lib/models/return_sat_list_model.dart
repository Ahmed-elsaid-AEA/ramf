import 'package:equatable/equatable.dart';

class ReturnSatListModel extends Equatable {
  final String satDegree;
  final String satName;
  final String direction;
  final int satID;

  const ReturnSatListModel(
      {required this.satDegree,
      required this.satName,
      required this.satID,
      required this.direction});

  factory ReturnSatListModel.fromJson(Map<String, dynamic> json) {
    return ReturnSatListModel(
      satID: json['sat_id'],
      satDegree: json['sat_degree'],
      satName: json['sat_name'],
      direction: json['direction'],
    );
  }

  @override
  List<Object> get props => [satDegree, satName, direction];
}
