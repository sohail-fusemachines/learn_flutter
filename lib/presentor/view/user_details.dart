import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusemachines_app_1/presentor/cubit/user_list/user_list_cubit.dart';

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
  Widget build(BuildContext context) => BlocBuilder<UserListCubit, UserListState>(builder: (context, state  ) =>   Scaffold(
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
              child:   (state is UserListItemClicked) ? Image.network(
                  state.user.avatar  ,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ) : Text("Profile image not avilable."),
            ),
          ),
          width: double.infinity,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Text(
            (state is UserListItemClicked) ? "${state.user.firstName} ${state.user.lastName}" : "Not Avilable",
            textAlign: TextAlign.left,
            textScaleFactor: 2,
          ),
          width: double.infinity,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Text( (state is UserListItemClicked) ? state.user.email : "Not Avilable", textAlign: TextAlign.left),
          width: double.infinity,
        ),
      ],
    ),
  ),);

}
