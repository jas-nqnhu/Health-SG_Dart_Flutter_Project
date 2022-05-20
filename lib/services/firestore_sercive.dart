import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_sg_health/models/profileImg.dart';
import '/models/userProfile.dart';

class FirestoreService {
  // Create a CollectionReference called bookCollection that references
// the firestore collection
  final CollectionReference profileCollection =
      FirebaseFirestore.instance.collection('profile');
  final CollectionReference profileImagesCollection =
      FirebaseFirestore.instance.collection('images');
  Future<void> addProfileData(
      String userId,
      String userName,
      String userEmail,
      String userPhone,
      String address,
      String birthday,
      String height,
      String weight,
      String lastscreening,
      String bloodpresure,
      String chototal,
      String choldl,
      String chohdl,
      String bloodglucose) async {
    await profileCollection.doc().set({
      'id': userId,
      "userName": userName,
      "userEmail": userEmail,
      "userPhone": userPhone,
      "address": address,
      "birthday": birthday,
      "height": height,
      "weight": weight,
      "lastscreening": lastscreening,
      "bloodpresure": bloodpresure,
      "chototal": chototal,
      "choldl": choldl,
      "chohdl": chohdl,
      "bloodglucose": bloodglucose,
    });
  } //addProfileData

  Future<List<User>> readProfileData() async {
    List<User> profileList = [];
    QuerySnapshot snapshot = await profileCollection.get();

    snapshot.docs.forEach((document) {
      User profile = User.fromJson(document.data());
      profileList.add(profile);
    });
    print('Profilelist: $profileList');
    return profileList;
  } //readProfileData

  Future<void> deleteProfileData(String uid) async {
    profileCollection.doc(uid).delete();
    print('deleting uid: ' + uid);
  } //deleteProfileData

  //for your reference
  Future<void> updateProfileData(
      String id,
      String userName,
      String userEmail,
      String userPhone,
      String address,
      String birthday,
      String height,
      String weight,
      String lastscreening,
      String bloodpresure,
      String chototal,
      String choldl,
      String chohdl,
      String bloodglucose) async {     

    await profileCollection.doc("Lq5TNYQBEdFM4axg06Vm").update({
      'id':id,
      "userName": userName,
      "userEmail": userEmail,
      "userPhone": userPhone,
      "address": address,
      "birthday": birthday,
      "height": height,
      "weight": weight,
      "lastscreening": lastscreening,
      "bloodpresure": bloodpresure,
      "chototal": chototal,
      "choldl": choldl,
      "chohdl": chohdl,
      "bloodglucose": bloodglucose,
    });
  } //updateProfileData

//for your reference
  Future<void> deleteUserDoc() async {
    await profileCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  } //deleteUserDoc

  Future<List<ProfileImage>> readProfileImages() async {
    List<ProfileImage> profileImgList = [];
    QuerySnapshot snapshot = await profileImagesCollection.get();

    snapshot.docs.forEach((document) {
      ProfileImage profileImg = ProfileImage.fromJson(document.data());
      profileImgList.add(profileImg);
    });
    print('Profilelist: $profileImgList');
    return profileImgList;
  } 

} //FirestoreService
