import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_kulina/api/models/banner.dart';

part 'data_response.g.dart';

@JsonSerializable()
class DataResponse extends Equatable {
  final List<Banner> data;
  final int page;
  final int size;
  final int total;

  const DataResponse({
    required this.data,
    required this.page,
    required this.size,
    required this.total,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  @override
  List<Object?> get props => [
        data,
        page,
        size,
        total,
      ];
}
