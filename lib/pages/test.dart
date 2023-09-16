import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/components/testfield.dart';

class Mytest extends StatefulWidget {
  const Mytest({super.key});

  @override
  State<Mytest> createState() => _MytestState();
}

class _MytestState extends State<Mytest> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  void update() {
    FirebaseFirestore.instance
        .collection("yesy")
        .add({
          "email": _email.text,
          "password": _password.text,
        })
        .then((snapshot) => print("User Added"))
        .catchError((onError) => print("error found"));
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (isValid) {
      update();
    }
    _formKey.currentState!.save();
  }

  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();
  late final TextEditingController _number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Validation"),
        leading: Icon(Icons.filter_vintage),
      ),
      //body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //form
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                "Form-Validation In Flutter ",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              //styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //       hintText: "email",
              //       enabledBorder: const OutlineInputBorder(
              //         borderSide: BorderSide(
              //           color: Colors.white,
              //         ),
              //       ),
              //       focusedBorder: const OutlineInputBorder(
              //         borderSide: BorderSide(
              //           color: Colors.white,
              //         ),
              //       ),
              //       fillColor: Colors.grey.shade100,
              //       filled: true,
              //       focusColor: Colors.red[300],
              //       suffixIcon: Icon(Icons.percent),
              //       suffixIconColor: Colors.grey,
              //       hintStyle: TextStyle(
              //         fontFamily: 'Poppins',
              //         fontSize: 12,
              //         color: Colors.grey[500],
              //       )),
              //   keyboardType: TextInputType.emailAddress,
              //   onFieldSubmitted: (value) {
              //     //Validator
              //   },
              //   validator: (value) {
              //     if (value!.isEmpty ||
              //         !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              //             .hasMatch(value)) {
              //       return 'Enter a valid email!';
              //     }
              //     return null;
              //   },
              // ),
              //box styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              //text input
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                // maxLines: 5,
                // validator: validator,
                cursorColor: Colors.red[300],
                controller: _email,
                autofocus: true,
                obscureText: false,
                enableSuggestions: true,
                expands: false,
                decoration: InputDecoration(
                    hintText: "enter the email",
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    focusColor: Colors.red[300],
                    suffixIcon: Icon(Icons.person),
                    suffixIconColor: Colors.grey,
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: Colors.grey[500],
                    )),
                // keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (value) {
                  return vEmail(value);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                // maxLines: 5,
                // validator: validator,
                cursorColor: Colors.red[300],
                controller: _password,
                autofocus: true,
                obscureText: false,
                enableSuggestions: true,
                expands: false,
                decoration: InputDecoration(
                    hintText: "enter the Password",
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    focusColor: Colors.red[300],
                    suffixIcon: Icon(Icons.lock),
                    suffixIconColor: Colors.grey,
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: Colors.grey[500],
                    )),
                // keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (value) {
                  return vPassword(value);
                },
              ),

              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              ElevatedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                onPressed: () => _submit(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String? vEmail(value) {
  if (value!.isEmpty ||
      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
    return 'Enter a valid email!';
  }
  return null;
}

String? vPassword(value) {
  if (value!.isEmpty || value.length > 8) {
    return 'Enter a valid password!';
  }
  return null;
}

String? vName(value) {
  if (value!.isEmpty ||
      !RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
          .hasMatch(value)) {
    return 'Enter a valid name!';
  }
  return null;
}

String? vPhone(value) {
  if (value!.isEmpty || !RegExp(r"^\+?0[0-9]{10}$").hasMatch(value)) {
    return 'Enter a valid PhoneNo!';
  }
  return null;
}
