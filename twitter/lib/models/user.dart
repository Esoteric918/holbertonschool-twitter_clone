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
      };
}
