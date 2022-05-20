import 'package:flutter/material.dart';
import '/screens/updateUserProfile.dart';
import '/services/firebaseauth_service.dart';
import '/models/userProfile.dart';
import '/services/firestore_sercive.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowRecordsPage extends StatefulWidget {
  @override
  _ShowRecordsPageState createState() => _ShowRecordsPageState();
}

class _ShowRecordsPageState extends State<ShowRecordsPage> {
  final FirebaseAuthService _fbAuth = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.red[800],
      ),

      body: FutureBuilder<List<User>>(
        future: FirestoreService().readProfileData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  if (snapshot.data[index].id.toString() == _fbAuth.getUid()) {
                    return Container(
                      child: Column(
                        children: <Widget>[
                          //Personal Infomation
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'My Personal Infomation',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(
                                      color: Colors.grey,
                                      height: 1,
                                      thickness: 3,
                                      endIndent: 0,
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Name: ' +
                                                  snapshot.data[index].userName,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            Text(
                                              'Email: ' +
                                                  snapshot
                                                      .data[index].userEmail,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            Text(
                                              'Phone: ' +
                                                  snapshot
                                                      .data[index].userPhone,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            Text(
                                              'Address: ' +
                                                  snapshot.data[index].address,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            Text(
                                              'Birth Date: ' +
                                                  snapshot.data[index].birthday,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            Text(
                                              'Height: ' +
                                                  snapshot.data[index].height +
                                                  ' m',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            Text(
                                              'Weight: ' +
                                                  snapshot.data[index].weight +
                                                  ' kg',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              elevation: 10.0,
                            ),
                          ),
                          //Health Records
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'My Health Records',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                      'Last screening done on '),
                                                  Text(
                                                    snapshot.data[index]
                                                        .lastscreening,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.info_outline,
                                              size: 40, color: Colors.indigo),
                                        ),
                                      ],
                                    ),

                                    //Screen Devider
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Divider(
                                        color: Colors.grey,
                                        height: 1,
                                        thickness: 3,
                                        endIndent: 0,
                                      ),
                                    ),
                                    //Blood Pressure
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Blood Pressure'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                snapshot
                                                    .data[index].bloodpresure,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text('mmHg')
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    //Screen Devider
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Divider(
                                        color: Colors.grey,
                                        height: 1,
                                        thickness: 3,
                                        endIndent: 0,
                                      ),
                                    ),

                                    //Blood Glucose

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Blood Glucose'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                snapshot
                                                    .data[index].bloodglucose,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text('mmol/L')
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    //Screen Devider
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Divider(
                                        color: Colors.grey,
                                        height: 1,
                                        thickness: 3,
                                        endIndent: 0,
                                      ),
                                    ),

                                    //Cholesterol
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Cholesterol'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text('Total'),
                                                      SizedBox(
                                                        width: 13,
                                                      ),
                                                      Text('LDL'),
                                                      SizedBox(
                                                        width: 14,
                                                      ),
                                                      Text('HDL'),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        snapshot.data[index]
                                                            .chototal,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 22,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 13,
                                                      ),
                                                      Text(
                                                        snapshot
                                                            .data[index].choldl,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 22,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 13,
                                                      ),
                                                      Text(
                                                        snapshot
                                                            .data[index].chohdl,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 22,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 27.0),
                                                child: Text('mmol/L'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    //Screen Devider
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Divider(
                                        color: Colors.grey,
                                        height: 1,
                                        thickness: 3,
                                        endIndent: 0,
                                      ),
                                    ),

                                    Column(
                                      children: [
                                        //Other Screening
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('Other Screening'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: Colors.lightGreen),
                                            ),
                                          ],
                                        ),
                                        //Immunisation
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('Immunisation'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: Colors.lightGreen),
                                            ),
                                          ],
                                        ),
                                        //Discharge Information
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child:
                                                  Text('Discharge Information'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: Colors.lightGreen),
                                            ),
                                          ],
                                        ),
                                        //Medication
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('Medication'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: Colors.lightGreen),
                                            ),
                                          ],
                                        ),
                                        //Health Risk Assessment
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  'Health Risk Assessment'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: Colors.lightGreen),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              elevation: 10.0,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateRecordPage()),
                                );
                              },
                              child: Text(
                                'UPDATE MY HEALTH PROFILE',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.red[900],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
      
    );
  }
}
