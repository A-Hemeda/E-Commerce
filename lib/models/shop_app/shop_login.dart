class ShopLoginModel {
  bool? status ;
  String? message;
  LoginUserData? data;
  ShopLoginModel.fromJson(Map<String , dynamic> json){
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? LoginUserData.fromJson(json['data']) : null;
  }
}

class LoginUserData {
  int? id ;
  String? name ;
  String? email ;
  String? phone;
  String? image;
  int? points ;
  int? credit ;
  String? token ;

  // named constructor

  LoginUserData.fromJson(Map<String , dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }

}