import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/components/show_confirm_dialog.dart';
import 'package:gaming_accessories_rent_app/pages/editeuser.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Contacted_user_details extends StatefulWidget {
  final String username;

  final String email;

  final String phone;

  final String address;

  const Contacted_user_details({
    super.key,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
    // required this.username,
  });

  @override
  State<Contacted_user_details> createState() => _Contacted_user_detailsState();
}

class _Contacted_user_detailsState extends State<Contacted_user_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40, left: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // const Icon(
                //   Icons.menu,
                //   size: 30,
                //   color: Colors.black87,
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    "assets/icons/left.png",
                    scale: 16,
                    color: Colors.black87,
                  ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Container(
                    child: const Text(
                      "Profile",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(8),
            height: 700,
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white70,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(180),
                        child: Image.asset(
                          "assets/images/no_image.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.red[300],
                        ),
                        child: Icon(LineAwesomeIcons.alternate_pencil),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "username",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "username",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "username",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "username",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => EditUser()),
                      ).then((value) => setState(() {}));
                      // Navigator.of(context).push(
                      //   MaterialPageRoute<void>(
                      //     builder: (BuildContext context) =>
                      //         const Mytest(),
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 93, 78, 1),
                      shape: StadiumBorder(),
                    ),
                    child: const Text(
                      "Edit data",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
