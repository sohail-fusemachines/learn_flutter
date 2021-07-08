import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  static const routeName = "/userDetails";

  String imageSrc;
  String name;
  String email;

  UserDetails(this.name, this.email, this.imageSrc);

  @override
  State<StatefulWidget> createState() {
    return _UserDetailsState(name, email, imageSrc);
  }
}

class _UserDetailsState extends State<UserDetails> {

  String imageSrc;
  String name;
  String email;

  _UserDetailsState(this.name, this.email, this.imageSrc);

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

              child: Hero( tag: 'userImage',
                child: Expanded(  flex: 1,
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
