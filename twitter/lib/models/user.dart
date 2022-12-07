import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String key;
  String userID;
  String email;
  String name;
  String userName;
  String displayName;
  String imageUrl;
  int followers;
  int following;
  List<String> followersList;
  List<String> followingList;
  String bio = '';
  String coverImgurl = '';

  UserData({
    this.key = 'key',
    this.userID = 'userID',
    this.email = 'email',
    this.name = 'name',
    this.userName = 'userName',
    this.displayName = 'displayName',
    this.imageUrl = 'imageUrl',
    this.followers = 0,
    this.following = 0,
    this.followersList = const [''],
    this.followingList = const [''],
    this.bio = 'No Bio available',
    this.coverImgurl = 'https://www.w3schools.com/howto/img_avatar.png',
  });

  static UserData fromJson(Map<String, dynamic> json) => UserData(
        key: json["key"],
        userID: json["userID"],
        email: json["email"],
        name: json["name"],
        userName: json["userName"],
        displayName: json["displayName"],
        imageUrl: json["imageUrl"],
        followers: json["followers"],
        following: json["following"],
        followersList: ["followersList"],
        followingList: ["followingList"],
        bio: json["bio"],
        coverImgurl: json["coverImgurl"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "userID": userID,
        "email": email,
        "name": name,
        "userName": userName,
        "displayName": displayName,
        "imageUrl": imageUrl,
        "followers": followers,
        "following": following,
        "followersList": followersList,
        "followingList": followingList,
        "bio": bio,
        "coverImgurl": coverImgurl,
      };

  // Future<UserData> getUserByID(String userID) async {
  //   return await FirebaseFirestore.instance
  //       .collection('userData')
  //       .doc(userID)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       return documentSnapshot.data();
  //     } else {
  //       return UserData();
  //     }
  //   });
  // }
}
