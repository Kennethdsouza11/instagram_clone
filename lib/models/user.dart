class User {
  final String email;
  final String password;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;
  final String uid;

  const User({
    required this.email,
    required this.password,
    required this.photoUrl,
    required this.username,
    required this.followers,
    required this.following,
    required this.bio,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "bio": bio,
        "photoUrl": photoUrl,
        "followers": followers,
        "following": following,
      };
}
