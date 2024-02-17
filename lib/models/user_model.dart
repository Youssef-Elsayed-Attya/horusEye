class UserModel {
  final String imagePath;
  final String name;
  final String email;
  final String password;

  const UserModel({
    required this.name,
    required this.email,
    required this.imagePath,
    required this.password,
  });

   UserModel copy(
          {String? imagePath, String? name, String? password, String? email}) =>
      UserModel(
          name: name ?? this.name,
          email: email ?? this.email,
          imagePath: imagePath ?? this.imagePath,
          password: password ?? this.password);

  static UserModel  fromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'],
      email: json['email'],
      imagePath: json['imagePath'],
      password: json['password']);

   Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'password': password
      };
}
