class Users {
  String id;
 String? docId;
  String name;
  String phone;
  String email;

  Users(
      {this.id = '',
       this.docId ,
      required this.name,
      required this.email,
      required this.phone,
      });
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      docId: json['docId'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],

    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'docId': docId,
        'name': name,
        'email': email,
        'phone': phone,
      };
}
