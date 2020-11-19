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
  var offers = [
    "images/image1.jpg",
    "images/image2.jpg",
    "images/image3.jpg",
    "images/image4.jpg",
    "images/image5.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(),
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {},
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
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: Color(0xFFffffff),
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey),
                                                image: DecorationImage(
                                                    image: AssetImage("images/user_icon.png"),
                                                    fit: BoxFit.contain,
                                                    alignment: Alignment.center)),
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
                                                  style: TextStyle(
                                                      color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
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
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.web,
                                                      color: Colors.green,
                                                      size: 15,
                                                    ),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width - 150,
                                                      child: Text(
                                                        "${user.website}",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Company Name: ${user.company.name}",
                                        style:
                                            TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "CatchPhrase : ${user.company.catchPhrase}",
                                        style:
                                            TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "bs : ${user.company.bs}",
                                        style:
                                            TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                );
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
