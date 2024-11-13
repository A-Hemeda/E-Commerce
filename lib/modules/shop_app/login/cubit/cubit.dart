import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/shop_app/login/cubit/state.dart';
import '../../../../models/shop_app/shop_login.dart';
import '../../../../shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<shopLoginStates> {



  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin(
  {
    required String email , 
    required String password
  })
{
    ShopLoginModel loginModel ; 
    emit(ShopLoginLoadingState());
    DioHelper.postData(
        url: 'login',
        data: {
          'email':email,
          'password':password,
        }
    ).then((value){
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((error){
        emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined ;
  bool isPassword = true ;

  void changeSuffixIcon (){
    isPassword = !isPassword ;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ShopChangeVisibilityPasswordState());
  }

}