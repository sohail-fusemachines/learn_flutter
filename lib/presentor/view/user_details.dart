import 'package:flutter/material.dart';
import 'package:fusemachines_app_1/presentor/viewmodel/user_list_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserDetails extends StatefulWidget {
  static const routeName = "/userDetails";

  UserDetailModel _userDetailModel;

  UserDetails(this._userDetailModel);

  @override
  State<StatefulWidget> createState() {
    return _UserDetailsState(this._userDetailModel);
  }
}

class _UserDetailsState extends State<UserDetails> {
  String imageSrc = "";
  String name = "";
  String email = "";

  UserDetailModel _userDetailModel;

  _UserDetailsState(this._userDetailModel);

  @override
  void initState() {
    _observeUserDetails();
    super.initState();
  }

  void _observeUserDetails() {
    this.imageSrc = this._userDetailModel.user.avatar;
    this.name = this._userDetailModel.user.firstName +
        " " +
        this._userDetailModel.user.lastName;
    this.email = this._userDetailModel.user.email;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("User Details"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              child: Hero(
                tag: 'userImage',
                child: Expanded(
                  flex: 1,
                  child: Image.network(
                    imageSrc,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              width: double.infinity,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Text(
                name,
                textAlign: TextAlign.left,
                textScaleFactor: 2,
              ),
              width: double.infinity,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Text(email, textAlign: TextAlign.left),
              width: double.infinity,
            ),
          ],
        ),
      );
}
