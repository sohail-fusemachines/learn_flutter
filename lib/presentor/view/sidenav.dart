

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnLogout = void Function();

class Sidenav extends StatelessWidget{

  OnLogout onLogoutCallback;

  Sidenav({required this.onLogoutCallback});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: Container(
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(
                  'assets/graphics/fuse_machines.png',
                  alignment: Alignment.center,
                ),
                height: 100,
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child:
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: InkWell(
                    onTap: onLogoutCallback,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child:  Row(
                        children: [
                          Icon(Icons.logout),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Log Out",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                    ,
                  ),
                ),
              )
            ],
          ),
        ));
  }



}