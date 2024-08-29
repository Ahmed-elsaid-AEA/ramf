import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class STBDataModel extends Equatable {
  final String stbName;
  final String cardInserted;
  final String channelsExist;
  final String streamingChannel;
  final String serial;
  final String events;
  final String sleep;
  final VersionModel version;

  const STBDataModel({
    required this.stbName,
    required this.cardInserted,
    required this.channelsExist,
    required this.streamingChannel,
    required this.serial,
    required this.events,
    required this.sleep,
    required this.version,
  });

  @override
  List<Object> get props => [
        stbName,
        cardInserted,
        channelsExist,
        streamingChannel,
        serial,
        events,
        sleep,
        version,
      ];

  factory STBDataModel.fromJson(Map<String, dynamic> json) {
    return STBDataModel(
      stbName: json['stb_name'],
      cardInserted: json['card_inserted'],
      channelsExist: json['channels_exist'],
      streamingChannel: json['streaming_channel'],
      serial: json['serial'],
      events: json['events'],
      sleep: json['sleep'],
      version: VersionModel.fromJson(json['version']),
    );
  }
}

class VersionModel extends Equatable {
  final String stb;
  final String webApi;
  final String baseStruct;
  final String comment;

  @override
  List<Object> get props => [stb, webApi, baseStruct, comment];

  const VersionModel({
    required this.stb,
    required this.webApi,
    required this.baseStruct,
    required this.comment,
  });

  factory VersionModel.fromJson(Map<String, dynamic> json) {
    return VersionModel(
        stb: json['stb'],
        webApi: json['web_api'],
        baseStruct: json['base_struct'],
        comment: json['comment']);
  }
}
