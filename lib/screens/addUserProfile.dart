import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:project_sg_health/services/firebaseauth_service.dart';
import 'package:project_sg_health/services/firestore_sercive.dart';
import 'package:project_sg_health/services/upload_img.dart';
import 'package:project_sg_health/shared/constants.dart';

class AddProfile extends StatefulWidget {
  AddProfile({Key key}) : super(key: key);

  @override
  _AddProfileState createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  final FirebaseAuthService _fbAuth = FirebaseAuthService();
  final ImageUploads _imageUploads = ImageUploads();
  String userName;
  String userEmail;
  String userPhone;
  String address;
  String birthday;
  String height;
  String weight;
  String lastscreening;
  String bloodpresure;
  String chototal;
  String choldl;
  String chohdl;
  String bloodglucose;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User Profile'),
        backgroundColor: Colors.red[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 32,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.red,
                  child: (_imageUploads.getUphoto()) != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            _imageUploads.getUphoto(),
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(50)),
                          width: 100,
                          height: 100,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
              ),
            ),
            Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration:
                      textInputDecoration.copyWith(hintText: 'User Name'),
                  validator: (val) =>
                      val.length == 0 ? "Enter User Name" : null,
                  onSaved: (val) => this.userName = val,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration:
                      textInputDecoration.copyWith(hintText: 'User Email'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter User Email' : null,
                  onSaved: (val) => this.userEmail = val,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration:
                      textInputDecoration.copyWith(hintText: 'User Phone'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Your Phone Number' : null,
                  onSaved: (val) => this.userPhone = val,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: textInputDecoration.copyWith(hintText: 'Address'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Your Address' : null,
                  onSaved: (val) => this.address = val,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Birth Day'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Your Birth Day' : null,
                  onSaved: (val) => this.birthday = val,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: textInputDecoration.copyWith(hintText: 'Height'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Your Height' : null,
                  onSaved: (val) => this.height = val,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: textInputDecoration.copyWith(hintText: 'Weight'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Your Weight' : null,
                  onSaved: (val) => this.weight = val,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Last Screening'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Your Last Screening' : null,
                  onSaved: (val) => this.lastscreening = val,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Blood Presure'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Your Blood Presure' : null,
                  onSaved: (val) => this.bloodpresure = val,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Blood Glucose'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Your Blood Glucose' : null,
                  onSaved: (val) => this.bloodglucose = val,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Cholesterol'),
                  validator: (val) =>
                      val.length == 0 ? 'Total Cholesterol' : null,
                  onSaved: (val) => this.chototal = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Cholesterol(LDL)'),
                  validator: (val) =>
                      val.length == 0 ? 'LDL Cholesterol' : null,
                  onSaved: (val) => this.choldl = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Cholesterol(HDL)'),
                  validator: (val) =>
                      val.length == 0 ? 'HDL Cholesterol' : null,
                  onSaved: (val) => this.chohdl = val,
                ),
                SizedBox(height: 20.0),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    onPressed: _submit,
                    child: Text('Add Profile'),
                  ),
                ),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    FirestoreService().addProfileData(_fbAuth.getUid(),userName, userEmail, userPhone, address,
        birthday, height, weight, lastscreening, bloodpresure, chototal,choldl,chohdl,bloodglucose);
    Fluttertoast.showToast(
        msg: "Data saved successfully", gravity: ToastGravity.TOP);
  } 
  
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        _imageUploads.imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imageUploads.imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}

