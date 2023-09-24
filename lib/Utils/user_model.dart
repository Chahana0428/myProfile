class UserModel {
  String? profileImage;
  String? skills;
  String? email;
  String? password;
  String? name;
  String? workExperiences;
  bool? isRemember;

  UserModel({
    this.profileImage,
    this.skills,
    this.email,
    this.password,
    this.name,
    this.workExperiences,
    this.isRemember,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      profileImage: json['profileImage'],
      skills: json['skills'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      workExperiences: json['workExperiences'],
      isRemember: json['isRemember'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profileImage': profileImage,
      'skills': skills,
      'email': email,
      'password': password,
      'name': name,
      'workExperiences': workExperiences,
      'isRemember': isRemember
    };
  }
}
