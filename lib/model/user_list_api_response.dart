import 'package:fusemachines_app_1/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_list_api_response.g.dart';

@JsonSerializable()
class UserListApiResponse {
  final double page;
  @JsonKey(name: "per_page")
  final double perPage;
  final double total;
  @JsonKey(name: "total_pages")
  final double totalPages;
  final List<User> data;

  UserListApiResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data

  });

  factory UserListApiResponse.fromJson(Map<String, dynamic> json) => _$UserListApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserListApiResponseToJson(this);



}