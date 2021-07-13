import 'package:flutter/material.dart';
import 'package:fusemachines_app_1/presentor/viewmodel/user_list_view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@injectable
class UserDetails extends StatefulWidget {
  static const routeName = "/userDetails";

  @override
  State<StatefulWidget> createState() {
    return _UserDetailsState();
  }
}

class _UserDetailsState extends State<UserDetails> {

  @override
  Widget build(BuildContext context) => Consumer<UserDetailModel>(
        builder: (context, userDetailsModel, child) => Scaffold(
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
                     userDetailsModel.user.avatar ,
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
                  "${userDetailsModel.user.firstName} ${userDetailsModel.user.lastName}",
                  textAlign: TextAlign.left,
                  textScaleFactor: 2,
                ),
                width: double.infinity,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Text(userDetailsModel.user.email, textAlign: TextAlign.left),
                width: double.infinity,
              ),
            ],
          ),
        ),
      );
}
