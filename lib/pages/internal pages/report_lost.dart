import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/components/Text_field.dart';
import 'package:gaming_accessories_rent_app/components/description.dart';
import 'package:gaming_accessories_rent_app/pages/notification_page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Report_Lost extends StatefulWidget {
  const Report_Lost({super.key});

  @override
  State<Report_Lost> createState() => _Report_LostState();
}

class _Report_LostState extends State<Report_Lost> {
  late final TextEditingController _email;
  late final TextEditingController _address;
  late final TextEditingController _phone;
  late final TextEditingController _username;
  // FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email = TextEditingController();
    _address = TextEditingController();
    _phone = TextEditingController();
    _username = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _address.dispose();
    _phone.dispose();
    _username.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 60, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      scale: 12,
                      color: Colors.black87,
                    ),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Container(
                      child: const Text(
                        "Report",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const NotificationPage()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          // color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        "assets/icons/bell.png",
                        // height: 5,
                        // width: 5,
                        scale: 15,
                        // color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 703,
              decoration: BoxDecoration(
                // color: Colors.white70,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "fill the data to report the Lost items.",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // padding: EdgeInsets.only(left: 100),
                    width: 350,
                    child: Column(
                      children: [
                        Mydes(
                          controller: _email,
                          hintText: "Describe about item you Lost",
                          obscureText: false,
                          enableSuggestions: true,
                          Myicon: Icons.description,
                          Mykeybord: TextInputType.multiline,
                          expand: true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        MyTextField(
                            controller: _address,
                            hintText: 'address were you Lost',
                            obscureText: false,
                            enableSuggestions: true,
                            Myicon: LineAwesomeIcons.location_arrow,
                            Mykeybord: TextInputType.streetAddress,
                            expand: false),
                        const SizedBox(
                          height: 15,
                        ),
                        MyTextField(
                            controller: _phone,
                            hintText: 'Enter phone to contact you',
                            obscureText: false,
                            enableSuggestions: true,
                            Myicon: LineAwesomeIcons.phone,
                            Mykeybord: TextInputType.number,
                            expand: false),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 200,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   CupertinoPageRoute<void>(
                              //     builder: (BuildContext context) => const EditUser(),
                              // ),
                              // );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(255, 93, 78, 1),
                              shape: StadiumBorder(),
                            ),
                            child: Text(
                              "Report",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // child: BigText(
                    //   text: 'Lost Items',
                    // ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
