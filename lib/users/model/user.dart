class User {
  int id;
  String email;
  String password;
  String name;
  User(
    this.id,
    this.email,
    this.password,
    this.name,
  );
  factory User.fromJson(Map<String, dynamic> json) =>
      User(
        int.parse(json['id']),
        json['email'],
        json['password'],
        json['name'],
        );
  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'email': email.toString(),
        'password': password.toString(),
        'name': name.toString(),
      };
}
