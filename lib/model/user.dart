
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';


@JsonSerializable()
class User{
 final double id;
 final String email;
 @JsonKey(name: "first_name")
 final String firstName;
 @JsonKey(name: "last_name")
 final String lastName;
 final String avatar;

 User({required this.id, required this.email, required this.firstName, required this.lastName, required this.avatar});

 factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
 Map<String, dynamic> toJson() => _$UserToJson(this);

}