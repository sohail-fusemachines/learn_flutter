
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusemachines_app_1/model/user.dart';
import 'package:fusemachines_app_1/presentor/cubit/user_list/user_list_cubit.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@injectable
class UserList extends StatefulWidget {
  static const routeName = "/userList";

  @override
  State<StatefulWidget> createState() {
    return _UserListState();
  }
}

class _UserListState extends State<UserList> {

  UserListCubit get _cubit => super.context.read<UserListCubit>();

  List<User> listOfUsers = [];
  bool isLoading = false;
  ScrollController _scrollController = ScrollController();

  void addScrollListenerForListOfUsers() async {
    _scrollController.addListener(() {
      bool isBottomOfPage = (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent);
      if (isBottomOfPage == true) {
        fetchNextPageOfUsers();
      }
    });
  }

  void fetchListOfUsers() {
    _cubit.getListOfUsers();
  }

  void fetchNextPageOfUsers() {
    _cubit.getNextPageOfUsers();
  }

  void showLoading() {
    setState(() {
      this.isLoading = true;
    });
  }

  void clearUserList() {
    setState(() {
      listOfUsers.clear();
    });
  }

  @override
  void initState() {
    addScrollListenerForListOfUsers();
    fetchListOfUsers();
  }

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<UserListCubit, UserListState>(builder: (context, state) {
        switch(state.runtimeType){
          case UserListLoading: {
            return this.showProgressIndicator();
          }
        }
        return this.showMainBody(context);
      },listener: (context, state) {
        switch(state.runtimeType){
          case UserListLoaded: {
            setState(() {
              this.listOfUsers.addAll((state as UserListLoaded).listOfUser);
            });

            break;
          }
          case UserListNextPage: {
            setState(() {
              this.listOfUsers.addAll((state as UserListNextPage).listOfUser);
            });
            break;
          }
          }
        }
      );
          // this.isLoading ? this.showProgressIndicator() : this.showMainBody(value)));


  Widget showMainBody(BuildContext context ) => Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: RefreshIndicator(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return getUserCard(listOfUsers[index], context);
                    },
                    itemCount: listOfUsers.length,
                    controller: _scrollController,
                  ),
                  onRefresh: () async {
                     _cubit.getListOfUsers();
                  },
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  if (listOfUsers.isEmpty)
                    getButtonThatMatchParent("Fetch Users", () {
                      fetchListOfUsers();
                    }),
                  if (listOfUsers.isEmpty != true)
                    getButtonThatMatchParent("Clear", clearUserList)
                ],
              ),
            )
          ],
        ),
      );

  Widget getUserCard(User user, [BuildContext? context]) => Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
      child: GestureDetector(
        onTap: () {
          context?.read<UserListCubit>().selectedUser(user);

        },
        child: Card(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Hero(
            tag: 'userImage',
            child: Expanded(
              flex: 1,
              child: Image.network(user.avatar),
            ),
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(children: [
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                      child: Text(
                        "${user.firstName} ${user.lastName}",
                        textAlign: TextAlign.left,
                        textScaleFactor: 1.2,
                        style: TextStyle(color: Colors.black.withOpacity(1.0)),
                      )),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                    child: Text(
                      "${user.email}",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ]),
              ),
              flex: 3)
        ])),
      ));

  Widget getButtonThatMatchParent(String text,
          [VoidCallback? onClickCallback = null]) =>
      SizedBox(
        width: double.infinity,
        child: MaterialButton(
          onPressed: (onClickCallback == null) ? () {} : onClickCallback,
          child: Text(text, style: TextStyle(color: Colors.white)),
          color: Colors.deepOrangeAccent,
          padding: EdgeInsets.symmetric(vertical: 8),
        ),
      );

  Widget showProgressIndicator() => Center(
        child: CircularProgressIndicator(),
      );
}
