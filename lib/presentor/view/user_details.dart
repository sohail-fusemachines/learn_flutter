import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusemachines_app_1/presentor/bloc/user_list/user_list_bloc.dart';
import 'package:injectable/injectable.dart';

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
  Widget build(BuildContext context) =>
      BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) => Scaffold(
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
                  tag: state.maybeMap(
                    onClick: (value) => value.user.avatar,
                    orElse: () => "",
                  ),
                  child: Expanded(
                    flex: 1,
                    child: state.maybeMap(
                        onClick: (value) => Image.network(
                              value.user.avatar,
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                        orElse: () => Text("Profile image unavilable")),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: state.maybeMap(
                    onClick: (value) => Text(
                          "${value.user.firstName} ${value.user.lastName}",
                          textAlign: TextAlign.left,
                          textScaleFactor: 2,
                        ),
                    orElse: () => Text("Not Avilable")),
                width: double.infinity,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: state.maybeMap(
                    onClick: (value) =>
                        Text(value.user.email, textAlign: TextAlign.left),
                    orElse: () => Text("Not Avilable")),
                width: double.infinity,
              ),
            ],
          ),
        ),
      );
}
