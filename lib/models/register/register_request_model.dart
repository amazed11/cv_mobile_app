class RegisterRequestModel {
  final String? fullName;
  final String? email;
  final String? phone;
  final String? password;

  RegisterRequestModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "name": fullName,
        "email": email,
        "contact": phone,
        "password": password,
      };
}
