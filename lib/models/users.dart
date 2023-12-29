class Users {
  String id;
  String name;
  String phone;
  String email;
  String address;

  Users(
      {this.id = '',
      required this.name,
      required this.email,
      required this.phone,
      required this.address});
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
      };
}
