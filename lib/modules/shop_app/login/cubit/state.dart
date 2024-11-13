
import '../../../../models/shop_app/shop_login.dart';

abstract class shopLoginStates{}

class ShopLoginInitialState extends shopLoginStates{}

class ShopLoginLoadingState extends shopLoginStates{}

class ShopLoginSuccessState extends shopLoginStates{
  final ShopLoginModel loginModel ;

  ShopLoginSuccessState(this.loginModel);
}

class ShopLoginErrorState extends shopLoginStates{

  final String error;

  ShopLoginErrorState(this.error);

}

class ShopChangeVisibilityPasswordState extends shopLoginStates{}
