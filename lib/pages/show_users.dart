import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:user_info/models/user.dart';
import 'package:user_info/service/fetch_user_info.dart';


class MyUserList extends StatefulWidget {
   const MyUserList() : super();
  @override
  State<MyUserList> createState() => _MyUserListPageState();
}

class _MyUserListPageState extends State<MyUserList> {
  late List<User> _users;
  late bool _loading;

 @override
  void initState(){
   super.initState();
   _loading = true;

   FetchUserInfo.fetch_info().then((users) {
    setState(() {
      _users = users!;
      _loading = false;
    });
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(_loading? "Loading" : "User List"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users? 0 : _users.length,
            itemBuilder: (context,index){
              User user = _users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
               // leading:  IconButton(icon: Icon(Icons.save, color: Colors.grey,), onPressed: () {  },),
              );
        }),
      ),
    );
  }
}
