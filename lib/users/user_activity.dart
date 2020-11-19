import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/users/bloc/user_bloc.dart';
import 'package:fluttertest/users/bloc/user_event.dart';

import 'bloc/user_state.dart';
import 'model/get_user_response.dart';

class UserActivity extends StatefulWidget {
  @override
  _UserActivityState createState() => _UserActivityState();
}

class _UserActivityState extends State<UserActivity> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(),
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {},
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  elevation: 1,
                  automaticallyImplyLeading: false,
                  centerTitle: false,
                  title: Text("Flutter Test"),
                ),
                body: Center(
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserEmptyState) {
                        BlocProvider.of<UserBloc>(context).add(GetUserEvent(context: context));
                        return CircularProgressIndicator();
                      }

                      if (state is GetUserSuccessState) {
                        if (state.userList.isEmpty) {
                          return Text("Users not found!");
                        }

                        return ListView.separated(
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemCount: state.userList.length,
                            itemBuilder: (context, index) {
                              User user = state.userList[index];
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image(
                                          image: AssetImage("images/user_icon.png"),
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.contain,
                                          alignment: Alignment.center,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 5),
                                          width: MediaQuery.of(context).size.width - 130,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                user.name,
                                                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                              ),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    color: Colors.green,
                                                    size: 15,
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width - 150,
                                                    child: Text(
                                                      "${user.address.suite}, ${user.address.street}, ${user.address.city}",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.email,
                                                    color: Colors.green,
                                                    size: 15,
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width - 150,
                                                    child: Text(
                                                      "${user.email}",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.phone,
                                                    color: Colors.green,
                                                    size: 15,
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width - 150,
                                                    child: Text(
                                                      "${user.phone}",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                      }

                      return CircularProgressIndicator();
                    },
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
