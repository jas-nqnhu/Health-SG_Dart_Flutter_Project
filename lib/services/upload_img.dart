import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import '/services/firebaseauth_service.dart';

class ImageUploads {
  final FirebaseAuthService _fbAuth = FirebaseAuthService();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File _photo ;
  File getUphoto() {
    File _userphoto = _photo;
    return _userphoto;
  }
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      uploadFile();
    } else {
      print('No image selected.');
    }
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      uploadFile();
    } else {
      print('No image selected.');
    }
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo.path);
    final destination = 'files/$fileName';
    final uid = _fbAuth.getUid();

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo);
      final String downloadUrl = await ref.getDownloadURL();

      // Add img url to firestore
      await FirebaseFirestore.instance
          .collection("images")
          .add({"url": downloadUrl, "name": fileName, "uid": uid });
    } catch (e) {
      print('error occured');
    }
  }
}
