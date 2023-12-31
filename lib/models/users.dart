class Users {
  String id;
 String? docId;
  String name;
  String phone;
  String email;
  String address;

  Users(
      {this.id = '',
       this.docId ,
      required this.name,
      required this.email,
      required this.phone,
      required this.address});
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      docId: json['docId'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'docId': docId,
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
      };
}
