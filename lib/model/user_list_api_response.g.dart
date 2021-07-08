// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserListApiResponse _$UserListApiResponseFromJson(Map<String, dynamic> json) {
  return UserListApiResponse(
    page: (json['page'] as num).toDouble(),
    perPage: (json['per_page'] as num).toDouble(),
    total: (json['total'] as num).toDouble(),
    totalPages: (json['total_pages'] as num).toDouble(),
    data: (json['data'] as List<dynamic>)
        .map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UserListApiResponseToJson(
        UserListApiResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data,
    };
