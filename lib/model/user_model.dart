class UserModel {
  final String uid;
  final String name;
  final String email;
  final String image;
  final DateTime lastActive;
  bool isOnline;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.image,
    required this.lastActive,
    this.isOnline = false,
  });

  factory UserModel.formJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        name: json['name'],
        email: json['email'],
        image: json['image'],
        lastActive: json['lastActive'].toDate(),
        isOnline: json['isOnline'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'image': image,
        'lastActive': lastActive,
        'isOnline': isOnline,
      };
}
