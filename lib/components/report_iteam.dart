import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ReportContiner extends StatelessWidget {
  const ReportContiner({
    super.key,
    required this.id,
  });
  final String? id;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width - 20,
        height: 250,
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3))]),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(255, 93, 78, 1)),
              width: MediaQuery.of(context).size.width * 0.4,
              height: 200,
              child: Image.asset(
                "assets/images/photo.jpg",
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Center(
                    child: Text(
                      "I lost my dog",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
                new Container(
                  // padding: new EdgeInsets.only(right: 8.0),
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Center(
                    child: new Text(
                      'Exactly 2 minutes in length and filmed in a single take, the film revolves around a father (Fabián Hurtado) and daughter (Carina Pámenes) as they',
                      overflow: TextOverflow.fade,
                      style: new TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFF212121),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  // padding: new EdgeInsets.only(right: 13.0),
                  // height: 80,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "14 days",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 10,
                        ),
                      ),
                      ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(LineAwesomeIcons.arrow_circle_right),
                          label: Text("data")),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
