import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/users/model/get_user_response.dart';

Widget userWidget(User user, BuildContext context) {
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
                  image: DecorationImage(image: AssetImage("images/user_icon.png"), fit: BoxFit.contain, alignment: Alignment.center)),
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
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
        ),
        Text(
          "CatchPhrase : ${user.company.catchPhrase}",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
        ),
        Text(
          "bs : ${user.company.bs}",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Color(0xFFe7eaef),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.grey,
                  size: 15,
                ),
                Text(
                  "4.5",
                  style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Text(
              "9 hours",
              style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.normal),
            ),
            Text(
              "\$500",
              style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ],
        )
      ],
    ),
  );
}
