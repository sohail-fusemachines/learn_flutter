import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusemachines_app_1/model/user.dart';
import 'package:fusemachines_app_1/presentor/view/login.dart';
import 'package:fusemachines_app_1/presentor/view/user_details.dart';
import 'package:fusemachines_app_1/presentor/viewmodel/user_list_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserList extends StatefulWidget {
  static const routeName = "/userList";

  UserListViewModel viewModel;

  UserList(this.viewModel);

  @override
  State<StatefulWidget> createState() {
    return _UserListState(viewModel);
  }
}

class _UserListState extends State<UserList> {
  _UserListState(this.viewModel);

  UserListViewModel viewModel;
  List<User> listOfUsers = [];
  bool isLoading = false;

  ScrollController _scrollController = ScrollController();

  void addScrollListenerForListOfUsers() {
    _scrollController.addListener(() {
      bool isBottomOfPage = (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent);
      print("scroll pixels: ${_scrollController.position.pixels}");
      if (isBottomOfPage == true) {
        fetchNextPageOfUsers();
      }
    });
  }

  void fetchListOfUsers() {
    showLoading();
    viewModel.getListOfUsers().then((List<User> value) {
      setState(() {
        this.isLoading = false;
        this.listOfUsers.addAll(value);
        print("list of users: ${listOfUsers}");
      });
    });
  }

  void fetchNextPageOfUsers() {
    viewModel.getNextPageOfUsers()?.then((listOfUsers) {
      setState(() {
        this.listOfUsers.addAll(listOfUsers);
        print("list of users: ${this.listOfUsers}");
      });
    });
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

  void logOut() {
    viewModel.clearPreferencecs();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Login.routeName, (route) => false);
  }

  @override
  void initState() {
    addScrollListenerForListOfUsers();
    fetchListOfUsers();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body:
          this.isLoading ? this.showProgressIndicator() : this.showMainBody());

  Widget showMainBody() => Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: RefreshIndicator(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return getUserCard(listOfUsers[index]);
                    },
                    itemCount: listOfUsers.length,
                    controller: _scrollController,
                  ),
                  onRefresh: () async {
                    await viewModel.getListOfUsers().then((value) {
                      setState(() {
                        this.listOfUsers.clear();
                        this.listOfUsers.addAll(value);
                      });
                    });
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

  Widget getUserCard(User user) => Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(UserDetails.routeName, arguments: user);
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
