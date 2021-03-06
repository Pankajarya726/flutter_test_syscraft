import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/users/bloc/user_bloc.dart';
import 'package:fluttertest/users/bloc/user_event.dart';
import 'package:fluttertest/users/item_user.dart';

import 'bloc/user_state.dart';
import 'model/get_user_response.dart';

class UserActivity extends StatefulWidget {
  @override
  _UserActivityState createState() => _UserActivityState();
}

class _UserActivityState extends State<UserActivity> {
  var offers = ["images/image1.jpg", "images/image2.jpg", "images/image3.jpg", "images/image4.jpg", "images/image5.jpg"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(),
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is FailureState) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            child: Icon(
                              Icons.clear,
                              color: Colors.black,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      )),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  titlePadding: EdgeInsets.all(10),
                  contentPadding: EdgeInsets.all(20),
                  actionsPadding: EdgeInsets.all(10),
                  content: Text(
                    "${state.message}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(
                        'Ok',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Color(0xFFefefef),
                appBar: AppBar(
                  elevation: 1,
                  automaticallyImplyLeading: false,
                  centerTitle: false,
                  title: Text("Flutter Test"),
                  actions: [
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("% Offers"),
                    )),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 220,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                offers.length,
                                (index) => Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image(
                                        image: AssetImage(offers[index]),
                                        height: 200,
                                        width: 200,
                                        fit: BoxFit.contain,
                                      ),
                                    )),
                          ),
                        ),
                      ),
                      BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          if (state is UserEmptyState) {
                            BlocProvider.of<UserBloc>(context).add(GetUserEvent(context: context));
                            return CircularProgressIndicator();
                          }

                          if (state is GetUserSuccessState) {
                            if (state.userList.isEmpty) {
                              return Text("Users not found!");
                            }

                            return Column(
                              children: List.generate(state.userList.length, (index) {
                                User user = state.userList[index];
                                return userWidget(user, context);
                              }),
                            );
                          }

                          return CircularProgressIndicator();
                        },
                      )
                    ],
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Color(0xFFe7eaef),
                  selectedItemColor: Colors.red,
                  unselectedItemColor: Colors.grey,
                  selectedLabelStyle: TextStyle(color: Colors.red),
                  unselectedLabelStyle: TextStyle(color: Colors.grey),
                  showUnselectedLabels: true,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                          color: Colors.red,
                        ),
                        label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.search,
                        ),
                        label: "Search"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.add_shopping_cart_outlined,
                        ),
                        label: "Cart"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.account_circle,
                        ),
                        label: "Account"),
                  ],
                ))),
      ),
    );
  }
}
