import 'package:equatable/equatable.dart';

class ReturnTPListMode extends Equatable {
  final int freq;
  final int sr;
  final int polarity;

  const ReturnTPListMode({
    required this.freq,
    required this.sr,
    required this.polarity,
  });

  factory ReturnTPListMode.fromJson(Map<String, dynamic> json) {
    return ReturnTPListMode(
      freq: json['freq'],
      sr: json['sr'],
      polarity: json['polarity'],
    );
  }

  @override
  List<Object> get props => [freq, sr, polarity];
}
